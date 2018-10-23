package com.fh.entity.ehuarong;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by wp on 2016-10-22.
 */
public class Goods implements Comparable<Goods>{

    public static final String PLATFORM_PINGZHI="pinzhi365";
    public static final String PLATFORM_YUEHUA="yuehua";
    public static final String PLATFORM_JD="jd";
    public static final String PLATFORM_TAOBAO="taobao";
    public static final String PLATFORM_ZCG="zcg"; //招财狗 无双科技
    public static final String PLATFORM_HR="HR"; //招财狗 无双科技


    private String ownNumber;//自有编号
    private String orderDate;//订单日期
    private String orderNumber; //订单编号
    private String goodsNumber;//商品编号
    private String shopGoodsName;//订购商品名称
    private String shopName;
    private String orderCount;//订购数量
    private String goodsPrice;//商品单价
    private String goodsCostPrice;//商品成本价
    private String vendor;//供应商
    private String payDate;//支付时间
    private String orderMaoney;//订单金额
    private String customerName;//收货人姓名
    private String customerNo;//收货人身份证号
    private String customerPhone;//收货人联系方式
    private String customerAddress;//收货地址
    private String deliverDate;//发货时间
    private String deliverCompany;//快递公司
    private String deliverNumber;//快递单号
    private String remark;//快递单号

    public String getPltSource() {
        return pltSource;
    }

    public void setPltSource(String pltSource) {
        this.pltSource = pltSource;
    }

    private String pltSource; //平台

    private String currentDate;

    public String getOwnNumber() {
        return ownNumber;
    }

    public void setOwnNumber(String ownNumber) {
        this.ownNumber = ownNumber;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        if(goodsNumber.indexOf(".") > 0){
            goodsNumber = goodsNumber.substring(0, goodsNumber.indexOf("."));
        }
        this.goodsNumber = goodsNumber;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopGoodsName() {
        return shopGoodsName;
    }

    public void setShopGoodsName(String shopGoodsName) {
        this.shopGoodsName = shopGoodsName;
    }

    public String getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(String orderCount) {
        this.orderCount = orderCount;
    }

    public String getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(String goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsCostPrice() {
        return goodsCostPrice;
    }

    public void setGoodsCostPrice(String goodsCostPrice) {
        this.goodsCostPrice = goodsCostPrice;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getOrderMaoney() {
        return orderMaoney;
    }

    public void setOrderMaoney(String orderMaoney) {
        this.orderMaoney = orderMaoney;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerNo() {
        return customerNo;
    }

    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(String deliverDate) {
        this.deliverDate = deliverDate;
    }

    public String getDeliverCompany() {
        return deliverCompany;
    }

    public void setDeliverCompany(String deliverCompany) {
        this.deliverCompany = deliverCompany;
    }

    public String getDeliverNumber() {
        return deliverNumber;
    }

    public void setDeliverNumber(String deliverNumber) {
        this.deliverNumber = deliverNumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCurrentDate() {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        return sf.format(c.getTime());
    }

    public void setCurrentDate(String currentDate) {
        this.currentDate = currentDate;
    }
    @Override
    public String toString() {
        return "Goods{" +
                "ownNumber='" + ownNumber + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", orderNumber='" + orderNumber + '\'' +
                ", goodsNumber='" + goodsNumber + '\'' +
                ", shopGoodsName='" + shopGoodsName + '\'' +
                ", shopName='" + shopName + '\'' +
                ", orderCount='" + orderCount + '\'' +
                ", goodsPrice='" + goodsPrice + '\'' +
                ", goodsCostPrice='" + goodsCostPrice + '\'' +
                ", vendor='" + vendor + '\'' +
                ", payDate='" + payDate + '\'' +
                ", orderMaoney='" + orderMaoney + '\'' +
                ", customerName='" + customerName + '\'' +
                ", customerNo='" + customerNo + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", customerAddress='" + customerAddress + '\'' +
                ", deliverDate='" + deliverDate + '\'' +
                ", deliverCompany='" + deliverCompany + '\'' +
                ", deliverNumber='" + deliverNumber + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public int compareTo(Goods o) {
        if(o.getShopName().compareTo( this.getShopName()) > 0){
            return 1;
        }else {
            return -1;
        }
    }

    //set 转 list 是否同一个对象
    public boolean equals(Object o){
        Goods obj = (Goods)o;
        return this.getOrderNumber() == obj.getOrderNumber() && this.getGoodsNumber() == ((Goods) o).getGoodsNumber();
    }


    public int hashCode(){
        return this.getGoodsNumber().hashCode() * 17 + this.getOrderNumber().hashCode() * 17;
    }

}
