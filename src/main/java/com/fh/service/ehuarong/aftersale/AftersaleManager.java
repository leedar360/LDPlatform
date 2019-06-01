package com.fh.service.ehuarong.aftersale;

import com.fh.entity.Page;
import com.fh.entity.ehuarong.Goods;
import com.fh.util.PageData;

import java.util.List;
import java.util.Map;

public interface AftersaleManager {

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
     * 当前订单下的售后图片列表
     *
     * @param pd
     * @throws Exception
     */
    public List<PageData> openpiclist(PageData pd) throws Exception;



    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception;

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void savepic(PageData pd) throws Exception;


}