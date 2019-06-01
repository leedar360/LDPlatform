package com.fh.service.leedarhk.purchaseinfo.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.leedarhk.purchaseinfo.PurchaseinfoManager;

/** 
 * 说明： 采购主表
 * 创建人：FH Q313596790
 * 创建时间：2019-02-20
 * @version
 */
@Service("purchaseinfoService")
public class PurchaseinfoService implements PurchaseinfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PurchaseinfoMapper.save", pd);
	}

	/**由订单插入采购单
	 * @param pd
	 * @throws Exception
	 */
	public void insertPO(PageData pd)throws Exception{
		dao.save("PurchaseinfoMapper.insertpo", pd);
	}


	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PurchaseinfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PurchaseinfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PurchaseinfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PurchaseinfoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PurchaseinfoMapper.findById", pd);
	}


	/**通过ponumber获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByPOnumberInPur(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PurchaseinfoMapper.findByPOnumberInPur", pd);
	}

	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PurchaseinfoMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

