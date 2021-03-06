package com.fh.service.ehuarong.orderinfo;

import com.fh.entity.Page;
import com.fh.entity.ehuarong.Goods;
import com.fh.util.PageData;

import java.util.List;
import java.util.Map;

/**
 * 说明： 订单信息表接口
 * 创建人：FH Q313596790
 * 创建时间：2018-03-29
 */
public interface OrderinfoManager {

	String SUCCESS= "success";
	String FAILURE= "failue";
	String EXIST= "exist";
	int TO_PURCHASE = 1; //待采购
	int TO_DELIVERY = 2; //已采购
	int FINISHED = 3; //已发货
	int TO_BACKUP = 4; //

	/**
	 * 新增
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception;

	/**
	 * 新增
	 *
	 * @param goodList
	 * @throws Exception
	 */
	public Map<String, List<Goods>> save(List<Goods> goodList) throws Exception;

	/**
	 * 删除
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception;

	/**
	 * 修改
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;



	/**
	 * 重新采购 重置状态为1
	 *
	 * @param pd
	 * @throws Exception
	 */
	public void rePurchaseupdate(PageData pd) throws Exception;



	/**
	 * 列表
	 *
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;



	/**
	 * 列表
	 *
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> purchaseList(Page page) throws Exception;


	/**
	 * 按时间导出快递单号到excel
	 *
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listToDeliveredExcel(PageData pd) throws Exception;


	/**
	 * 列表(全部)
	 *
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd) throws Exception;

	/**
	 * 列表(全部)
	 *
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listToPurchase(PageData pd) throws Exception;

	/**
	 * 通过id获取数据
	 *
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;

	/**
	 * 批量删除
	 *
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception;

	/**
	 * caigou
	 * @param selectOrderIds
	 * @param selectSupplyProductIds
	 * @return
	 */
	public boolean purchase(String selectOrderIds, String selectSupplyProductIds) throws Exception;


	/**
	 *
	 * @param varOList
	 * @return
	 */
	public void consignment(List<PageData> varOList) throws Exception;

	public void uploadDelivery(List<Object> data) throws Exception;


	/**
	 * 批量备份
	 *
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void backupAll(String[] ArrayDATA_IDS) throws Exception;
}

