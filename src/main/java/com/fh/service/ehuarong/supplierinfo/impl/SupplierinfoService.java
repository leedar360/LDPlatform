package com.fh.service.ehuarong.supplierinfo.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ehuarong.supplierinfo.SupplierinfoManager;

/** 
 * 说明： 供应商信息表
 * 创建人：FH Q313596790
 * 创建时间：2018-04-06
 * @version
 */
@Service("supplierinfoService")
public class SupplierinfoService implements SupplierinfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SupplierinfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("SupplierinfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SupplierinfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SupplierinfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SupplierinfoMapper.listAll", pd);
	}

	/**供应商ID
	 * @throws Exception
	 */
	public List<PageData> distinctSupplyId() throws Exception{
		return (List<PageData>)dao.findForList("SupplierinfoMapper.distinctSupplyId", null);
	}


	/** 账单列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAccountExcel(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderinfoMapper.listAccountExcel", pd);
	}


	/** 售后图片列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAFPicExcel(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AftersalepicMapper.listAfpicPage", pd);
	}



	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SupplierinfoMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SupplierinfoMapper.deleteAll", ArrayDATA_IDS);
	}


	public String getMaxsupplyid() throws Exception{
		List listPage = (List<PageData>)dao.findForList("SupplierinfoMapper.getMaxsupplyid", null);
		PageData pd = (PageData)listPage.get(0);
		String strMaxsupplyid = (String)pd.get("maxSupplyid");
		String strLastMaxsupplyid = strMaxsupplyid.substring(2,strMaxsupplyid.length());
		int intLastMaxsupplyid = Integer.valueOf(strLastMaxsupplyid);
		// 0 代表前面补充0
		// 4 代表长度为4
		// d 代表参数为正数型
		String str = String.format("%03d", intLastMaxsupplyid+1);

		return "SP" + str;
	}


}

