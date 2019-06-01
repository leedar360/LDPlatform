package com.fh.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.*;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.fh.util.PageData;
import com.fh.util.Tools;
/**
* 导入到EXCEL
* 类名称：ObjectExcelView.java
* @author FH Q313596790
* @version 1.0
 */
public class ObjectGenPIExcelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Date date = new Date();
		String filename = Tools.date2Str(date, "yyyyMMddHHmmss");
		HSSFSheet sheet;
		HSSFSheet sheet2;
		HSSFCell cell;
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename+".xls");
		sheet = workbook.createSheet("sheet1");
		sheet2=  workbook.createSheet("afsalepicsheet");

		List<String> titles = (List<String>) model.get("titles");
		int len = titles.size();
		HSSFCellStyle headerStyle = workbook.createCellStyle(); //标题样式
		headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFFont headerFont = workbook.createFont();	//标题字体
		headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		headerFont.setFontHeightInPoints((short)11);
		headerStyle.setFont(headerFont);
		short width = 20,height=25*20;
		sheet.setDefaultColumnWidth(width);
		sheet2.setDefaultColumnWidth(width);
		for(int i=0; i<len; i++){ //设置标题
			String title = titles.get(i);
			cell = getCell(sheet, 0, i);
			cell.setCellStyle(headerStyle);
			setText(cell,title);
		}
		sheet.getRow(0).setHeight(height);
		
		HSSFCellStyle contentStyle = workbook.createCellStyle(); //内容样式
		contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		List<PageData> varList = (List<PageData>) model.get("varList");
		int varCount = varList.size();
		for(int i=0; i<varCount; i++){
			PageData vpd = varList.get(i);
			for(int j=0;j<len;j++){
				String varstr = vpd.getString("var"+(j+1)) != null ? vpd.getString("var"+(j+1)) : "";
				cell = getCell(sheet, i+1, j);
				cell.setCellStyle(contentStyle);
				setText(cell,varstr);
			}
			
		}


		// sheet2 写入 pic
		List<PageData> picvarList = (List<PageData>) model.get("varAFPicList");
		HSSFPatriarch patriarch = sheet2.createDrawingPatriarch();

		//		ImageIO
		int pvarCount = picvarList.size();
		// 得到 售后 pic list集合
		Iterator<PageData> iter = picvarList.iterator();
		int pici = 0;  // row number
		int picj = 0;       // column number
		String strODER_ID = "";
		String strPicfilepath = "";
		while(iter.hasNext()){
			PageData vpd = iter.next();

			// 判断 是否有重复 订单号
			if(!strODER_ID.equals(vpd.getString("afpicvar2"))) {
				//写售后图片的头部
				for (int j = 0; j < vpd.size(); j++) {
					String varstr = vpd.getString("afpicvar" + (j + 1)) != null ? vpd.getString("afpicvar" + (j + 1)) : "";
					cell = getCell(sheet2, pici * 25, j);   //一个订单号的跨度 是 25行  i*25
					cell.setCellStyle(contentStyle);
					if (j==0){
						setText(cell, "订单编号：");
					}
					else{setText(cell, varstr);}
				}
				pici++; 	// 第一行已经加1
				picj=0;     // 换行后 列初始化为零
			}
			strODER_ID = vpd.getString("afpicvar2");
			strPicfilepath = PathUtil.getClasspath() + Const.FILEPATHIMG + vpd.getString("afpicvar1");

			String fileType=strPicfilepath.substring(strPicfilepath.lastIndexOf("."),strPicfilepath.length());
			// 插入jpg文件
//			if (fileType.equals(".jpg")) {
				// eg:insertImage(HSSFWorkbook wb,HSSFPatriarch pa,byte[] data,int row,int column)
				this.insertImage(workbook, patriarch, this.getImageData(strPicfilepath), (pici - 1) * 25 + 2, picj + 1);
//			}
			// 插入png文件
//			if (fileType.equals(".png")) {
				// eg:insertImage(HSSFWorkbook wb,HSSFPatriarch pa,byte[] data,int row,int column)
//				this.insertPNGImage(workbook, patriarch, this.getImageData(strPicfilepath), (pici - 1) * 25 + 2, picj + 1);
//			}
			picj++;
		}

	}



	//从图片里面得到字节数组
	private byte[] getImageData(String picFile) throws IOException{
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		BufferedImage bufferImg =null;
//		picFile = "d:/2.jpg";

		picFile = picFile.substring(picFile.lastIndexOf("."),picFile.length());


		try{
			bufferImg = ImageIO.read( new File( picFile ) );
			ImageIO.write(bufferImg,"JPG",bout);
			return bout.toByteArray();
		}catch(IOException ex){
			ex.printStackTrace();
			return null;
		}
		finally {
			if (bout != null)
			bout.close();
		}

	}

	//自定义的方法,插入某个图片到指定索引的位置
	//	关于HSSFClientAnchor(dx1,dy1,dx2,dy2,col1,row1,col2,row2)的参数，有必要在这里说明一下：
	//	dx1：起始单元格的x偏移量，如例子中的255表示直线起始位置距A1单元格左侧的距离；
	//	dy1：起始单元格的y偏移量，如例子中的125表示直线起始位置距A1单元格上侧的距离；
	//	dx2：终止单元格的x偏移量，如例子中的1023表示直线起始位置距C3单元格左侧的距离；
	//	dy2：终止单元格的y偏移量，如例子中的150表示直线起始位置距C3单元格上侧的距离；
	//	col1：起始单元格列序号，从0开始计算；
	//	row1：起始单元格行序号，从0开始计算，如例子中col1=0,row1=0就表示起始单元格为A1；
	//	col2：终止单元格列序号，从0开始计算；
	//	row2：终止单元格行序号，从0开始计算，如例子中col2=2,row2=2就表示起始单元格为C3；
	//  Link : https://www.cnblogs.com/firstcsharp/p/4896121.html

	/**
	 * row2 = row1 + 18 行； col2 = col1 + 3 列
	 * @param wb
	 * @param pa
	 * @param data
	 * @param row
	 * @param column
	 */

	private void insertImage(HSSFWorkbook wb,HSSFPatriarch pa,byte[] data,int row,int column){
		int x1=250;
		int y1=20;
		int x2=300;
		int y2=40;
		HSSFClientAnchor anchor = new HSSFClientAnchor(x1,y1,x2,y2,(short)(4*column-4),row,(short)(4*column-1),(row+18));
		anchor.setAnchorType(2);
		pa.createPicture(anchor , wb.addPicture(data,HSSFWorkbook.PICTURE_TYPE_JPEG));
	}

	private void insertPNGImage(HSSFWorkbook wb,HSSFPatriarch pa,byte[] data,int row,int column){
		int x1=250;
		int y1=20;
		int x2=300;
		int y2=40;
		HSSFClientAnchor anchor = new HSSFClientAnchor(x1,y1,x2,y2,(short)(4*column-4),row,(short)(4*column-1),(row+18));
		anchor.setAnchorType(2);
		pa.createPicture(anchor , wb.addPicture(data,HSSFWorkbook.PICTURE_TYPE_PNG));
	}
}
