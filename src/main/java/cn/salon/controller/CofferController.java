package cn.salon.controller;

import cn.salon.pojo.Coffer;
import cn.salon.service.CofferService;
import cn.salon.utils.JsonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * @author super
 * @create 2018-04-02 16:18
 */
@Controller
public class CofferController {
    @Autowired
    CofferService cofferService;

    @RequestMapping("/coffer/getCoffer.html")
    public String getCoffer(){
        return "/common/cofferCharts";
    }

    @RequestMapping("/coffer/cofferCharts.html")
    @ResponseBody
    public String getCofferCharts(){
        List<Coffer> cofferList = cofferService.getCofferList();
        String json = JsonUtils.objectToJson(cofferList);
        return json;
    }
    @RequestMapping("/coffer/getCofferChartsByPage.action")
    @ResponseBody
    public String getCofferChartsByPage(@RequestParam("startStr")String startStr,@RequestParam("endStr")String endStr) throws ParseException {
        if(StringUtils.isBlank(startStr) || StringUtils.isBlank(endStr)){
            cofferService.getCofferList();
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = simpleDateFormat.parse(startStr);
        Date endDate = simpleDateFormat.parse(endStr);
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(calendar.DATE, 1);
        endDate = calendar.getTime();
        List<Coffer> cofferList = cofferService.getCofferListByCondition(startDate,endDate);
        String json = JsonUtils.objectToJson(cofferList);
        return json;
    }


}
