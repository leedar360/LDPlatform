package com.fh.service.ehuarong.delivery;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 华榕商品表接口
 * 创建人：FH Q313596790
 * 创建时间：2018-03-26
 * @version
 */
public interface DeliveryManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;

	/** 标记售后 'AFS'
	 * @param pd
	 * @throws Exception
	 */
	public void toaftersale(PageData pd) throws Exception;


	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;

	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd) throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception;

	/**
	 * 发货列表
	 *
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> deliveryList(Page page) throws Exception;


	/**
	 * 未发货列表
	 *
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> undeliverylist(Page page) throws Exception;



}

