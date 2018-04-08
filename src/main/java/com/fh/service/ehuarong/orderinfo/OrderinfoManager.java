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
	 * 列表
	 *
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;

	/**
	 * 列表(全部)
	 *
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd) throws Exception;

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

}

