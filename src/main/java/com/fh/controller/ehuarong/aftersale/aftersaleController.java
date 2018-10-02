package com.fh.controller.ehuarong.aftersale;


import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ehuarong.aftersale.AftersaleManager;
import com.fh.util.AppUtil;
import com.fh.util.DateUtil;
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
@RequestMapping(value="/aftersale")

public class aftersaleController  extends BaseController {

    String menuUrl = "aftersale/list.do"; //菜单地址(权限用)

    @Resource(name="aftersaleService")
    private AftersaleManager aftersaleService;


    /**列表
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/list")

    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"列表 售后列表");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");				//关键词检索条件
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
//        String EXTGOOD_ID = pd.getString("EXTGOOD_ID");
//        if(!StringUtils.isEmpty(EXTGOOD_ID)){
//            pd.put("EXTGOOD_ID", EXTGOOD_ID.trim());
//        }
        page.setPd(pd);
        List<PageData> varList = aftersaleService.list(page);	//列出售后列表
        mv.setViewName("ehuarong/aftersale/aftersale_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

}
