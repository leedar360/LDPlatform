package com.fh.util;

import org.apache.poi.hssf.usermodel.*;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.LocalizedResourceHelper;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ObjectZipExcelView extends AbstractView {

    private static final String CONTENT_TYPE = "application/vnd.ms-excel";
    private static final String EXTENSION = ".xls";
    private String url;

    public ObjectZipExcelView() {
        this.setContentType("application/vnd.ms-excel");
    }

    public void setUrl(String url) {
        this.url = url;
    }

    protected boolean generatesDownloadContent() {
        return true;
    }

    protected final void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        response.setContentType("application/octet-stream");

        String filename = Tools.date2Str(new Date(), "yyyyMMddHHmmss");
        response.setHeader("Content-Disposition", "attachment;filename="+filename+".zip");

        ZipOutputStream zipOutputStream = new ZipOutputStream(response.getOutputStream());






        List<String> titles = (List<String>) model.get("titles");


        Map<String, Object[]> supplyProductMap = (Map<String, Object[]>)model.get("supplyProduct");
        for(Map.Entry<String, Object[]> entry : supplyProductMap.entrySet()){
            String supplyName = (String)entry.getValue()[0];
            String supplyEmail = (String) entry.getValue()[1];
            HSSFWorkbook workbook = this.buildExcelDocument(titles, (List<PageData>)entry.getValue()[2], request, response);
            ZipEntry zipEntry = new ZipEntry(supplyName + "-" + supplyEmail + "-" + DateUtil.getDay()+".xls");
            zipOutputStream.putNextEntry(zipEntry);
            workbook.write(zipOutputStream);
            zipOutputStream.closeEntry();
        }


        response.setContentType(this.getContentType());
       // ServletOutputStream out = response.getOutputStream();
        //workbook.write(out);
        zipOutputStream.flush();
        zipOutputStream.close();
    }

    protected HSSFWorkbook getTemplateSource(String url, HttpServletRequest request) throws Exception {
        LocalizedResourceHelper helper = new LocalizedResourceHelper(this.getApplicationContext());
        Locale userLocale = RequestContextUtils.getLocale(request);
        Resource inputFile = helper.findLocalizedResource(url, ".xls", userLocale);
        if (this.logger.isDebugEnabled()) {
            this.logger.debug("Loading Excel workbook from " + inputFile);
        }

        return new HSSFWorkbook(inputFile.getInputStream());
    }

    protected HSSFWorkbook buildExcelDocument(List<String> titles, List<PageData> varList, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub

        HSSFWorkbook workbook = new HSSFWorkbook();
        Date date = new Date();
        String filename = Tools.date2Str(date, "yyyyMMddHHmmss");
        HSSFSheet sheet;
        HSSFCell cell;

        sheet = workbook.createSheet("sheet1");

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
        for(int i=0; i<len; i++){ //设置标题
            String title = titles.get(i);
            cell = getCell(sheet, 0, i);
            cell.setCellStyle(headerStyle);
            setText(cell,title);
        }
        sheet.getRow(0).setHeight(height);

        HSSFCellStyle contentStyle = workbook.createCellStyle(); //内容样式
        contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
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
        return workbook;
    }

    protected HSSFCell getCell(HSSFSheet sheet, int row, int col) {
        HSSFRow sheetRow = sheet.getRow(row);
        if (sheetRow == null) {
            sheetRow = sheet.createRow(row);
        }

        HSSFCell cell = sheetRow.getCell(col);
        if (cell == null) {
            cell = sheetRow.createCell(col);
        }

        return cell;
    }

    protected void setText(HSSFCell cell, String text) {
        cell.setCellType(1);
        cell.setCellValue(text);
    }
}
