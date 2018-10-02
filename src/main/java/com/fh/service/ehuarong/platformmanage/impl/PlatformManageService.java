package com.fh.service.ehuarong.platformmanage.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ehuarong.platformmanage.PlatformManageManager;

/** 
 * 说明： 售卖平台录入管理
 * 创建人：FH Q313596790
 * 创建时间：2018-10-01
 * @version
 */
@Service("platformmanageService")
public class PlatformManageService implements PlatformManageManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PlatformManageMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PlatformManageMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PlatformManageMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PlatformManageMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PlatformManageMapper.listAll", pd);
	}

	/**得到平台code 和 name(全部)
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getdistinctPlatformId()throws Exception{
		return (List<PageData>)dao.findForList("PlatformManageMapper.distinctPlatformId", null);
	}


	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PlatformManageMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PlatformManageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

