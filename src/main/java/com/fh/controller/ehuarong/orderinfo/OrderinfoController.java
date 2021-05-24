package com.fh.controller.ehuarong.orderinfo;

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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ehuarong.orderinfo.OrderinfoManager;

/** 
 * 说明：订单信息表
 * 创建人：FH Q313596790
 * 创建时间：2018-03-29
 */
@Controller
@RequestMapping(value="/orderinfo")
public class OrderinfoController extends BaseController {
	
	String menuUrl = "orderinfo/list.do"; //菜单地址(权限用)
	@Resource(name="orderinfoService")
	private OrderinfoManager orderinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Orderinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDERINFO_ID", this.get32UUID());	//主键
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("SYSTIME", Tools.date2Str(new Date()));	//创建时间
		orderinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Orderinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderinfoService.delete(pd);
		out.write("success");
		out.close();
	}

	/**重新采购 状态重置
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/rePurchaseupdate")
	public void rePurchaseupdate(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 重新采购 状态重置 Orderinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderinfoService.rePurchaseupdate(pd);
		out.write("success");
		out.close();
	}


	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Orderinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		orderinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Orderinfo");
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
		if(null != lastStart && !"".equals(lastStart)){
			pd.put("lastStart", lastStart.trim());
		}
		if(null != lastEnd && !"".equals(lastEnd)){
			pd.put("lastEnd", lastEnd.trim());
		}



		String EXTGOOD_ID = pd.getString("EXTGOOD_ID");
		if(!StringUtils.isEmpty(EXTGOOD_ID)){
			pd.put("EXTGOOD_ID", EXTGOOD_ID.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = orderinfoService.list(page);	//列出Orderinfo列表
		mv.setViewName("ehuarong/orderinfo/orderinfo_list");
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
		mv.setViewName("ehuarong/orderinfo/orderinfo_add");
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
		pd = orderinfoService.findById(pd);	//根据ID读取
		mv.setViewName("ehuarong/orderinfo/orderinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Orderinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			orderinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Orderinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单编号");	//1
		titles.add("订单数量");	//2
		titles.add("发件人");	//3
		titles.add("发件电话");	//4
		titles.add("收件人");	//5
		titles.add("收件电话");	//6
		titles.add("收件地址");	//7
		titles.add("快递公司");	//8
		titles.add("快递单号");	//9
		titles.add("商品售价单价");	//10
		titles.add("商品售价总价");	//11
		titles.add("商品采购单价");	//12
		titles.add("商品采购总价");	//13
		titles.add("所属平台id");	//14
		titles.add("供应商id ");	//15
		titles.add("供应商email");	//16
		titles.add("创建时间");	//17
		titles.add("备注");	//18
		dataMap.put("titles", titles);
		List<PageData> varOList = orderinfoService.listAll(pd);
		//        pd.put("EXPORTTIME", DateUtil.getSdfTime());

		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ODER_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("GOODNUM"));	    //2
			vpd.put("var3", varOList.get(i).getString("SELLNAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("SELLPHONE"));	//4
			vpd.put("var5", varOList.get(i).getString("RECNAME"));	    //5
			vpd.put("var6", varOList.get(i).getString("RECPHONE"));	    //6
			vpd.put("var7", varOList.get(i).getString("RECADDRESS"));	//7
			vpd.put("var8", varOList.get(i).getString("EXPRESS"));	    //8
			vpd.put("var9", varOList.get(i).getString("EXPRESSNO"));	    //9
			vpd.put("var10", String.valueOf(varOList.get(i).get("SELLPRICE")));    //10
			vpd.put("var11", String.valueOf(varOList.get(i).get("SELLTOTALPRICE")));    //11
			vpd.put("var12", String.valueOf(varOList.get(i).get("PURCHASEPRICE")));    //12
			vpd.put("var13", String.valueOf(varOList.get(i).get("PURCHASETOTALPRICE")));    //13
			vpd.put("var14", varOList.get(i).getString("PLATFORMID"));	    //14
			vpd.put("var15", varOList.get(i).getString("SUPPLIER_ID"));	    //15
			vpd.put("var16", varOList.get(i).getString("SUPPLIER_EMAIL"));	    //16
			vpd.put("var17", varOList.get(i).getString("CREATETIME"));	    //17
			vpd.put("var18", varOList.get(i).getString("REMARK"));	    //18
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}

	/**导出已发货订单到deliveredExcel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deliveredExcel")

	public ModelAndView deliveredExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出 已发货订单快递单号到 excel，供发货使用");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("lastStart", pd.get("lastStart"));
		pd.put("lastEnd", pd.get("lastEnd"));

		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单ID");	//0
		titles.add("快递单号");	//1
		titles.add("快递公司");	//2
		titles.add("订单数量");	//3
		titles.add("平台ID");	//4
		dataMap.put("titles", titles);

		List<PageData> varOList = orderinfoService.listToDeliveredExcel(pd);
		List<PageData> deliveredGoodsList = new ArrayList<PageData>();

		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ODER_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("EXPRESSNO"));	    //6
			vpd.put("var3", varOList.get(i).getString("EXPRESS"));	    //7
			vpd.put("var4", varOList.get(i).getString("GOODNUM"));	    //8
			vpd.put("var5", varOList.get(i).getString("PLATFORMID"));	    //9
			deliveredGoodsList.add(vpd);
		}

		dataMap.put("varList", deliveredGoodsList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}






	/**导出到purchasedExcel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/purchasedExcel")
	public ModelAndView purchasedExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出 系统  到 excel，供发货使用");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("ID");	//1
		titles.add("发货日期");	//2
		titles.add("用户订单号");	//3
		titles.add("寄件公司");	//4
		titles.add("寄件电话(可改)");	//5
		titles.add("收件人");	//6
		titles.add("收件电话");	//7
		titles.add("收件详细地址");	//8
		titles.add("数量");	//9
		titles.add("物流单号");	//10
		titles.add("快递");	//11
		titles.add("产品规格描述");	//12
		titles.add("结算单价");	//12
		titles.add("结算总价（元）");	//13
		titles.add("备注");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = orderinfoService.listToPurchase(pd);
		Map<String, Object[]> supplyProductMap = new HashMap<>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			String supplyId = varOList.get(i).getString("SUPPLIER_ID");
			vpd.put("var1", varOList.get(i).getString("ORDERINFO_ID"));	    //1
			vpd.put("var2", DateUtil.getDay());	    //2
			vpd.put("var3", varOList.get(i).getString("ODER_ID"));	    //3
			vpd.put("var4", "");	    //4
			vpd.put("var5", "13911881373");	    //5
			vpd.put("var6", varOList.get(i).getString("RECNAME"));	    //6
			vpd.put("var7", varOList.get(i).getString("RECPHONE"));	    //7
			vpd.put("var8", varOList.get(i).getString("RECADDRESS"));	    //8
			vpd.put("var9", varOList.get(i).getString("GOODNUM"));	    //9
			vpd.put("var10", "");    //10
			vpd.put("var11", "");    //11
			vpd.put("var12", varOList.get(i).getString("SUPPLYGOOD_NAME"));    //12
			vpd.put("var13", String.valueOf(varOList.get(i).get("PURCHASEPRICE")));    //13
			vpd.put("var14", String.valueOf(varOList.get(i).get("PURCHASETOTALPRICE")));    //14
			vpd.put("var15", varOList.get(i).getString("REMARK"));	    //8

			List<PageData> supplyProductList = new ArrayList<>();
			Object[] obj  = new Object[3];
			if(supplyProductMap.containsKey(supplyId)){
				obj = supplyProductMap.get(supplyId);
				supplyProductList = (ArrayList<PageData>)obj[2];
			} else {
				obj[0] = varOList.get(i).getString("SUPPLIERNAME");
				obj[1] = varOList.get(i).getString("SUPPLIER_EMAIL");
			}

			supplyProductList.add(vpd);
			obj[2] = supplyProductList;
			supplyProductMap.put(supplyId,obj);
		}
		dataMap.put("supplyProduct", supplyProductMap);
		ObjectZipExcelView erv = new ObjectZipExcelView();
		mv = new ModelAndView(erv,dataMap);

		//update the status
		orderinfoService.consignment(varOList);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
