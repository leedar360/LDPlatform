package com.fh.util;

import java.io.*;
import java.text.DecimalFormat;
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

            case Goods.PLATFORM_DUODIAN:
                content = readDUODIAN(is);
                break;

            case Goods.PLATFORM_YX_LEEDAR:
                content = readYX_LEEDAR(is);
                break;

            case Goods.PLATFORM_HR:
                content = readHR(is);
                break;
            case Goods.PLATFORM_WANKA:
                content = readWANKA(is);
                break;
            case Goods.PLATFORM_WANKA_HRJY:
                content = PLATFORM_WANKA_HRJY(is);
                break;
            case Goods.PLATFORM_YX_HRJY:
                content = readYX_HRJY(is);
                break;
            case Goods.PLATFORM_360:
                content = read360(is);
                break;

            case Goods.PLATFORM_SHUIXIANG:
                content = readSHUIXIANG(is);
                break;
            case Goods.PLATFORM_JIABAO:
                content = readJIABAO(is);
                break;
            case Goods.PLATFORM_TAOBAO:
                content = readTAOBAO(is);
                break;


            case Goods.PLATFORM_HUANQIU:
                content = readHUANQIU(is);
                break;
            case Goods.PLATFORM_BEIDIAN:
                content = readBEIDIAN(is);
                break;
            case Goods.PLATFORM_SUNING:
                content = readSUNING(is);
                break;
            case Goods.PLATFORM_PINGDUODUO:
                content = readPINDUODUO(is);
                break;
            case Goods.PLATFORM_XIANGCHENG:
                content = readXIANGCHENG(is);
                break;


            case Goods.PLATFORM_LUBAN:
                content = readLUBAN(is);
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
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readHR(InputStream is) {
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
            goods.setShopGoodsName(getCellFormatValue(row.getCell(5)).trim());//商品信息 文字
            goods.setGoodsNumber(getCellFormatValue(row.getCell(6)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(7)).trim());//货款金额 商品实付
            goods.setOrderCount(getCellFormatValue(row.getCell(4)).trim()); //订购数量
            //                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
            //                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
            goods.setOrderDate(DateUtil.getSdfTime());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(1)).trim()); //客户姓名

//            if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){   //数字
//                if(String.valueOf(cell.getNumericCellValue()).indexOf("E")==-1){
//                    return String.valueOf(cell.getNumericCellValue());
//                }else {
//                    return new DecimalFormat("#").format(cell.getNumericCellValue());
//                }
//
//            }

            goods.setCustomerPhone(getCellFormatValue(row.getCell(2)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(3)).trim()); //收货人地址
            goods.setPltSource(getCellFormatValue(row.getCell(9)).trim()); //平台来源
            goods.setRemark(getCellFormatValue(row.getCell(10)).trim()); //备注
            content.add(goods);

        }
        return content;
    }





    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readWANKA(InputStream is) {
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
        row = sheet.getRow(0); //聚优惠为第三行开始        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            String tmpOrderstatus = getCellFormatValue(row.getCell(22)).trim();
            String tmpOrderstatus2 = getCellFormatValue(row.getCell(23)).trim();
            //  万卡需要验证 商品发货状态 待发货和待配货两种才可以上传订单
            if(tmpOrderstatus.equals("待发货")&& tmpOrderstatus2.equals("待配货")) {
                goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
                goods.setShopGoodsName(getCellFormatValue(row.getCell(12)).trim() + getCellFormatValue(row.getCell(13)).trim());//商品信息 规格
                goods.setGoodsNumber(getCellFormatValue(row.getCell(9)).trim());//SKUID

                goods.setGoodsPrice(getCellFormatValue(row.getCell(21)).trim());//货款金额 商品实付 应收账款
                /**
                 * to do list
                 */

                goods.setOrderCount(getCellFormatValue(row.getCell(15)).trim()); //订购数量

                goods.setOrderDate(getCellFormatValue(row.getCell(3)).trim());//付款时间 -- 下单时间
                goods.setCustomerName(getCellFormatValue(row.getCell(5)).trim()); //客户姓名

                goods.setCustomerPhone(getCellFormatValue(row.getCell(7)).trim()); //手机号码
                goods.setCustomerAddress(getCellFormatValue(row.getCell(8)).trim()); //收货人地址
                goods.setRemark("商品货号: "+getCellFormatValue(row.getCell(10)).trim());
                goods.setPltSource(Goods.PLATFORM_WANKA); //平台来源
                //            goods.setRemark(); //备注
                //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

                content.add(goods);
            }

        }
        return content;
    }


    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> PLATFORM_WANKA_HRJY(InputStream is) {
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
        row = sheet.getRow(0); //聚优惠为第三行开始        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();

            goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
            goods.setShopGoodsName( getCellFormatValue(row.getCell(10)).trim() + getCellFormatValue(row.getCell(11)).trim());//商品信息 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(9)).trim());//SKUID


            goods.setGoodsPrice(getCellFormatValue(row.getCell(12)).trim());//货款金额 商品实付 应收账款



            goods.setOrderCount("1"); //订购数量

            goods.setOrderDate(getCellFormatValue(row.getCell(3)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(5)).trim()); //客户姓名

            goods.setCustomerPhone(getCellFormatValue(row.getCell(6)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(8)).trim()); //收货人地址
            goods.setPltSource(Goods.PLATFORM_WANKA_HRJY); //平台来源
            //            goods.setRemark(); //备注
            //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

            content.add(goods);

        }
        return content;
    }


    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readKEYIYOU(InputStream is) {
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
        row = sheet.getRow(0); // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();

            goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
            goods.setShopGoodsName( getCellFormatValue(row.getCell(8)).trim() + "--" + getCellFormatValue(row.getCell(9)).trim());//商品信息 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(6)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(15)).trim());//货款金额 商品实付
            goods.setOrderCount(getCellFormatValue(row.getCell(10)).trim()); //订购数量

            goods.setOrderDate(getCellFormatValue(row.getCell(4)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(16)).trim()); //客户姓名

            goods.setCustomerPhone(getCellFormatValue(row.getCell(17)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(18)).trim() + getCellFormatValue(row.getCell(19)).trim()); //收货人地址
            goods.setPltSource(Goods.PLATFORM_KEYIYOU); //平台来源
            //            goods.setRemark(); //备注
            //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

            content.add(goods);

        }
        return content;
    }



    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> read360(InputStream is) {
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
        row = sheet.getRow(0); // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            String tmpOrderstatus = getCellFormatValue(row.getCell(2)).trim();
            if(tmpOrderstatus.equals("待发货")) {
                Goods goods = new Goods();
                goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
                goods.setShopGoodsName(getCellFormatValue(row.getCell(17)).trim() + "--" + getCellFormatValue(row.getCell(19)).trim());//商品信息 规格
                goods.setGoodsNumber(getCellFormatValue(row.getCell(16)).trim());//SKUID
                goods.setGoodsPrice(getCellFormatValue(row.getCell(21)).trim());//货款金额 商品实付
                goods.setOrderCount(getCellFormatValue(row.getCell(20)).trim()); //订购数量

                goods.setOrderDate(getCellFormatValue(row.getCell(3)).trim());//付款时间 -- 下单时间
                goods.setCustomerName(getCellFormatValue(row.getCell(12)).trim()); //客户姓名

                goods.setCustomerPhone(getCellFormatValue(row.getCell(13)).trim()); //手机号码
                goods.setCustomerAddress(getCellFormatValue(row.getCell(14)).trim() + getCellFormatValue(row.getCell(15)).trim()); //收货人地址
                goods.setRemark("商品货号： " + getCellFormatValue(row.getCell(18)).trim()); //备注
                goods.setPltSource(Goods.PLATFORM_360); //平台来源
                //            goods.setRemark(); //备注
                //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

                content.add(goods);
            }

        }
        return content;
    }

    /**
     * 读取duodianExcel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readDUODIAN(InputStream is) {
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
        row = sheet.getRow(0); // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            String tmpOrderstatus = getCellFormatValue(row.getCell(2)).trim();
            if(tmpOrderstatus.equals("待发货")) {
                Goods goods = new Goods();
                goods.setOrderNumber(getCellFormatValue(row.getCell(0)).trim()); //订单号
                goods.setShopGoodsName(getCellFormatValue( row.getCell(20)).trim() );//商品信息 规格
                goods.setGoodsNumber(getCellFormatValue( row.getCell(19) ).trim());//SKUID

                goods.setGoodsPrice(getCellFormatValue(row.getCell(24)).trim());//货款金额 商品实付
                goods.setOrderCount(getCellFormatValue(row.getCell(22)).trim()); //订购数量

                goods.setOrderDate(getCellFormatValue(row.getCell(4)).trim());//付款时间 -- 下单时间
                goods.setCustomerName(getCellFormatValue(row.getCell(7)).trim()); //客户姓名

                goods.setCustomerPhone(getCellFormatValue(row.getCell(8)).trim()); //手机号码
                goods.setCustomerAddress(   getCellFormatValue(row.getCell(9)).trim()  + " "
                                        +   getCellFormatValue(row.getCell(10)).trim() + " "
                                        +   getCellFormatValue(row.getCell(11)).trim() + " "
                                        +   getCellFormatValue(row.getCell(12)).trim()
                                        ); //收货人地址
                goods.setRemark("商品编码：" + getCellFormatValue(row.getCell(23)).trim() + " 客户备注： " + getCellFormatValue(row.getCell(16)).trim()); //备注
                goods.setPltSource(Goods.PLATFORM_DUODIAN); //平台来源
                //            goods.setRemark(); //备注
                //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

                content.add(goods);
            }

        }
        return content;
    }


    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> PLATFORM_360(InputStream is) {
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
        row = sheet.getRow(0); // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();

            goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
            goods.setShopGoodsName( getCellFormatValue(row.getCell(8)).trim() + "--" + getCellFormatValue(row.getCell(9)).trim());//商品信息 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(6)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(15)).trim());//货款金额 商品实付
            goods.setOrderCount(getCellFormatValue(row.getCell(10)).trim()); //订购数量

            goods.setOrderDate(getCellFormatValue(row.getCell(4)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(16)).trim()); //客户姓名

            goods.setCustomerPhone(getCellFormatValue(row.getCell(17)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(18)).trim() + getCellFormatValue(row.getCell(19)).trim()); //收货人地址
            goods.setPltSource(Goods.PLATFORM_360); //平台来源
            //            goods.setRemark(); //备注
            //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

            content.add(goods);

        }
        return content;
    }


    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readSHUIXIANG(InputStream is) {
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
        row = sheet.getRow(0); // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();

            goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
            goods.setShopGoodsName( getCellFormatValue(row.getCell(8)).trim() );//商品信息 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(9)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(14)).trim());//货款金额 商品实付
            goods.setOrderCount(getCellFormatValue(row.getCell(10)).trim()); //订购数量
            goods.setOrderDate(getCellFormatValue(row.getCell(3)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(5)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(6)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(7)).trim()); //收货人地址
            goods.setPltSource(Goods.PLATFORM_SHUIXIANG); //平台来源
            content.add(goods);

        }
        return content;
    }



    /**
     * 读取华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readJIABAO(InputStream is) {
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
        row = sheet.getRow(0); // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();

            goods.setOrderNumber(getCellFormatValue(row.getCell(0)).trim()); //订单号
            goods.setShopGoodsName( getCellFormatValue(row.getCell(14)).trim() );//商品信息 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(15)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(19)).trim());//货款金额 商品实付
            goods.setOrderCount(getCellFormatValue(row.getCell(17)).trim()); //订购数量

            goods.setOrderDate(getCellFormatValue(row.getCell(35)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(6)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(7)).trim()); //手机号码
            goods.setCustomerAddress(       getCellFormatValue(row.getCell(8)).trim()
                                        +   getCellFormatValue(row.getCell(9)).trim()
                                        +   getCellFormatValue(row.getCell(10)).trim()
                                        +   getCellFormatValue(row.getCell(11)).trim()
                                        +   getCellFormatValue(row.getCell(12)).trim()           ); //收货人地址
            goods.setRemark(getCellFormatValue(row.getCell(40)).trim()); // 备注
            goods.setPltSource(Goods.PLATFORM_JIABAO); //平台来源
            content.add(goods);

        }
        return content;
    }


    /**
     * 读取 贝店 Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readBEIDIAN(InputStream is) {
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
            goods.setShopGoodsName(getCellFormatValue(row.getCell(27)).trim()  + " --- " +  getCellFormatValue(row.getCell(33)).trim());//商品信息 + 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(24)).trim() + " - "  + getCellFormatValue(row.getCell(26)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(29)).trim());//货款金额 商品实付 供货价格
            goods.setOrderCount(getCellFormatValue(row.getCell(31)).trim()); //订购数量
            //                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
            //                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
            goods.setOrderDate(getCellFormatValue(row.getCell(13)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(16)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(17)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(18)).trim() ); //收货人地址
            goods.setRemark(getCellFormatValue(row.getCell(19)).trim() );//收货人地址

            goods.setPltSource(Goods.PLATFORM_BEIDIAN); // 贝店
            content.add(goods);

        }
        return content;
    }


    /**
     * 读取 环球 Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readHUANQIU(InputStream is) {
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
            goods.setShopGoodsName(getCellFormatValue(row.getCell(6)).trim()  + " --- " +  getCellFormatValue(row.getCell(7)).trim());//商品信息 + 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(2)).trim()  + " --- " +  getCellFormatValue(row.getCell(5)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(8)).trim());//货款金额 商品实付 供货价格 结算价格 O列
            goods.setOrderCount(getCellFormatValue(row.getCell(9)).trim()); //订购数量
            //                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
            //                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
            goods.setOrderDate(getCellFormatValue(row.getCell(23)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(16)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(17)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(22)).trim()); //收货人地址
            goods.setRemark(getCellFormatValue(row.getCell(30)).trim()); //买家备注
            goods.setPltSource(Goods.PLATFORM_HUANQIU); // 环球
            content.add(goods);

        }
        return content;
    }

    /**
     * 读取 suning Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readSUNING(InputStream is) {
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
            goods.setShopGoodsName(getCellFormatValue(row.getCell(7)).trim());
            goods.setGoodsNumber(getCellFormatValue(row.getCell(6)).trim());
            goods.setGoodsPrice(getCellFormatValue(row.getCell(12)).trim());//商品单价
            goods.setOrderCount(getCellFormatValue(row.getCell(13)).trim());
//            goods.setOrderMaoney(getCellFormatValue(row.getCell(8)).trim());

            goods.setOrderDate(getCellFormatValue(row.getCell(44)).trim());//付款时间

            goods.setCustomerName(getCellFormatValue(row.getCell(35)).trim());
            //goods.setCustomerNo(getCellFormatValue(row.getCell(12)).trim());
            goods.setCustomerPhone(getCellFormatValue(row.getCell(39)).trim());
            goods.setCustomerAddress(getCellFormatValue(row.getCell(36)).trim());
            goods.setRemark(getCellFormatValue(row.getCell(50)).trim()); //买家备注
            goods.setPltSource(Goods.PLATFORM_SUNING);

            content.add(goods);
        }
        return content;
    }

    /**
     * 读取 pingduoduo Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readPINDUODUO(InputStream is) {
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

            goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
            goods.setShopGoodsName(
                    getCellFormatValue(row.getCell(0)).trim() + " --- " + getCellFormatValue(row.getCell(27)).trim());//商品信息 + 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(26)).trim()  + "-" +  getCellFormatValue(row.getCell(29)).trim());//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(3)).trim());//货款金额 商品实付 供货价格 结算价格 O列
            goods.setOrderCount(getCellFormatValue(row.getCell(11)).trim()); //订购数量
            //                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
            //                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
            goods.setOrderDate(getCellFormatValue(row.getCell(22)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(14)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(15)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(17)).trim() + getCellFormatValue(row.getCell(18)).trim()
                                                    + getCellFormatValue(row.getCell(19)).trim() + getCellFormatValue(row.getCell(20)).trim()); //收货人地址
            goods.setRemark(getCellFormatValue(row.getCell(40)).trim()); //买家备注
            goods.setPltSource(Goods.PLATFORM_PINGDUODUO);

            contentSet.add(goods);
        }
        return new ArrayList<Goods>(contentSet);
    }



    /**
     * 读取 享橙 Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readXIANGCHENG(InputStream is) {
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

            goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
            goods.setShopGoodsName(
                    getCellFormatValue(row.getCell(0)).trim() + " -- " + getCellFormatValue(row.getCell(16)).trim());//商品信息 + 规格
            goods.setGoodsNumber(getCellFormatValue(row.getCell(15)).trim() );//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(3)).trim());//货款金额 商品实付 供货价格 结算价格 O列
            goods.setOrderCount(getCellFormatValue(row.getCell(4)).trim()); //订购数量
            //                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
            //                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
            goods.setOrderDate(getCellFormatValue(row.getCell(12)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(5)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(6)).trim()); //手机号码
            goods.setCustomerAddress(getCellFormatValue(row.getCell(7)).trim() + getCellFormatValue(row.getCell(8)).trim()
                    + getCellFormatValue(row.getCell(9)).trim() + getCellFormatValue(row.getCell(10)).trim()); //收货人地址
            goods.setRemark(getCellFormatValue(row.getCell(19)).trim()); //买家备注
            goods.setPltSource(Goods.PLATFORM_XIANGCHENG);

            contentSet.add(goods);
        }
        return new ArrayList<Goods>(contentSet);
    }



    /**
     * 读取宜信 华榕在线标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readYX_HRJY(InputStream is) {
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
        row = sheet.getRow(0); //聚优惠为第三行开始        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            String tmpOrderstatus = getCellFormatValue(row.getCell(13)).trim();
            String tmpOrderstatus2 = getCellFormatValue(row.getCell(14)).trim();
            //  万卡需要验证 商品发货状态 待发货和待配货两种才可以上传订单
            if(tmpOrderstatus.equals("待发货")&& tmpOrderstatus2.equals("待配货")) {

                goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
                goods.setShopGoodsName( getCellFormatValue(row.getCell(10)).trim() + " | " + getCellFormatValue(row.getCell(11)).trim());//商品信息 规格
                goods.setGoodsNumber(getCellFormatValue(row.getCell(9)).trim());//SKUID


                goods.setGoodsPrice(getCellFormatValue(row.getCell(12)).trim());//货款金额 商品实付 应收账款

                goods.setOrderCount("1"); //订购数量

                goods.setOrderDate(getCellFormatValue(row.getCell(3)).trim());//付款时间 -- 下单时间
                goods.setCustomerName(getCellFormatValue(row.getCell(5)).trim()); //客户姓名
                goods.setCustomerPhone(getCellFormatValue(row.getCell(6)).trim()); //手机号码
                goods.setCustomerAddress(getCellFormatValue(row.getCell(8)).trim()); //收货人地址
                goods.setPltSource(Goods.PLATFORM_YX_HRJY); //平台来源
                //            goods.setRemark(); //备注
                //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

                content.add(goods);
            }

        }
        return content;
    }



    /**
     * 读取宜信 立达融通标准Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */

    private List<Goods> readYX_LEEDAR(InputStream is) {
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
        row = sheet.getRow(0); //聚优惠为第三行开始        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i <= rowNum; i++) {
            row = sheet.getRow(i);
            Goods goods = new Goods();
            String tmpOrderstatus = getCellFormatValue(row.getCell(13)).trim();
            String tmpOrderstatus2 = getCellFormatValue(row.getCell(14)).trim();
            //  万卡需要验证 商品发货状态 待发货和待配货两种才可以上传订单
            if(tmpOrderstatus.equals("待发货")&& tmpOrderstatus2.equals("待配货")) {

                goods.setOrderNumber(getCellFormatValue(row.getCell(1)).trim()); //订单号
                goods.setShopGoodsName( getCellFormatValue(row.getCell(10)).trim() + " | " + getCellFormatValue(row.getCell(11)).trim());//商品信息 规格
                goods.setGoodsNumber(getCellFormatValue(row.getCell(9)).trim());//SKUID


                goods.setGoodsPrice(getCellFormatValue(row.getCell(12)).trim());//货款金额 商品实付 应收账款

                goods.setOrderCount("1"); //订购数量

                goods.setOrderDate(getCellFormatValue(row.getCell(3)).trim());//付款时间 -- 下单时间
                goods.setCustomerName(getCellFormatValue(row.getCell(5)).trim()); //客户姓名
                goods.setCustomerPhone(getCellFormatValue(row.getCell(6)).trim()); //手机号码
                goods.setCustomerAddress(getCellFormatValue(row.getCell(8)).trim()); //收货人地址
                goods.setPltSource(Goods.PLATFORM_YX_LEEDAR); //平台来源
                //            goods.setRemark(); //备注
                //            String tmpStr = getCellFormatValue(row.getCell(9)).trim();

                content.add(goods);
            }

        }
        return content;
    }



    /**
     * 读取 鲁班 Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readLUBAN(InputStream is) {
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

            goods.setOrderNumber(       getCellFormatValue(row.getCell(0)).trim()); //订单号
            goods.setShopGoodsName(     getCellFormatValue(row.getCell(1)).trim() );//商品名称
            goods.setGoodsNumber(       getCellFormatValue(row.getCell(2)).trim() );//SKUID
            goods.setGoodsPrice(        getCellFormatValue(row.getCell(5)).trim());//货款金额 商品实付 供货价格 结算价格 O列
            goods.setOrderCount(        getCellFormatValue(row.getCell(4)).trim()); //订购数量
            //                double totalMoney = getCellFormatValue(row.getCell(6)).trim().
            //                goods.setOrderMaoney(getCellFormatValue(row.getCell(11)).trim());//应付金额 - 单价  ？？？？？？？？？？
            goods.setOrderDate(         getCellFormatValue(row.getCell(17)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(      getCellFormatValue(row.getCell(8)).trim()); //客户姓名
            goods.setCustomerPhone(     getCellFormatValue(row.getCell(9)).trim()); //手机号码
            goods.setCustomerAddress(   getCellFormatValue(row.getCell(10)).trim() ); //收货人地址
            goods.setRemark(            getCellFormatValue(row.getCell(16)).trim()); //买家备注
            goods.setPltSource(Goods.PLATFORM_LUBAN);

            contentSet.add(goods);
        }
        return new ArrayList<Goods>(contentSet);
    }


    /**
     * 读取taobao 华榕官方店 Excel数据内容
     * @param
     * @return Map 包含单元格数据内容的Map对象
     */
    private List<Goods> readTAOBAO(InputStream is) {
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
            goods.setShopGoodsName(getCellFormatValue(row.getCell(21)).trim() );//商品信息
            goods.setGoodsNumber("");//SKUID
            goods.setGoodsPrice(getCellFormatValue(row.getCell(10)).trim());//货款金额 商品实付 供货价格
            goods.setOrderCount(getCellFormatValue(row.getCell(26)).trim()); //订购数量
            goods.setOrderDate(getCellFormatValue(row.getCell(20)).trim());//付款时间 -- 下单时间
            goods.setCustomerName(getCellFormatValue(row.getCell(14)).trim()); //客户姓名
            goods.setCustomerPhone(getCellFormatValue(row.getCell(18)).trim()); //手机号码
            goods.setCustomerAddress( getCellFormatValue(row.getCell(15)).trim() ); //收货人地址
            goods.setPltSource(Goods.PLATFORM_TAOBAO); //华榕官方店
            content.add(goods);

        }
        return new ArrayList<Goods>(content);
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
        DecimalFormat df = new DecimalFormat("#");

        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
                // 如果当前Cell的Type为NUMERIC
                case HSSFCell.CELL_TYPE_NUMERIC:
                    if(String.valueOf(cell.getNumericCellValue()).indexOf("E")==-1){
                        cellvalue = df.format(Double.parseDouble(cell.toString()));
                    }else {
                        cellvalue = df.format(cell.getNumericCellValue());
                    }
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
