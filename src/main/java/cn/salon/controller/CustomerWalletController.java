package cn.salon.controller;

import cn.salon.dto.Wallet;
import cn.salon.service.CustomerWalletService;
import cn.salon.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author super
 * @create 2018-02-21 20:27
 */
@Controller
public class CustomerWalletController {
    @Autowired
    CustomerWalletService customerWalletService;

    //生成customer_HCharts报表
    @RequestMapping(value="/customer/customerCharts")
    public String customerCharts(@RequestParam("id") int id, Model model) {
        List<Wallet> list = customerWalletService.getCustomerBill(id);
        model.addAttribute("result", list);
        return "/customer/wallet";
    }
    @RequestMapping(value="/customer/charts")
    @ResponseBody
    public String Charts(@RequestParam("id") int id, Model model) {

        List<Wallet> list = customerWalletService.getCustomerBill(id);
        System.out.println(id);
        String json = JsonUtils.objectToJson(list);

        model.addAttribute("result",list);
        return json;
    }

    @RequestMapping("/customer/showCharts.html")
    public String showCharts(){
        return "/customer/chartdemo";
    }
}
