package com.fh.controller.leedarhk.contractinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.fh.service.leedarhk.purchaseinfo.PurchaseinfoManager;
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
import com.fh.service.leedarhk.contractinfo.ContractInfoManager;
import com.fh.service.leedarhk.condetail.CondetailManager;
/** 
 * 说明：订单信息主表
 * 创建人：FH Q313596790
 * 创建时间：2019-02-14
 */
@Controller
@RequestMapping(value="/contractinfo")
public class ContractInfoController extends BaseController {
	
	String menuUrl = "contractinfo/list.do"; //菜单地址(权限用)
	@Resource(name="contractinfoService")
	private ContractInfoManager contractinfoService;

	@Resource(name="condetailService")
	private CondetailManager condetailService;

	@Resource(name="purchaseinfoService")
	private PurchaseinfoManager purchaseinfoService;


	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ContractInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CONTRACTINFO_ID", this.get32UUID());	//主键
		contractinfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}



	/** 保存明细
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveDetail")
	public ModelAndView saveDetail() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ContractInfo Detail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CONDETAIL_ID", this.get32UUID());	//主键
		condetailService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除ContractInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		contractinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ContractInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		contractinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ContractInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		// 主订单 List
		List<PageData>	varList = contractinfoService.list(page);	//列出ContractInfo列表

		for(PageData mainpd : varList){

			List<PageData> detailList = condetailService.listByPoNo(mainpd);
			mainpd.put("DETAILPD", detailList);

			System.out.println("==================================");
			System.out.println(detailList);
			System.out.println("==================================");
		}



		mv.setViewName("leedarhk/contractinfo/contractinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/** 去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("leedarhk/contractinfo/contractinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/** 去新增明细页面 detail
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddDetail")
	public ModelAndView goAddDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

//		pd.put("PROJECTCODE",pd.getString("PROJECTCODE"));
//		pd.put("PONUMBER", pd.getString("PONUMBER"));

		mv.setViewName("leedarhk/contractinfo/condetail_add");
		mv.addObject("msg", "saveDetail");
		mv.addObject("pd", pd);
		return mv;
	}




	/** 去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = contractinfoService.findById(pd);	//根据ID读取
		mv.setViewName("leedarhk/contractinfo/contractinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ContractInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			contractinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}


	/**确认订单并转采购
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/confirmAndPur")
	@ResponseBody
	public Object confirmPur() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 确认采购 转采购 ContractInfo");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();
		PageData pdPO = new PageData();
		PageData pdPOInPur = new PageData();


		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();

		String strPonumber =  pd.getString("PONUMBER");  //订单编号
		String strProjectcode = pd.getString("PROJECTCODE"); //项目code
		String strPoUSD =  pd.getString("USD");  // 订单金额
		pdPO.put("PONUMBER",strPonumber);
		pdPO.put("PROJECTCODE",strProjectcode);
		pdPO.put("PURCHASEINFO_ID",this.get32UUID());
		pdPO.put("PURNUMBER", "PUR" + DateUtil.getDays() +  UuidUtil.get4UUID()); //项目主键

		pd = contractinfoService.findByPOnumber(pd);//订单数据
		pdList = condetailService.listByPoNo(pd);   //订单明细数据

		//判断是否存在该订单
//		if (purchaseinfoService.findByPOnumberInPur(pdPO).size()==0) {
			purchaseinfoService.insertPO(pdPO);
//		}


		//	插入采购数据

		return AppUtil.returnObject(pd, null);
	}


	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出ContractInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("项目ID");	//1
		titles.add("合同编号");	//2
		titles.add("港币总金额");	//3
		titles.add("人民币总金额");	//4
		titles.add("美元总金额");	//5
		titles.add("其他货币");	//6
		titles.add("客户ID");	//7
		titles.add("联系人1");	//8
		titles.add("联系人2");	//9
		titles.add("联系电话");	//10
		titles.add("联系电话");	//11
		titles.add("公司名称");	//12
		titles.add("公司名称缩写");	//13
		titles.add("银行名称");	//14
		titles.add("银行账号");	//15
		titles.add("银行地址");	//16
		titles.add("银行地址");	//17
		titles.add("银行地址");	//18
		titles.add("swiftcode");	//19
		titles.add("创建日期");	//20
		titles.add("计划执行时间");	//21
		titles.add("remark");	//22
		titles.add("客户地址1");	//23
		titles.add("客户地址");	//24
		titles.add("客户地址");	//25
		dataMap.put("titles", titles);
		List<PageData> varOList = contractinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PROJECTCODE"));	    //1
			vpd.put("var2", varOList.get(i).getString("PONUMBER"));	    //2
			vpd.put("var3", varOList.get(i).get("HKD").toString());	//3
			vpd.put("var4", varOList.get(i).get("CNY").toString());	//4
			vpd.put("var5", varOList.get(i).get("USD").toString());	//5
			vpd.put("var6", varOList.get(i).get("OTHERCURRENCY").toString());	//6
			vpd.put("var7", varOList.get(i).getString("CUSTOMERID"));	    //7
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
			vpd.put("var19", varOList.get(i).getString("SWIFTCODE"));	    //19
			vpd.put("var20", varOList.get(i).getString("CREATETIME"));	    //20
			vpd.put("var21", varOList.get(i).getString("PLANTIME"));	    //21
			vpd.put("var22", varOList.get(i).getString("REMARK"));	    //22
			vpd.put("var23", varOList.get(i).getString("CUSTOMERADDRESS1"));	    //23
			vpd.put("var24", varOList.get(i).getString("CUSTOMERADDRESS2"));	    //24
			vpd.put("var25", varOList.get(i).getString("CUSTOMERADDRESS3"));	    //25
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
