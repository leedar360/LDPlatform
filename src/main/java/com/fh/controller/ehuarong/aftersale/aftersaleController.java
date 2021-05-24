package com.fh.controller.ehuarong.aftersale;


import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ehuarong.aftersale.AftersaleManager;
import com.fh.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping(value="/aftersale")

public class AftersaleController  extends BaseController {

    String menuUrl = "aftersale/list.do"; //菜单地址(权限用)

    @Resource(name="aftersaleService")
    private AftersaleManager aftersaleService;


    /** 列出
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/list")
    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"校验用户 AfterSale");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");
        String lastStart = pd.getString("lastStart");
        String lastEnd = pd.getString("lastEnd");

        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        if(null != lastStart && !"".equals(lastStart)){
            pd.put("lastStart", lastStart.trim());
        }
        if(null != lastEnd && !"".equals(lastEnd)){
            pd.put("lastEnd", lastEnd.trim());
        }

        page.setPd(pd);
        List<PageData>	varList = aftersaleService.list(page);	//列表
        mv.setViewName("ehuarong/aftersale/aftersale_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX",Jurisdiction.getHC());
        return mv;
    }



    /**
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/goEdit")
    public ModelAndView goEdit()throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd = aftersaleService.findById(pd);	//
        mv.setViewName("ehuarong/aftersale/aftersale_edit");
        mv.addObject("msg", "edit");
        mv.addObject("pd", pd);
        return mv;
    }


    /**编辑
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit()throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+" 编辑");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //菜单权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        aftersaleService.edit(pd);	//编辑
        mv.addObject("msg","success");
        mv.setViewName("save_result");
        return mv;
    }



    /**
     * @return
     */
    @RequestMapping(value="/goOpenpiclist")
    public ModelAndView goOpenpiclist() throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("ORDERINFO_ID",pd.getString("ORDERINFO_ID"));
        List<PageData>	varList = aftersaleService.openpiclist(pd);	//编辑
        mv.setViewName("ehuarong/aftersale/afs_openpiclist");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        return mv;
    }

    /**
     * @return
     */
    @RequestMapping(value="/goAdd")
    public ModelAndView goAdd() throws Exception{
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("ehuarong/aftersale/aftersalepic_add");
        mv.addObject("pd", pd);
        return mv;
    }



    /** 新增图片
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/save")
    @ResponseBody
    public Object save(
            @RequestParam(required=false) MultipartFile file
    ) throws Exception{
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();


        if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
        logBefore(logger, Jurisdiction.getUsername()+"新增图片");
        Map<String,String> map = new HashMap<String,String>();
        String  ffile = DateUtil.getDays(), fileName = "";
        PageData pd = new PageData();

        System.out.println("==============" + pd.getString("ORDERINFO_ID") );
        System.out.println("**************" + request.getParameter("ORDERINFO_ID") );
        String ORDERINFO_ID = request.getParameter("ORDERINFO_ID");
        if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){
            if (null != file && !file.isEmpty()) {
                String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
                fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
            }else{
                System.out.println("上传失败");
            }
            pd.put("AFTERSALEPIC_ID", this.get32UUID());			        //主键
            pd.put("ORDERINFO_ID", ORDERINFO_ID);					//订单ID
            pd.put("AFSTITLE", "图片标题");							//标题
            pd.put("AFSNAME", fileName);							//文件名
            pd.put("AFSPATH", ffile + "/" + fileName);				//路径
            pd.put("CREATETIME", Tools.date2Str(new Date()));	    //创建时间
            pd.put("AFSNOTE","");	                                //NOTE
//            pd.put("MASTER_ID", "1");							    //附属与
            pd.put("REMARK", "备注");						        //备注
//            Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);   //加水印
            aftersaleService.savepic(pd); //保存到 hr_aftersalepic
        }
        map.put("result", "ok");
        return AppUtil.returnObject(pd, map);
    }


}
