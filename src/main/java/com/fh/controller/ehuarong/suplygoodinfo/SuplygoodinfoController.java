package com.fh.controller.ehuarong.suplygoodinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.service.ehuarong.supplierinfo.SupplierinfoManager;
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
import com.fh.service.ehuarong.suplygoodinfo.SuplygoodinfoManager;

/** 
 * 说明：suplygoodinfo
 * 创建人：FH Q313596790
 * 创建时间：2018-04-08
 */
@Controller
@RequestMapping(value="/suplygoodinfo")
public class SuplygoodinfoController extends BaseController {
	
	String menuUrl = "suplygoodinfo/list.do"; //菜单地址(权限用)
	@Resource(name="suplygoodinfoService")
	private SuplygoodinfoManager suplygoodinfoService;
	@Resource(name="supplierinfoService")
	private SupplierinfoManager supplierinfoService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Suplygoodinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SUPLYGOODINFO_ID", this.get32UUID());	//主键
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		suplygoodinfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Suplygoodinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		suplygoodinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Suplygoodinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		suplygoodinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Suplygoodinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = suplygoodinfoService.list(page);	//列出Suplygoodinfo列表
		mv.setViewName("ehuarong/suplygoodinfo/suplygoodinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Page page = new Page();
		page.setPd(pd);
//		List<PageData>	varList = supplierinfoService.list(page);	//列出Supplierinfo列表
		List<PageData> distinctSupplyId = supplierinfoService.distinctSupplyId();
//		mv.addObject("varList", varList);
		mv.addObject("distinctSupplyId", distinctSupplyId);
		mv.setViewName("ehuarong/suplygoodinfo/suplygoodinfo_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = suplygoodinfoService.findById(pd);	//根据ID读取
		mv.setViewName("ehuarong/suplygoodinfo/suplygoodinfo_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Suplygoodinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			suplygoodinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Suplygoodinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("供应商id");	//1
		titles.add("供应商名称");	//2
		titles.add("商品编号");	//3
		titles.add("商品名称");	//4
		titles.add("单位");	//5
		titles.add("规格");	//6
		titles.add("说明");	//7
		titles.add("商品类别号");	//8
		titles.add("备注");	//9
		titles.add("创建时间");	//10
		titles.add("供应价格");	//11
		titles.add("有效时间start");	//12
		titles.add("有效时间end");	//13
		titles.add("上下架状态");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = suplygoodinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SUPPLIER_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("SUPPLIERNAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("GOOD_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("GOODNAME"));	    //4
			vpd.put("var5", varOList.get(i).getString("UNIT"));	    //5
			vpd.put("var6", varOList.get(i).getString("SPEC"));	    //6
			vpd.put("var7", varOList.get(i).getString("MEMO"));	    //7
			vpd.put("var8", varOList.get(i).getString("CATEGORYID"));	    //8
			vpd.put("var9", varOList.get(i).getString("REMARK"));	    //9
			vpd.put("var10", varOList.get(i).getString("CREATETIME"));	    //10
			vpd.put("var11", varOList.get(i).get("SUPLYPRICE").toString());	//11
			vpd.put("var12", varOList.get(i).getString("STARTTIME"));	    //12
			vpd.put("var13", varOList.get(i).getString("ENDTIME"));	    //13
			vpd.put("var14", varOList.get(i).getString("SELLSTATUS"));	    //14
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
