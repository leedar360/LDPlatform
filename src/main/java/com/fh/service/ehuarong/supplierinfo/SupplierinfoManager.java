package com.fh.service.ehuarong.supplierinfo;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 供应商信息表接口
 * 创建人：FH Q313596790
 * 创建时间：2018-04-06
 * @version
 */
public interface SupplierinfoManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;


	/**账单列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAccountExcel(PageData pd)throws Exception;


	/**售后图片列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAFPicExcel(PageData pd)throws Exception;


	/**供应商ID
	 * @throws Exception
	 */
	public List<PageData> distinctSupplyId() throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;


	/**通获得最大的supplyid
	 * @throws Exception
	 */
	public String getMaxsupplyid()throws Exception;

	
}

