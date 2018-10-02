package com.fh.util;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.fh.entity.ehuarong.Goods;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.util.StringUtils;

/**
 * 操作Excel表格的功能类
 */
public class ExcelReader {
    private POIFSFileSystem fs;
    private HSSFWorkbook wb;
    private HSSFSheet sheet;
    private HSSFRow row;

    //private static Properties shopNameProperties = new Properties();
    /*static {
        InputStream is = null ;
        try {
            is = new FileInputStream("/ehuarong/GoodsName.properties");
            shopNameProperties.load(is);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(is != null) {
                    is.close();
                }
            }catch(Exception e1){
                    e1.printStackTrace();
                }
        }
    }*/
    /**
     * 读取Excel表格表头的内容
     * @param
     * @return String 表头内容的数组
     */
    private String[] readExcelTitle(InputStream is) {
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        row = sheet.getRow(0);
        // 标题总列数
        int colNum = row.getPhysicalNumberOfCells();
        System.out.println("colNum:" + colNum);
        String[] title = new String[colNum];
        for (int i = 0; i < colNum; i++) {
            //title[i] = getStringCellValue(row.getCell((short) i));
            title[i] = getCellFormatValue(row.getCell(i));
        }
        return title;
    }

    /**
     * 读取Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private Map<Integer, Goods> readGoodsExcelContent(InputStream is) {
        Map<Integer, Goods> content = new HashMap<>();
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(0);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            goods.setOwnNumber(getCellFormatValue(row.getCell( 0)).trim());
            goods.setOrderDate(getCellFormatValue(row.getCell(1)).trim());
            goods.setOrderNumber(getCellFormatValue(row.getCell(2)).trim());
            goods.setGoodsNumber(getCellFormatValue(row.getCell(3)).trim());
            goods.setShopGoodsName(getCellFormatValue(row.getCell(4)).trim());
            //goods.setShopName(shopNameProperties.getProperty(goods.getGoodsNumber()));
            goods.setOrderCount(getCellFormatValue(row.getCell(5)).trim());
            goods.setGoodsPrice(getCellFormatValue(row.getCell(6)).trim());
            goods.setGoodsCostPrice(getCellFormatValue(row.getCell(7)).trim());
            goods.setVendor(getCellFormatValue(row.getCell(8)).trim());
            goods.setPayDate(getCellFormatValue(row.getCell(9)).trim());
            goods.setOrderMaoney(getCellFormatValue(row.getCell(10)).trim());
            goods.setCustomerName(getCellFormatValue(row.getCell(11)).trim());
            goods.setCustomerNo(getCellFormatValue(row.getCell(12)).trim());
            goods.setCustomerPhone(getCellFormatValue(row.getCell(13)).trim());
            goods.setCustomerAddress(getCellFormatValue(row.getCell(14)).trim());
            goods.setDeliverDate(getCellFormatValue(row.getCell(15)).trim());
            goods.setDeliverCompany(getCellFormatValue(row.getCell(16)).trim());
            goods.setDeliverNumber(getCellFormatValue(row.getCell(17)).trim());
            goods.setRemark(getCellFormatValue(row.getCell(18)).trim());

            if(goods.getOwnNumber().equals("")){
                getHasRowValue(goods, sheet, i);
            }
            content.put(i, goods);
        }
        return content;
    }

    public List<Goods> readGoodsWithPltSource(String pltSource, InputStream is) {
        List<Goods> content = new ArrayList<>();
        if(StringUtils.isEmpty(pltSource)){
            return content;
        }
        switch (pltSource) {
        case Goods.PLATFORM_PINGZHI:
            content = readPingZhi(is);
            break;
        case Goods.PLATFORM_YUEHUA:
            content = readYueHua(is);
            break;
        case Goods.PLATFORM_JD:
            content = readJD(is);
            break;
        case Goods.PLATFORM_TAOBAO:

            break;
        }
        return content;
    }



    /**
     * 读取京东Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    /** bakup
    private List<Goods> readJD(InputStream is) {
        List<Goods> content = new ArrayList<>();
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(0);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            goods.setOrderNumber(getCellFormatValue(row.getCell(0)).trim()); //订单号
            goods.setShopGoodsName(getCellFormatValue(row.getCell(2)).trim());//商品信息
            goods.setGoodsNumber(getCellFormatValue(row.getCell(1)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(10)).trim());//货款金额
            goods.setOrderCount(getCellFormatValue(row.getCell(4)).trim()); //订购数量

            goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价

            goods.setOrderDate(getCellFormatValue(row.getCell(6)).trim());//付款时间 -- 下单时间

            goods.setCustomerName(getCellFormatValue(row.getCell(14)).trim()); //客户姓名
            //goods.setCustomerNo(getCellFormatValue(row.getCell(12)).trim());
            goods.setCustomerPhone(getCellFormatValue(row.getCell(17)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(15)).trim()); //收货人地址
            goods.setPltSource(Goods.PLATFORM_JD); //京东平台
            content.add(goods);
        }
        return content;
    }*/


    /**
     * 读取京东Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

     private List<Goods> readJD(InputStream is) {
     List<Goods> content = new ArrayList<>();
     try {
     fs = new POIFSFileSystem(is);
     wb = new HSSFWorkbook(fs);
     } catch (IOException e) {
     e.printStackTrace();
     }
     sheet = wb.getSheetAt(0);
     // 得到总行数
     int rowNum = sheet.getLastRowNum();
     row = sheet.getRow(0);
     // 正文内容应该从第二行开始,第一行为表头的标题
     for (int i = 1; i <= rowNum; i++) {
         row = sheet.getRow(i);
            if(!getCellFormatValue(row.getCell(3)).trim().equals("29468751727")) { // 排除 坏果包赔 签收以后拍照24小时内联系客服
                Goods goods = new Goods();

                goods.setOrderNumber(getCellFormatValue(row.getCell(0)).trim()); //订单号
                goods.setShopGoodsName(getCellFormatValue(row.getCell(2)).trim());//商品信息
                goods.setGoodsNumber(getCellFormatValue(row.getCell(3)).trim());//SKUID
                goods.setGoodsPrice(getCellFormatValue(row.getCell(7)).trim());//货款金额 商品实付
                goods.setOrderCount(getCellFormatValue(row.getCell(4)).trim()); //订购数量
//                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
//                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
                goods.setOrderDate(getCellFormatValue(row.getCell(1)).trim());//付款时间 -- 下单时间
                goods.setCustomerName(getCellFormatValue(row.getCell(14)).trim()); //客户姓名
                goods.setCustomerPhone(getCellFormatValue(row.getCell(15)).trim()); //手机号码
                goods.setCustomerAddress(getCellFormatValue(row.getCell(16)).trim()); //收货人地址
                goods.setPltSource(Goods.PLATFORM_JD); //京东平台
                content.add(goods);
            }
     }
     return content;
     }


    /**
     * 读取悦花平台Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readYueHua(InputStream is) {
        List<Goods> content = new ArrayList<>();
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(0);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            goods.setOrderNumber(getCellFormatValue(row.getCell(0)).trim());
            goods.setShopGoodsName(getCellFormatValue(row.getCell(1)).trim());
            goods.setGoodsNumber(getCellFormatValue(row.getCell(2)).trim());
            goods.setGoodsPrice(getCellFormatValue(row.getCell(6)).trim());//商品单价
            goods.setOrderCount(getCellFormatValue(row.getCell(7)).trim());
            goods.setOrderMaoney(getCellFormatValue(row.getCell(8)).trim());

            goods.setOrderDate(getCellFormatValue(row.getCell(14)).trim());//付款时间

            goods.setCustomerName(getCellFormatValue(row.getCell(19)).trim());
            //goods.setCustomerNo(getCellFormatValue(row.getCell(12)).trim());
            goods.setCustomerPhone(getCellFormatValue(row.getCell(20)).trim());
            goods.setCustomerAddress(getCellFormatValue(row.getCell(21)).trim());

            goods.setPltSource(Goods.PLATFORM_YUEHUA);

            content.add(goods);
        }
        return content;
    }

    /**
     * 读取品质365Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readPingZhi(InputStream is) {
        List<Goods> content = new ArrayList<>();
        Set<Goods> contentSet = new HashSet<>();
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(0);
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            goods.setOwnNumber(getCellFormatValue(row.getCell(0)).trim());
            goods.setOrderDate(getCellFormatValue(row.getCell(1)).trim());
            goods.setOrderNumber(getCellFormatValue(row.getCell(2)).trim());
            goods.setGoodsNumber(getCellFormatValue(row.getCell(3)).trim());
            goods.setShopGoodsName(getCellFormatValue(row.getCell(4)).trim());
            //goods.setShopName(shopNameProperties.getProperty(goods.getGoodsNumber()));
            goods.setOrderCount(getCellFormatValue(row.getCell(5)).trim());
            goods.setGoodsPrice(getCellFormatValue(row.getCell(7)).trim());      //品质卖价
            goods.setGoodsCostPrice(getCellFormatValue(row.getCell(7)).trim());
            goods.setVendor(getCellFormatValue(row.getCell(8)).trim());
            goods.setPayDate(getCellFormatValue(row.getCell(9)).trim());
            goods.setOrderMaoney(getCellFormatValue(row.getCell(10)).trim());
            goods.setCustomerName(getCellFormatValue(row.getCell(11)).trim());
            goods.setCustomerNo(getCellFormatValue(row.getCell(12)).trim());
            goods.setCustomerPhone(getCellFormatValue(row.getCell(13)).trim());
            goods.setCustomerAddress(getCellFormatValue(row.getCell(14)).trim());
            goods.setDeliverDate(getCellFormatValue(row.getCell(15)).trim());
            goods.setDeliverCompany(getCellFormatValue(row.getCell(16)).trim());
            goods.setDeliverNumber(getCellFormatValue(row.getCell(17)).trim());
            goods.setRemark(getCellFormatValue(row.getCell(18)).trim());
            goods.setPltSource(Goods.PLATFORM_PINGZHI);
            if(goods.getOwnNumber().equals("")){
                getHasRowValue(goods, sheet, i);
            }
            contentSet.add(goods);
        }
//        set --> content(list)
        return new ArrayList<Goods>(contentSet);
    }

    private void getHasRowValue(Goods goods, HSSFSheet sheet, int i){
        if(goods.getOwnNumber().equals("")){
            HSSFRow row = sheet.getRow(i-1);
            goods.setOwnNumber(getCellFormatValue(row.getCell(0)).trim());
            goods.setOrderDate(getCellFormatValue(row.getCell(1)).trim());
            goods.setOrderNumber(getCellFormatValue(row.getCell(2)).trim());

            goods.setPayDate(getCellFormatValue(row.getCell(9)).trim());
            goods.setOrderMaoney(getCellFormatValue(row.getCell(10)).trim());
            goods.setCustomerName(getCellFormatValue(row.getCell(11)).trim());
            goods.setCustomerNo(getCellFormatValue(row.getCell(12)).trim());
            goods.setCustomerPhone(getCellFormatValue(row.getCell(13)).trim());
            goods.setCustomerAddress(getCellFormatValue(row.getCell(14)).trim());
            goods.setDeliverDate(getCellFormatValue(row.getCell(15)).trim());
            goods.setDeliverCompany(getCellFormatValue(row.getCell(16)).trim());
            goods.setDeliverNumber(getCellFormatValue(row.getCell(17)).trim());
            goods.setRemark(getCellFormatValue(row.getCell(18)).trim());
            getHasRowValue(goods, sheet, i-1);
        }
    }
    /**
     * 读取Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    public Map<Integer, List<Object>> readExcelContent(InputStream is) {
        Map<Integer, List<Object>> content = new HashMap<>();
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(0);
        int colNum = row.getPhysicalNumberOfCells();
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            int j = 0;
            List<Object> cellData= new ArrayList<>();
            while (j < colNum) {
                // 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
                // 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
                // str += getStringCellValue(row.getCell(j)).trim() +
                // "-";
                String cellContent= getCellFormatValue(row.getCell(j)).trim();
                j++;
                cellData.add(cellContent);
            }
            content.put(i, cellData);
        }
        return content;
    }



    /**
     * 获取单元格数据内容为字符串类型的数据
     *
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    private String getStringCellValue(HSSFCell cell) {
        String strCell = cell.getStringCellValue();
       /* switch (cell.getCellType()) {
            case HSSFCell.CELL_TYPE_STRING:
                strCell = cell.getStringCellValue();
                break;
            case HSSFCell.CELL_TYPE_NUMERIC:
                strCell = String.valueOf(cell.getNumericCellValue());
                break;
            case HSSFCell.CELL_TYPE_BOOLEAN:
                strCell = String.valueOf(cell.getBooleanCellValue());
                break;
            case HSSFCell.CELL_TYPE_BLANK:
                strCell = "";
                break;
            default:
                strCell = "";
                break;
        }*/
        if (StringUtils.isEmpty(strCell)) {
            return "";
        }
        if (cell == null) {
            return "";
        }
        return strCell;
    }

    /**
     * 获取单元格数据内容为日期类型的数据
     *
     * @param cell
     *            Excel单元格
     * @return String 单元格数据内容
     */
    private String getDateCellValue(HSSFCell cell) {
        String result = "";
        try {
            int cellType = cell.getCellType();
            /*if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
                Date date = cell.getDateCellValue();
                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
                        + "-" + date.getDate();
            } else */if (cellType == HSSFCell.CELL_TYPE_STRING) {
                String date = getStringCellValue(cell);
                result = date.replaceAll("[年月]", "-").replace("日", "").trim();
            } else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
                result = "";
            }
        } catch (Exception e) {
            System.out.println("日期格式不正确!");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private String getCellFormatValue(HSSFCell cell) {
        String cellvalue;
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
                // 如果当前Cell的Type为NUMERIC
                case HSSFCell.CELL_TYPE_NUMERIC:
                case HSSFCell.CELL_TYPE_FORMULA: {
                    // 判断当前的cell是否为Date
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        // 如果是Date类型则，转化为Data格式

                        //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                        //cellvalue = cell.getDateCellValue().toLocaleString();

                        //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                        Date date = cell.getDateCellValue();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        cellvalue = sdf.format(date);

                    }
                    // 如果是纯数字
                    else {
                        // 取得当前Cell的数值
                        cellvalue = String.valueOf(cell.getNumericCellValue());
                    }
                    break;
                }
                // 如果当前Cell的Type为STRIN
                case HSSFCell.CELL_TYPE_STRING:
                    // 取得当前的Cell字符串
                    cellvalue = cell.getRichStringCellValue().getString();
                    break;
                // 默认的Cell值
                default:
                    cellvalue = " ";
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;

    }

    public static void main(String[] args) {
        try {
            String fileName = "D:\\\\Evan\\\\JavaProjects\\\\excelPro\\\\excelfile\\\\test\\\\deliver\\\\ThirdPartnerOrders_beihuo(20161022083416835).init.xls";
            // 对读取Excel表格标题测试
            InputStream is = new FileInputStream(fileName);
            ExcelReader excelReader = new ExcelReader();
            String[] title = excelReader.readExcelTitle(is);
            System.out.println("获得Excel表格的标题:");
            for (String s : title) {
                System.out.print(s + " ");
            }

            // 对读取Excel表格内容测试
            InputStream is2 = new FileInputStream(fileName);
            Map<Integer, Goods> map = excelReader.readGoodsExcelContent(is2);
            //Map<Integer, List<Object>> map = excelReader.readExcelContent(is2);
            System.out.println("获得Excel表格的内容:");
            for (int i = 1; i <= map.size(); i++) {
                System.out.println(map.get(i));
            }

        } catch (FileNotFoundException e) {
            System.out.println("未找到指定路径的文件!");
            e.printStackTrace();
        }
    }
}
