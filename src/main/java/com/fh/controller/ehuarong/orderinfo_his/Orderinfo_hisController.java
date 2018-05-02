package com.fh.controller.ehuarong.orderinfo_his;

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
import com.fh.service.ehuarong.orderinfo_his.Orderinfo_hisManager;

/** 
 * 说明：orderinfo_his
 * 创建人：FH Q313596790
 * 创建时间：2018-04-16
 */
@Controller
@RequestMapping(value="/orderinfo_his")
public class Orderinfo_hisController extends BaseController {
	
	String menuUrl = "orderinfo_his/list.do"; //菜单地址(权限用)
	@Resource(name="orderinfo_hisService")
	private Orderinfo_hisManager orderinfo_hisService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 新增 Orderinfo_his");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDERINFO_HIS_ID", this.get32UUID());	//主键
		pd.put("ORDERINFO_HIS_ID", "");	//备注1
		pd.put("ORDERINFO_ID", "");	//主表id用于关联
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//备注20
		orderinfo_hisService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Orderinfo_his");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderinfo_hisService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Orderinfo_his");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		orderinfo_hisService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Orderinfo_his");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = orderinfo_hisService.list(page);	//列出Orderinfo_his列表
		mv.setViewName("ehuarong/orderinfo_his/orderinfo_his_list");
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
		mv.setViewName("ehuarong/orderinfo_his/orderinfo_his_edit");
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
		pd = orderinfo_hisService.findById(pd);	//根据ID读取
		mv.setViewName("ehuarong/orderinfo_his/orderinfo_his_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Orderinfo_his");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			orderinfo_hisService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Orderinfo_his到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("备注1");	//1
		titles.add("主表id用于关联");	//2
		titles.add("订单编号");	//3
		titles.add("订单数量");	//4
		titles.add("发件人");	//5
		titles.add("发件电话");	//6
		titles.add("收件人");	//7
		titles.add("收件电话");	//8
		titles.add("收件地址");	//9
		titles.add("快递公司");	//10
		titles.add("快递单号");	//11
		titles.add("商品售价单价");	//12
		titles.add("商品售价总价");	//13
		titles.add("商品采购单价");	//14
		titles.add("商品采购总价");	//15
		titles.add("所属平台id");	//16
		titles.add("供应商id");	//17
		titles.add("供应商名称");	//18
		titles.add("供应商email");	//19
		titles.add("备注20");	//20
		titles.add("备注21");	//21
		titles.add("第三方商品编号");	//22
		titles.add("状态，导入，采购，发货等标识位");	//23
		titles.add("第三方平台商品描述");	//24
		titles.add("供应商产品名称");	//25
		dataMap.put("titles", titles);
		List<PageData> varOList = orderinfo_hisService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORDERINFO_HIS_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("ORDERINFO_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("ODER_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("GOODNUM"));	    //4
			vpd.put("var5", varOList.get(i).getString("SELLNAME"));	    //5
			vpd.put("var6", varOList.get(i).getString("SELLPHONE"));	    //6
			vpd.put("var7", varOList.get(i).getString("RECNAME"));	    //7
			vpd.put("var8", varOList.get(i).getString("RECPHONE"));	    //8
			vpd.put("var9", varOList.get(i).getString("RECADDRESS"));	    //9
			vpd.put("var10", varOList.get(i).getString("EXPRESS"));	    //10
			vpd.put("var11", varOList.get(i).getString("EXPRESSNO"));	    //11
			vpd.put("var12", varOList.get(i).get("SELLPRICE").toString());	//12
			vpd.put("var13", varOList.get(i).get("SELLTOTALPRICE").toString());	//13
			vpd.put("var14", varOList.get(i).get("PURCHASEPRICE").toString());	//14
			vpd.put("var15", varOList.get(i).get("PURCHASETOTALPRICE").toString());	//15
			vpd.put("var16", varOList.get(i).getString("PLATFORMID"));	    //16
			vpd.put("var17", varOList.get(i).getString("SUPPLIER_ID"));	    //17
			vpd.put("var18", varOList.get(i).getString("SUPPLIERNAME"));	    //18
			vpd.put("var19", varOList.get(i).getString("SUPPLIER_EMAIL"));	    //19
			vpd.put("var20", varOList.get(i).getString("CREATETIME"));	    //20
			vpd.put("var21", varOList.get(i).getString("REMARK"));	    //21
			vpd.put("var22", varOList.get(i).getString("EXTGOOD_ID"));	    //22
			vpd.put("var23", varOList.get(i).getString("STATUS"));	    //23
			vpd.put("var24", varOList.get(i).getString("EXTGOODS_NAME"));	    //24
			vpd.put("var25", varOList.get(i).getString("SUPPLYGOOD_NAME"));	    //25
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
