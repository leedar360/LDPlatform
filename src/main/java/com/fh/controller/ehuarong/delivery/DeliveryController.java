package com.fh.controller.ehuarong.delivery;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ehuarong.delivery.DeliveryManager;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelRead;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/delivery")
public class DeliveryController extends BaseController {

    String menuUrl = "delivery/list.do"; //菜单地址(权限用)
    @Resource(name="deliveryService")
    private DeliveryManager deliveryService;

    @Resource(name="orderinfoService")
    private OrderinfoManager orderinfoService;

    @Resource(name = "fhlogService")
    private FHlogManager FHLOG;

    /**列表
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/list")
    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+" 发货列表 delivery list ");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");				//关键词检索条件
        String lastStart = pd.getString("lastStart");
        String lastEnd = pd.getString("lastEnd");

        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        String EXTGOOD_ID = pd.getString("EXTGOOD_ID");
        if(!StringUtils.isEmpty(EXTGOOD_ID)){
            pd.put("EXTGOOD_ID", EXTGOOD_ID.trim());
        }
        if(null != lastStart && !"".equals(lastStart)){
            pd.put("lastStart", lastStart.trim());
        }
        if(null != lastEnd && !"".equals(lastEnd)){
            pd.put("lastEnd", lastEnd.trim());
        }

        page.setPd(pd);

        List<PageData> varList = orderinfoService.list(page);
//        goodsService.list(page);
        mv.setViewName("ehuarong/delivery/delivery_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goUploadDelivery") public ModelAndView goUploadDelivery() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "go to Upload excel page");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "goupload")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        mv.addObject("msg", "upload");
        mv.setViewName("ehuarong/delivery/upload_delivery");
        return mv;
    }

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/saveUpload") public ModelAndView upload(
            @RequestParam(value = "excel", required = false) MultipartFile file) throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "导入订单");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();

        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        }
        if (null != file && !file.isEmpty()) {
            List<Object> data = ObjectExcelRead.readExcel(file.getInputStream(), 1,0,0);
            orderinfoService.uploadDelivery(data);
            mv.addObject("successed", data.size());
        }

        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        mv.setViewName("ehuarong/delivery/save_result");
        return mv;
    }


    /**去修改页面
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/goEdit")
    public ModelAndView goEdit()throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = orderinfoService.findById(pd);	//根据ID读取
        mv.setViewName("ehuarong/delivery/delivery_edit");
        mv.addObject("msg", "edit");
        mv.addObject("pd", pd);
        return mv;
    }

    /**修改
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit() throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+" 修改 delivery");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        deliveryService.edit(pd);
        mv.addObject("msg","success");
        mv.setViewName("save_result");
        return mv;
    }



    /**批量备份
     * 把交易成功的列表 备份status 为bak，同时把这些hr_orderinfo 的记录 insert 到 hr_orderinfo_his 表中
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/backupAll")
    @ResponseBody
    public Object bakupAll() throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"批量备份 Orderinfo to Orderinfo_his");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
        PageData pd = new PageData();
        Map<String,Object> map = new HashMap<String,Object>();
        pd = this.getPageData();
        List<PageData> pdList = new ArrayList<PageData>();
        String DATA_IDS = pd.getString("DATA_IDS");

        if(null != DATA_IDS && !"".equals(DATA_IDS)){
            String ArrayDATA_IDS[] = DATA_IDS.split(",");
            orderinfoService.backupAll(ArrayDATA_IDS);
            pd.put("msg", "ok");
        }else{
            pd.put("msg", "no");
        }
        pdList.add(pd);
        map.put("list", pdList);
        return AppUtil.returnObject(pd, map);
    }


}
