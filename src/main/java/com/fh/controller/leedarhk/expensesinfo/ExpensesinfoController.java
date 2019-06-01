package com.fh.controller.leedarhk.expensesinfo;

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
import com.fh.service.leedarhk.expensesinfo.ExpensesinfoManager;

/** 
 * 说明：日常支出表，包括工资，报销等
 * 创建人：FH Q313596790
 * 创建时间：2019-02-16
 */
@Controller
@RequestMapping(value="/expensesinfo")
public class ExpensesinfoController extends BaseController {
	
	String menuUrl = "expensesinfo/list.do"; //菜单地址(权限用)
	@Resource(name="expensesinfoService")
	private ExpensesinfoManager expensesinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Expensesinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EXPENSESINFO_ID", this.get32UUID());	//主键
		pd.put("STARTTIME", Tools.date2Str(new Date()));	//计划执行时间
		pd.put("ENDTIME", Tools.date2Str(new Date()));	//计划结束时间
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建日期
		expensesinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Expensesinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		expensesinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Expensesinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		expensesinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Expensesinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = expensesinfoService.list(page);	//列出Expensesinfo列表
		mv.setViewName("leedarhk/expensesinfo/expensesinfo_list");
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
		mv.setViewName("leedarhk/expensesinfo/expensesinfo_edit");
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
		pd = expensesinfoService.findById(pd);	//根据ID读取
		mv.setViewName("leedarhk/expensesinfo/expensesinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Expensesinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			expensesinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Expensesinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("id");	//1
		titles.add("项目code");	//2
		titles.add("支出名称");	//3
		titles.add("支出说明");	//4
		titles.add("事情发生日期");	//5
		titles.add("金额港币");	//6
		titles.add("金额人民币");	//7
		titles.add("美金");	//8
		titles.add("计划执行时间");	//9
		titles.add("计划结束时间");	//10
		titles.add("资金执行日期");	//11
		titles.add("提交人");	//12
		titles.add("联系电话1");	//13
		titles.add("联系电话2");	//14
		titles.add("email1");	//15
		titles.add("email2");	//16
		titles.add("创建日期");	//17
		titles.add("备注");	//18
		dataMap.put("titles", titles);
		List<PageData> varOList = expensesinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("EXPENSES_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("PROJECTCODE"));	    //2
			vpd.put("var3", varOList.get(i).getString("EXPNAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("EXPNOTE"));	    //4
			vpd.put("var5", varOList.get(i).getString("HAPPENTIME"));	    //5
			vpd.put("var6", varOList.get(i).get("HKD").toString());	//6
			vpd.put("var7", varOList.get(i).get("CNY").toString());	//7
			vpd.put("var8", varOList.get(i).get("USD").toString());	//8
			vpd.put("var9", varOList.get(i).getString("STARTTIME"));	    //9
			vpd.put("var10", varOList.get(i).getString("ENDTIME"));	    //10
			vpd.put("var11", varOList.get(i).getString("EXETIME"));	    //11
			vpd.put("var12", varOList.get(i).getString("SUBMITPERSON"));	    //12
			vpd.put("var13", varOList.get(i).getString("PHONE1"));	    //13
			vpd.put("var14", varOList.get(i).getString("PHONE2"));	    //14
			vpd.put("var15", varOList.get(i).getString("EMAIL1"));	    //15
			vpd.put("var16", varOList.get(i).getString("EMAIL2"));	    //16
			vpd.put("var17", varOList.get(i).getString("CREATETIME"));	    //17
			vpd.put("var18", varOList.get(i).getString("REMARK"));	    //18
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
