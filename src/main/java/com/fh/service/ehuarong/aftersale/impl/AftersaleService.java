package com.fh.service.ehuarong.aftersale.impl;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.ehuarong.Goods;
import com.fh.service.ehuarong.aftersale.AftersaleManager;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;
import com.fh.service.ehuarong.suplygoodinfo.SuplygoodinfoManager;
import com.fh.service.ehuarong.supplierinfo.SupplierinfoManager;
import com.fh.util.*;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("aftersaleService")
public class AftersaleService implements AftersaleManager {

    protected Logger logger = Logger.getLogger(this.getClass());

    @Resource(name = "daoSupport")
    private DaoSupport dao;



    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception{
        dao.update("AftersaleMapper.edit", pd);
    }


    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    public List<PageData> list(Page page) throws Exception{
        return (List<PageData>) dao.findForList("AftersaleMapper.listPage", page);
    }

    /**
     * 当前订单下的图片列表
     *
     * @param pd
     * @throws Exception
     */
    public List<PageData> openpiclist(PageData pd) throws Exception{
        return (List<PageData>) dao.findForList("AftersalepicMapper.openpiclist", pd);
    }


    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception{
        return (PageData) dao.findForObject("AftersaleMapper.findById", pd);
    }

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void savepic(PageData pd) throws Exception {
        dao.save("AftersalepicMapper.save", pd);
    }

}