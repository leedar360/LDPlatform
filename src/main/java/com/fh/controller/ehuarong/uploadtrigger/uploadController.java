package com.fh.controller.ehuarong.uploadtrigger;

import com.fh.controller.base.BaseController;
import com.fh.entity.ehuarong.Goods;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 说明：上传excel工具
 * 创建人：wp
 * 创建时间：2018-03-29
 */
@Controller @RequestMapping(value = "/uploadtrigger") public class uploadController extends BaseController {

    String menuUrl = "uploadtrigger/gopload.do"; //菜单地址(权限用)

    @Resource(name = "fhlogService") private FHlogManager FHLOG;

    @Resource(name = "orderinfoService") private OrderinfoManager orderinfoManager;

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/goupload") public ModelAndView goUpload() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "go to Upload excel page");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "goupload")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        mv.addObject("msg", "upload");
        mv.setViewName("ehuarong/uploadtrigger/uploadtrigger");
        return mv;
    }

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/upload") public ModelAndView upload(
            @RequestParam(value = "pltsource", required = true) String pltSource,
            @RequestParam(value = "excel", required = false) MultipartFile file) throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "导入订单");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        }
        if (null != file && !file.isEmpty()) {

            ExcelReader reader = new ExcelReader();
            List<Goods> content = reader.readGoodsWithPltSource(pltSource, file.getInputStream());
            orderinfoManager.save(content);

        }
        mv.setViewName("save_result");
        return mv;
    }
}