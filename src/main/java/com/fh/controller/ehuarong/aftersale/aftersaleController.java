package com.fh.controller.ehuarong.aftersale;


import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ehuarong.aftersale.AftersaleManager;
import com.fh.util.AppUtil;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value="/aftersale")

public class aftersaleController  extends BaseController {

    String menuUrl = "aftersale/list.do"; //�˵���ַ(Ȩ����)

    @Resource(name="aftersaleService")
    private AftersaleManager aftersaleService;


    /**�б�
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/list")

    public ModelAndView list(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"�б� �ۺ��б�");
        if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //У��Ȩ��(��Ȩ�鿴ʱҳ�������ʾ,�����ע�͵���������޷������б�ҳ��,���Ը�������Ƿ���뱾�����)
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");				//�ؼ��ʼ�������
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
//        String EXTGOOD_ID = pd.getString("EXTGOOD_ID");
//        if(!StringUtils.isEmpty(EXTGOOD_ID)){
//            pd.put("EXTGOOD_ID", EXTGOOD_ID.trim());
//        }
        page.setPd(pd);
        List<PageData> varList = aftersaleService.list(page);	//�г��ۺ��б�
        mv.setViewName("ehuarong/aftersale/aftersale_list");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX",Jurisdiction.getHC());	//��ťȨ��
        return mv;
    }

}
