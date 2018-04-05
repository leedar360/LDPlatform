package com.fh.service.ehuarong.orderinfo.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.ehuarong.Goods;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.beans.Transient;
import java.util.List;

/**
 * 说明： 订单信息表
 * 创建人：FH Q313596790
 * 创建时间：2018-03-29
 */
@Service("orderinfoService") public class OrderinfoService implements OrderinfoManager {

	@Resource(name = "daoSupport") private DaoSupport dao;

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
	public void save(List<Goods> goodList) throws Exception{
		for(Goods goods : goodList){
			PageData pd = new PageData();
			pd.put("ODER_ID", goods.getOrderNumber()); //订单编号
			pd.put("GOODNUM", goods.getOrderCount()); //商品数量
			//pd.put("GOODSNAME", goods.getShopGoodsName()) ;//商品名称

			pd.put("SELLNAME", ""); // 发件人
			pd.put("SELLPHONE", ""); //发件电话

			pd.put("RECNAME", goods.getCustomerName()); //收件人姓名
			pd.put("RECPHONE", goods.getCustomerPhone()); // 收件人电话
			pd.put("RECADDRESS", goods.getCustomerAddress()); //收件人地址
			pd.put("EXPRESS", "");// 快递公司
			pd.put("EXPRESSNO", ""); //快递单号

			//pd.put("SELLPRICE", goods.getGoodsPrice()); //商品售价单价
			//pd.put("SELLTOTALPRICE", goods.getOrderMaoney()); //商品售价总价
			//pd.put("PURCHASEPRICE", ""); //商品采购单价
			//pd.put("PURCHASETOTALPRICE", ""); //商品采购总价
			pd.put("PLATFORMID", goods.getPltSource()); //平台
			pd.put("SUPPLIER_ID", "");
			pd.put("SUPPLIER_EMAIL", "");
			pd.put("CREATETIME", goods.getOrderDate());

			//pd.put("ORDERINFO_ID", goods.getOrderNumber());
			pd.put("EXTGOOD_ID", goods.getGoodsNumber().indexOf(".") > 0?goods.getGoodsNumber().substring(0, goods.getGoodsNumber().indexOf(".")):goods.getGoodsNumber()); //第三方的 商品id
			pd.put("REMARK", goods.getRemark());
			pd.put("ORDERINFO_ID", UuidUtil.get32UUID());

			PageData searchPd = new PageData();
			this.save(pd);

		}
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
	 * 列表
	 *
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked") public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrderinfoMapper.datalistPage", page);
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

}

