package com.fh.controller.ehuarong.purchase;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;
import com.fh.service.ehuarong.purchase.PurchaseManager;
import com.fh.service.ehuarong.suplygoodinfo.SuplygoodinfoManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController  extends BaseController {

    String menuUrl = "purchase/list.do"; //菜单地址(权限用)
    @Resource(name="orderinfoService")
    private OrderinfoManager orderinfoService;

    @Resource(name="suplygoodinfoService")
    private SuplygoodinfoManager suplygoodinfoService;

    @Resource(name="purchaseService")
    private PurchaseManager purchaseService;

    /**列表
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/list")
    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"列表Purchaseinfo");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");				//关键词检索条件
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        String EXTGOOD_ID = pd.getString("EXTGOOD_ID");
        if(!StringUtils.isEmpty(EXTGOOD_ID)){
            pd.put("EXTGOOD_ID", EXTGOOD_ID.trim());
        }
        page.setPd(pd);
        List<PageData> varList = orderinfoService.purchaseList(page);	//列出Orderinfo列表
        mv.setViewName("ehuarong/purchase/purchase_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

    /**列表
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/toPurchase")
    public ModelAndView toPurchase(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+" 向供应商采购");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String selectIds = pd.getString("selectIds");				//关键词检索条件
        String selectOrderIds = pd.getString("selectOrderIds");     //当前页面做第二次检索时 把当前selectOrderIds值带上

        if(!StringUtils.isEmpty(selectOrderIds)) {
            selectIds = selectOrderIds;
        }
        pd.put("ORDERINFO_ID",selectIds);

        PageData orderinfopd = new PageData();
        orderinfopd = purchaseService.findById(pd);	//根据ID读取

        String goodName = pd.getString("goodName");				//关键词检索条件
        if(!StringUtils.isEmpty(goodName)){
            pd.put("GOODNAME", goodName.trim());
            pd.put("goodName", goodName.trim());
        }
        page.setPd(pd);
        List<PageData>	varList = suplygoodinfoService.listByGoodName(page);	//列出Suplygoodinfo列表

        mv.setViewName("ehuarong/purchase/purchase");
        mv.addObject("selectIds", selectIds);
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("orderinfopd", orderinfopd);
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

    /**列表
     * @throws Exception
     */
    @RequestMapping(value="/purchase")
    @ResponseBody
    public Object purchase() throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+" 采购操作");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String selectOrderIds = pd.getString("SELECT_ORDER_ID"); //已选择的订单ID
        String selectSupplyProductIds = pd.getString("DATA_IDS"); //已选择的商品供应商ID

        List<PageData> pdList = new ArrayList<PageData>();
        Map<String,Object> map = new HashMap<String,Object>();

        if(StringUtils.isEmpty(selectOrderIds)){
            pd.put("msg", "选择的订单ID为空");
            pdList.add(pd);
            map.put("list", pdList);
            return AppUtil.returnObject(pd, map);
        }

        if(StringUtils.isEmpty(selectSupplyProductIds)){
            pd.put("msg", "选择的商品供应商ID为空");
            pdList.add(pd);
            map.put("list", pdList);
            return AppUtil.returnObject(pd, map);
        }
        boolean isPurchased = orderinfoService.purchase(selectOrderIds, selectSupplyProductIds);
        if(isPurchased){
            pd.put("msg", "ok");
            pdList.add(pd);
            map.put("list", pdList);
            return AppUtil.returnObject(pd, map);
        }
        return  AppUtil.returnObject(pd, map);
    }



    /**去新增页面
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/goPurchase_other")
    public ModelAndView goPurchase_other()throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = purchaseService.findById(pd);	//根据ID读取
        mv.setViewName("ehuarong/purchase/purchase_other");
        mv.addObject("msg", "purchase_other_edit");
        mv.addObject("pd", pd);
        return mv;
    }


    /**修改
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/purchase_other_edit")
    public ModelAndView purchase_other_edit() throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"For 京东 淘宝单独采购");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "purchase_other_edit")){return null;} //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        purchaseService.purchase_other_edit(pd);
        mv.addObject("msg","success");
        mv.setViewName("save_result");
        return mv;
    }
}
