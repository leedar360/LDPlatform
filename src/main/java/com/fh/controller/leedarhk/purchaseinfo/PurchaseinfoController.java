package com.fh.controller.leedarhk.purchaseinfo;

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
import com.fh.service.leedarhk.purchaseinfo.PurchaseinfoManager;

/** 
 * 说明：采购主表
 * 创建人：FH Q313596790
 * 创建时间：2019-02-20
 */
@Controller
@RequestMapping(value="/purchaseinfo")
public class PurchaseinfoController extends BaseController {
	
	String menuUrl = "purchaseinfo/list.do"; //菜单地址(权限用)
	@Resource(name="purchaseinfoService")
	private PurchaseinfoManager purchaseinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Purchaseinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PURCHASEINFO_ID", this.get32UUID());	//主键
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//CREATETIME
		purchaseinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Purchaseinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		purchaseinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Purchaseinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		purchaseinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Purchaseinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = purchaseinfoService.list(page);	//列出Purchaseinfo列表
		mv.setViewName("leedarhk/purchaseinfo/purchaseinfo_list");
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
		mv.setViewName("leedarhk/purchaseinfo/purchaseinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}


	/**去采购页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goPur")
	public ModelAndView goPur()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("leedarhk/purchaseinfo/purchaseinfo_gopur");
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
		pd = purchaseinfoService.findById(pd);	//根据ID读取
		mv.setViewName("leedarhk/purchaseinfo/purchaseinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Purchaseinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			purchaseinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Purchaseinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("项目code");	//1
		titles.add("采购编号");	//2
		titles.add("采购金额美元");	//3
		titles.add("采购金额港币");	//4
		titles.add("人民币");	//5
		titles.add("供应商ID");	//6
		titles.add("其他货币");	//7
		titles.add("联系人1");	//8
		titles.add("联系人2");	//9
		titles.add("PHONE1");	//10
		titles.add("PHONE2");	//11
		titles.add("供应商名称");	//12
		titles.add("供应商银行缩写");	//13
		titles.add("银行名称");	//14
		titles.add("银行账号");	//15
		titles.add("银行地址1");	//16
		titles.add("银行地址");	//17
		titles.add("银行地址");	//18
		titles.add("采购状态");	//19
		titles.add("SWIFTCODE");	//20
		titles.add("CREATETIME");	//21
		titles.add("采购执行时间");	//22
		titles.add("remark");	//23
		titles.add("采购商地址");	//24
		titles.add("采购商地址");	//25
		titles.add("采购商地址");	//26
		dataMap.put("titles", titles);
		List<PageData> varOList = purchaseinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PROJECTCODE"));	    //1
			vpd.put("var2", varOList.get(i).getString("PURNUMBER"));	    //2
			vpd.put("var3", varOList.get(i).get("USD").toString());	//3
			vpd.put("var4", varOList.get(i).get("HKD").toString());	//4
			vpd.put("var5", varOList.get(i).get("CNY").toString());	//5
			vpd.put("var6", varOList.get(i).getString("SUPPLIERID"));	    //6
			vpd.put("var7", varOList.get(i).get("OTHERCURRENCY").toString());	//7
			vpd.put("var8", varOList.get(i).getString("CONTACT1"));	    //8
			vpd.put("var9", varOList.get(i).getString("CONTACT2"));	    //9
			vpd.put("var10", varOList.get(i).getString("PHONE1"));	    //10
			vpd.put("var11", varOList.get(i).getString("PHONE2"));	    //11
			vpd.put("var12", varOList.get(i).getString("COMPANYNAME"));	    //12
			vpd.put("var13", varOList.get(i).getString("COMPANYNAME_ABBRE"));	    //13
			vpd.put("var14", varOList.get(i).getString("BANKNAME"));	    //14
			vpd.put("var15", varOList.get(i).getString("BANKACCOUNT"));	    //15
			vpd.put("var16", varOList.get(i).getString("BANKADDRESS1"));	    //16
			vpd.put("var17", varOList.get(i).getString("BANKADDRESS2"));	    //17
			vpd.put("var18", varOList.get(i).getString("BANKADDRESS3"));	    //18
			vpd.put("var19", varOList.get(i).getString("PURSTATUS"));	    //19
			vpd.put("var20", varOList.get(i).getString("SWIFTCODE"));	    //20
			vpd.put("var21", varOList.get(i).getString("CREATETIME"));	    //21
			vpd.put("var22", varOList.get(i).getString("PURTIME"));	    //22
			vpd.put("var23", varOList.get(i).getString("REMARK"));	    //23
			vpd.put("var24", varOList.get(i).getString("SUPPLIERADDRESS1"));	    //24
			vpd.put("var25", varOList.get(i).getString("SUPPLIERADDRESS2"));	    //25
			vpd.put("var26", varOList.get(i).getString("SUPPLIERADDRESS3"));	    //26
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
