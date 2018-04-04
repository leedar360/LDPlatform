package com.fh.controller.ehuarong.uploadtrigger;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;

/**
 * 说明：上传excel工具
 * 创建人：wp
 * 创建时间：2018-03-29
 */
@Controller
@RequestMapping(value="/uploadtrigger")
public class uploadController extends BaseController {
    String menuUrl = "uploadtrigger/gopload.do"; //菜单地址(权限用)

    /**保存
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/goupload")
    public ModelAndView goUpload() throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"新增Upload");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "goupload")){return null;} //校验权限
        ModelAndView mv = this.getModelAndView();
//        PageData pd = new PageData();
//        pd = this.getPageData();
//        pd.put("ATTACHED_ID", this.get32UUID());	//主键
//        pd.put("CTIME", Tools.date2Str(new Date()));	//创建时间
//        attachedService.save(pd);
        mv.addObject("msg","success");
//        mv.setViewName("ehuarong/uploadtrigger/uploadtrigger");
        mv.setViewName("uploadtrigger");
        return mv;
    }
}