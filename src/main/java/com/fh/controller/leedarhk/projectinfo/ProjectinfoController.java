package com.fh.controller.leedarhk.projectinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.service.leedarhk.contractinfo.ContractInfoManager;
import com.fh.service.leedarhk.customerinfo.CustomerinfoManager;
import com.fh.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.leedarhk.projectinfo.ProjectinfoManager;

/** 
 * 说明：项目表计划表
 * 创建人：FH Q313596790
 * 创建时间：2019-02-16
 */
@Controller
@RequestMapping(value="/projectinfo")
public class ProjectinfoController extends BaseController {
	
	String menuUrl = "projectinfo/list.do"; //菜单地址(权限用)
	@Resource(name="projectinfoService")
	private ProjectinfoManager projectinfoService;

	@Resource(name="customerinfoService")
	private CustomerinfoManager customerinfoService;

	@Resource(name="contractinfoService")
	private ContractInfoManager contractinfoService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Projectinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROJECTINFO_ID", this.get32UUID());	//主键
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//系统时间
		projectinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Projectinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		projectinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Projectinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		projectinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Projectinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = projectinfoService.list(page);	//列出Projectinfo列表
		mv.setViewName("leedarhk/projectinfo/projectinfo_list");
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
		mv.setViewName("leedarhk/projectinfo/projectinfo_edit");
		pd.put("PROJECTCODE", "PROJ" + DateUtil.getDays() +  UuidUtil.get4UUID()); //项目主键
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
		pd = projectinfoService.findById(pd);	//根据ID读取
		mv.setViewName("leedarhk/projectinfo/projectinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Projectinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			projectinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Projectinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("项目code");	//1
		titles.add("项目名称");	//2
		titles.add("项目执行说明");	//3
		titles.add("项目执行时间");	//4
		titles.add("执行结束时间");	//5
		titles.add("系统时间");	//6
		titles.add("备注");	//7
		titles.add("项目状态");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = projectinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PROJECTCODE"));	    //1
			vpd.put("var2", varOList.get(i).getString("PROJECTNAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("PROJECTNOTE"));	    //3
			vpd.put("var4", varOList.get(i).getString("STARTTIME"));	    //4
			vpd.put("var5", varOList.get(i).getString("ENDTIME"));	    //5
			vpd.put("var6", varOList.get(i).getString("CREATETIME"));	    //6
			vpd.put("var7", varOList.get(i).getString("REMARK"));	    //7
			vpd.put("var8", varOList.get(i).getString("PROJECTSTATUS"));	    //8
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}

	/** 新建 po
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveNewPo")
	public ModelAndView saveNewPo() throws Exception{

		logBefore(logger, Jurisdiction.getUsername()+"新建 订单 PO");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData popd = new PageData();
		popd.put("PROJECTCODE", pd.getString("PROJECTCODE"));	//主键
		popd.put("USD", pd.get("USD"));							//计划金额
		popd.put("CUSTOMER_ID", pd.getString("CUSTOMER_ID"));	//主键
		popd.put("CREATETIME", Tools.date2Str(new Date()));		//系统时间
		popd.put("PLANTIME", pd.getString("STARTTIME"));		//系统时间
		popd.put("CONTRACTINFO_ID", this.get32UUID());			// 订单的 uuid
		popd.put("PONUMBER", "PO" + DateUtil.getDays() + UuidUtil.get4UUID());		// 订单的 uuid
		popd.put("REMARK", pd.getString("REMARK"));				// 备注

		contractinfoService.save(popd);
		/* todo
		*  改变 projectinfo 主表 status
		* */

		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	/**保存
	 * @param
	 * @throws Exception
	 */
	//	@RequestMapping(value="/saveNewExep")
	//	public ModelAndView saveNewExep() throws Exception{
	//		return new ModelAndView();
	//	}


	/**去新增 订单 页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddNewPo")
	public ModelAndView goAddNewPo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		List<PageData> customerIdList = customerinfoService.getCustomerIdList();

		pd.put("PROJECTCODE", pd.getString("PROJECTCODE"));
		mv.setViewName("leedarhk/projectinfo/contractinfo_add");
		mv.addObject("customerIdList", customerIdList);
		mv.addObject("msg", "saveNewPo");
		mv.addObject("pd", pd);
		return mv;
	}

	/**去新增 支出 页面 goAddNewExep
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddNewExep")
	public ModelAndView goAddNewExep()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("leedarhk/projectinfo/expensesinfo_add");
		mv.addObject("msg", "saveNewExep");
		mv.addObject("pd", pd);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
