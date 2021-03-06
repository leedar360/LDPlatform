package com.fh.service.ehuarong.orderinfo.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.ehuarong.Goods;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;
import com.fh.service.ehuarong.suplygoodinfo.SuplygoodinfoManager;
import com.fh.service.ehuarong.supplierinfo.SupplierinfoManager;
import com.fh.util.*;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 说明： 订单信息表
 * 创建人：FH Q313596790
 * 创建时间：2018-03-29
 */
@Service("orderinfoService")
public class OrderinfoService implements OrderinfoManager {

	protected Logger logger = Logger.getLogger(this.getClass());


	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="suplygoodinfoService")
	private SuplygoodinfoManager suplygoodinfoService;

	@Resource(name="supplierinfoService")
	private SupplierinfoManager supplierinfoService;


	/**
	 * 新增
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception {
		dao.save("OrderinfoMapper.save", pd);
	}

	/**
	 * 新增
	 *
	 * @param goodList
	 * @throws Exception
	 */
	//@Transactional(propagation= Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation= Isolation.DEFAULT)
	public Map<String, List<Goods>> save(List<Goods> goodList) throws Exception{
		Map<String, List<Goods>> result = new HashMap<>();
		List<Goods> existList = new ArrayList<>();
		List<Goods> successList = new ArrayList<>();
		List<Goods> failureList = new ArrayList<>();
		String strBatchNo = UuidUtil.get20UUID();

		for(Goods goods : goodList){
			PageData pd = new PageData();
			pd.put("ODER_ID", goods.getOrderNumber()); //订单编号
			pd.put("GOODNUM", goods.getOrderCount()); //商品数量
			pd.put("EXTGOODS_NAME", goods.getShopGoodsName());//商品名称

			pd.put("SELLNAME", "华榕在线"); // 发件人
			pd.put("SELLPHONE", "13911881373"); //发件电话

			pd.put("RECNAME", goods.getCustomerName()); //收件人姓名
			pd.put("RECPHONE", goods.getCustomerPhone()); // 收件人电话
			pd.put("RECADDRESS", goods.getCustomerAddress()); //收件人地址
			pd.put("EXPRESS", "");// 快递公司
			pd.put("EXPRESSNO", ""); //快递单号

			double totalPrice = Double.valueOf(goods.getGoodsPrice()) * Double.valueOf(goods.getOrderCount());
			pd.put("SELLPRICE", goods.getGoodsPrice()); //商品售价单价
			pd.put("SELLTOTALPRICE",  String.valueOf(totalPrice)); //商品售价总价
			//pd.put("PURCHASEPRICE", ""); //商品采购单价
			//pd.put("PURCHASETOTALPRICE", ""); //商品采购总价
			pd.put("PLATFORMID", goods.getPltSource()); //平台
			pd.put("SUPPLIER_ID", "");
			pd.put("SUPPLIER_EMAIL", "");
			pd.put("CREATETIME", goods.getOrderDate());//记录创建日期
			pd.put("SYSTIME", DateUtil.getSdfTime());
			//pd.put("ORDERINFO_ID", goods.getOrderNumber());
			pd.put("EXTGOOD_ID", goods.getGoodsNumber()); //第三方的 商品id
			pd.put("REMARK", goods.getRemark());
			pd.put("ORDERINFO_ID", UuidUtil.get32UUID());
			pd.put("STATUS", TO_PURCHASE);
			pd.put("BATCHNO", strBatchNo);

			PageData searchPd = new PageData();
			searchPd.put("ODER_ID", pd.get("ODER_ID"));
			searchPd.put("EXTGOOD_ID", pd.get("EXTGOOD_ID"));
			//判断是否重复订单 订单号+商品编号
			List<PageData> list = this.findByOrderIdAndGoodId(searchPd);
			if(!list.isEmpty()){
				existList.add(goods);
				continue;
			}
			try{
				this.save(pd);
				successList.add(goods);
			}catch(Exception e){
				failureList.add(goods);
			}
		}
		result.put(SUCCESS, successList);
		result.put(EXIST, existList);
		result.put(FAILURE, failureList);
		return result;
	}

	/**
	 * 删除
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("OrderinfoMapper.delete", pd);
	}

	/**
	 * 修改
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("OrderinfoMapper.edit", pd);
	}

	/**
	 * 重新采购 把订单状态重置为1 并且清除原有的供应商信息
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void rePurchaseupdate(PageData pd) throws Exception {
		dao.update("OrderinfoMapper.rePurchaseupdate", pd);
	}


	/**
	 * 列表
	 *
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked") public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrderinfoMapper.datalistPage", page);
	}


	/**
	 * 列表
	 *
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked") public List<PageData> purchaseList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrderinfoMapper.purchaseDatalistPage", page);
	}


	/**
	 * 列表
	 *
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked") public List<PageData> findByOrderIdAndGoodId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OrderinfoMapper.findByOrderIdAndGoodId", pd);
	}

	/**
	 * 列表(全部)
	 *
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked") public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OrderinfoMapper.listAll", pd);
	}

	/**
	 * 列表(全部)
	 *
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listToPurchase(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("OrderinfoMapper.listToPurchase", pd);
	}


	/**
	 * 按时间导出快递单号
	 *
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listToDeliveredExcel(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("OrderinfoMapper.listToDeliveredExcel", pd);
	}

	/**
	 * 通过id获取数据
	 *
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrderinfoMapper.findById", pd);
	}

	/**
	 * 批量删除
	 *
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("OrderinfoMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * caigou
	 * @param selectOrderIds
	 * @param selectSupplyProductIds
	 * @return
	 */
	public boolean purchase(String selectOrderIds, String selectSupplyProductIds) throws Exception{
		String[] selectOrderIdArray = selectOrderIds.split(",");
		PageData supplyPorductPD = new PageData();
		supplyPorductPD.put("SUPLYGOODINFO_ID", selectSupplyProductIds);
		PageData supplyProduct = suplygoodinfoService.findById(supplyPorductPD);
		System.out.println("============purchase================");
		System.out.println(supplyProduct);
		System.out.println("============purchase================");
		PageData supplyPD = new PageData();
		supplyPD.put("SUPPLIERINFO_ID", supplyProduct.getString("SUPPLIERINFO_ID"));
		PageData supply = supplierinfoService.findById(supplyPD);

		for(String orderId: selectOrderIdArray){
			PageData orderPD = new PageData();
			orderPD.put("ORDERINFO_ID", orderId);
			PageData order = this.findById(orderPD);

			PageData pd = new PageData();
			pd.put("ORDERINFO_ID", orderId);
			String purchasePrice = String.valueOf(supplyProduct.get("SUPLYPRICE"));
			pd.put("PURCHASEPRICE", purchasePrice);
			double totalPrice = Double.valueOf(purchasePrice) * Double.valueOf(order.getString("GOODNUM"));
			pd.put("PURCHASETOTALPRICE", String.valueOf(totalPrice));
			pd.put("SUPPLIER_ID", supply.getString("SUPPLIER_ID"));
			pd.put("SUPPLIERNAME", supply.getString("SUPPLIERNAME"));
			pd.put("SUPPLIER_EMAIL", supply.getString("EMAIL"));
			pd.put("SUPPLYGOOD_NAME", supplyProduct.getString("GOODNAME")); //供应商商品名称
			pd.put("STATUS", TO_DELIVERY);

			dao.update("OrderinfoMapper.purchase", pd);
		}

		return true;
	}

	/**
	 *
	 * @param varOList
	 * @return
	 */
	public void consignment(List<PageData> varOList) throws Exception{
		String strExporttime = DateUtil.getSdfTime();
		for(int i=0;i<varOList.size();i++){
			PageData orderPD = new PageData();
			orderPD.put("ORDERINFO_ID", varOList.get(i).getString("ORDERINFO_ID"));
			orderPD.put("STATUS", FINISHED);
			orderPD.put("EXPORTTIME",strExporttime);
			dao.update("OrderinfoMapper.consignment", orderPD);
		}


	}

    @Override public void uploadDelivery(List<Object> data) throws Exception{

		for(int i=0;i<data.size();i++){
			PageData varpd = (PageData)data.get(i);
			PageData orderPD = new PageData();
			String tmpStrexpressno = varpd.getString("var9");


			//如果快递单号不为空
			if(!StringUtils.isEmpty(tmpStrexpressno)) {
				orderPD.put("ORDERINFO_ID", varpd.getString("var0"));
				orderPD.put("EXPRESS", varpd.getString("var10"));
				orderPD.put("EXPRESSNO", varpd.getString("var9"));
				orderPD.put("STATUS", FINISHED);
			}
			dao.update("OrderinfoMapper.delivery", orderPD);
		}
    }


	/**
	 * 批量备份
	 *
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void backupAll(String[] ArrayDATA_IDS) throws Exception {
		dao.update("OrderinfoMapper.backupAll", ArrayDATA_IDS);
		dao.save("OrderinfoMapper.back2his", ArrayDATA_IDS);
	}




}

