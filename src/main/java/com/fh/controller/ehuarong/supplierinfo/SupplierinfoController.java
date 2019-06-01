package com.fh.controller.ehuarong.supplierinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

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
import com.fh.service.ehuarong.supplierinfo.SupplierinfoManager;

/** 
 * 说明：供应商信息表
 * 创建人：FH Q313596790
 * 创建时间：2018-04-06
 */
@Controller
@RequestMapping(value="/supplierinfo")
public class SupplierinfoController extends BaseController {
	
	String menuUrl = "supplierinfo/list.do"; //菜单地址(权限用)
	@Resource(name="supplierinfoService")
	private SupplierinfoManager supplierinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Supplierinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SUPPLIERINFO_ID", this.get32UUID());	//主键
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		supplierinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Supplierinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		supplierinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Supplierinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		supplierinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Supplierinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String SUPPLIER_ID = pd.getString("SUPPLIER_ID");
		if(null != SUPPLIER_ID && !"".equals(SUPPLIER_ID)){
			pd.put("SUPPLIER_ID", SUPPLIER_ID.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = supplierinfoService.list(page);	//列出Supplierinfo列表
		List<PageData> distinctSupplyId = supplierinfoService.distinctSupplyId();
		mv.setViewName("ehuarong/supplierinfo/supplierinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("distinctSupplyId", distinctSupplyId);
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

		// 处理supplyID 自动加一  sp00N --> sp00(N+1)
		String strSupplyid =  supplierinfoService.getMaxsupplyid();

		pd.put("SUPPLIER_ID",strSupplyid);


		mv.setViewName("ehuarong/supplierinfo/supplierinfo_add");
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
		pd = supplierinfoService.findById(pd);	//根据ID读取
		mv.setViewName("ehuarong/supplierinfo/supplierinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Supplierinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			supplierinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Supplierinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("供应商id");	//1
		titles.add("供应商名称");	//2
		titles.add("联系人");	//3
		titles.add("联系电话");	//4
		titles.add("email");	//5
		titles.add("联系地址");	//6
		titles.add("开户银行");	//7
		titles.add("银行账号");	//8
		titles.add("微信");	//9
		titles.add("支付宝");	//10
		titles.add("备注");	//11
		titles.add("创建时间");	//12
		dataMap.put("titles", titles);
		List<PageData> varOList = supplierinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SUPPLIER_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("SUPPLIERNAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("CONTACT"));	    //3
			vpd.put("var4", varOList.get(i).getString("PHONE"));	    //4
			vpd.put("var5", varOList.get(i).getString("EMAIL"));	    //5
			vpd.put("var6", varOList.get(i).getString("ADDRESS"));	    //6
			vpd.put("var7", varOList.get(i).getString("BANK"));	    //7
			vpd.put("var8", varOList.get(i).getString("BANKNO"));	    //8
			vpd.put("var9", varOList.get(i).getString("WEIXIN"));	    //9
			vpd.put("var10", varOList.get(i).getString("ZHIFUBAO"));	    //10
			vpd.put("var11", varOList.get(i).getString("REMARK"));	    //11
			vpd.put("var12", varOList.get(i).getString("CREATETIME"));	    //12
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}



	/**导出账单到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/accountexcel")
	public ModelAndView exportAccountExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出 账单到 excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();

		PageData pd = new PageData();
		pd = this.getPageData();
		//	get 日期
		String lastStart = pd.getString("lastStart");
		String lastEnd = pd.getString("lastEnd");
		String supplyid = pd.getString("supplyid");

		if(null != lastStart && !"".equals(lastStart)){
			pd.put("lastStart", lastStart.trim());
		}
		if(null != lastEnd && !"".equals(lastEnd)){
			pd.put("lastEnd", lastEnd.trim());
		}
		if(null != supplyid && !"".equals(supplyid)){
			pd.put("keywords", supplyid.trim());
		}
		//
		Map<String,Object> TotaldataMap = new HashMap<String,Object>(); // 1 dataMap; 2 picMap


		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单编号");	//1
		titles.add("联系人");	//3
		titles.add("联系电话");	//4
		titles.add("快递公司");	//5
		titles.add("快递编号");	//6
		titles.add("商品名称");	//SUPPLYGOOD_NAME
		titles.add("数量");	//2
		titles.add("采购单价");	//7
		titles.add("采购总价");	//8
		titles.add("供应商名称");	//8
		titles.add("下单时间");	//9
		titles.add("售后金额");	//10
		titles.add("售后说明");	//11
		titles.add("备注");	    //13
		dataMap.put("titles", titles);
		List<PageData> varOList = supplierinfoService.listAccountExcel(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ODER_ID"));
			vpd.put("var2", varOList.get(i).getString("RECNAME"));
			vpd.put("var3", varOList.get(i).getString("RECPHONE"));
			vpd.put("var4", varOList.get(i).getString("EXPRESS"));
			vpd.put("var5", varOList.get(i).getString("EXPRESSNO"));
			vpd.put("var6", varOList.get(i).getString("SUPPLYGOOD_NAME"));
			vpd.put("var7", varOList.get(i).getString("GOODNUM"));
			vpd.put("var8", String.valueOf(varOList.get(i).get("PURCHASEPRICE")));
			vpd.put("var9", String.valueOf(varOList.get(i).get("PURCHASETOTALPRICE")));
			vpd.put("var10", varOList.get(i).getString("SUPPLIERNAME"));
			vpd.put("var11", varOList.get(i).getString("EXPORTTIME"));
			vpd.put("var12", String.valueOf(varOList.get(i).get("AFSALEPRICE")));
			vpd.put("var13", varOList.get(i).getString("AFSALEREMARK"));
			vpd.put("var14", varOList.get(i).getString("REMARK"));
			varList.add(vpd);
		}
		dataMap.put("varList", varList);


		// get 售后中带图片的 数据

		List<PageData> varPicList = supplierinfoService.listAFPicExcel(pd);
		List<PageData> varPList = new ArrayList<PageData>();
		for(int i=0;i<varPicList.size();i++){
			PageData vpd = new PageData();
			vpd.put("afpicvar1", varPicList.get(i).getString("AFSPATH"));	    //1
			vpd.put("afpicvar2", varPicList.get(i).getString("ODER_ID"));	    //1
			vpd.put("afpicvar3", varPicList.get(i).getString("RECNAME"));
			vpd.put("afpicvar4", varPicList.get(i).getString("RECPHONE"));
			vpd.put("afpicvar5", varPicList.get(i).getString("EXPRESS"));
			vpd.put("afpicvar6", varPicList.get(i).getString("EXPRESSNO"));
			vpd.put("afpicvar7", varPicList.get(i).getString("SUPPLIERNAME"));
			varPList.add(vpd);
		}
		dataMap.put("varAFPicList",varPList);






		ObjectDoubSheetExcelView erv = new ObjectDoubSheetExcelView();

		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
