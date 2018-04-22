package com.fh.service.ehuarong.delivery.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ehuarong.delivery.DeliveryManager;

/** 
 * 说明： 华榕发货表
 * 创建人：WP
 * 创建时间：2018-03-26
 * @version
 */
@Service("deliveryService")
public class DeliveryService implements DeliveryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("OrderinfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("OrderinfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("OrderinfoMapper.deliveryedit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrderinfoMapper.deliveryList", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderinfoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrderinfoMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrderinfoMapper.deleteAll", ArrayDATA_IDS);
	}


	/**
	 * 发货列表
	 *
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> deliveryList(Page page) throws Exception{
		return (List<PageData>)dao.findForList("OrderinfoMapper.deliveryList", page);
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

