package cn.salon.controller;

import cn.salon.common.EasyUIDataGridResult;
import cn.salon.common.LayResult;
import cn.salon.dto.WalletCharts;
import cn.salon.pojo.Customer;
import cn.salon.pojo.Deposit;
import cn.salon.service.CustomerService;
import cn.salon.service.CustomerWalletService;
import cn.salon.service.WorkerService;
import cn.salon.utils.JsonUtils;
import cn.salon.utils.SResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private WorkerService workerService;

    @Autowired
    CustomerWalletService customerWalletService;


    @RequestMapping(value = "/customer/addCustomer")
    public String addCustomer() {

        return "/customer/addCustomer";
    }

    @RequestMapping("/customer/search")
    public String showSearchPage() {
        return "/common/search";
    }

    @RequestMapping(value = "/customer/list")
    public String customerList(Model model) {
//		EasyUIDataGridResult result =customerService.getCustomerList();
//		List<Customer> customer = result.getRows();
//		model.addAttribute("customer", customer);
        return "/customer/customerList";
    }

    @RequestMapping(value = "/customer/validateCustomer")
    @ResponseBody
    public SResult validateCustomer(Customer customer, @RequestParam(value = "birthdayStr") String birthdayStr, Model model) throws Exception {
        parseBirthdayStr(customer, birthdayStr);

        return customerService.addCustomerInfo(customer);
    }


    @RequestMapping(value = "/customer/updateCustomerInfo")
    public String updateCustomerInfo(@RequestParam(value = "id") int id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "/customer/updateCustomerInfo";
    }

    @RequestMapping(value = "/customer/searchCustomer")
    @ResponseBody
    public String searchCustomer(String search, Model model) {
        LayResult result = customerService.getCustomerBySearch(search);
        //model.addAttribute("customer", result.getRows());
        //List<Customer> rows = result.getRows();
//		if(rows == null || rows.size() <= 0) {
//			return SResult.build(400, "查无此数据");
//		}
        String json = JsonUtils.objectToJson(result);
        return json;
    }

    @RequestMapping(value = "/customer/searchCustomerPage")
    @ResponseBody
    public String searchCustomerPage(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit, @RequestParam(value = "search", defaultValue = "") String search, Model model) {

        LayResult result = customerService.getCustomerBySearch(page, limit, search);
        //List<Customer> rows = result.getRows();
//		if(rows == null || rows.size() <= 0) {
//			return SResult.build(400, "查无此数据");
//		}
        String json = JsonUtils.objectToJson(result);
        return json;
    }

    //伪删除会员信息
    @RequestMapping(value = "/customer/deleteCustomer")
    @ResponseBody
    public void deleteCustomer(@RequestParam("id") int id) {
        customerService.deleteCustomerById(id);
    }

    //真实删除
    @RequestMapping("/customer/deleteCustomerActually.action")
    @ResponseBody
    public void deleteCustomerActually(@RequestParam("id") int id) {
        customerService.deleteCustomerActuallyById(id);
    }

    //修改会员信息
    @RequestMapping(value = "/customer/updateCustomer")
    public String updateCustomer(int id, Customer customer, String birthdayStr, HttpServletRequest request) throws Exception {
        request.setCharacterEncoding("utf-8");
        parseBirthdayStr(customer, birthdayStr);
        SResult result = customerService.updateCustomer(customer, id);
        request.setAttribute("result", result);
        return "/common/info";
    }

    private void parseBirthdayStr(Customer customer, String birthdayStr) throws ParseException {
        if (StringUtils.isNotBlank(birthdayStr)) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthday = simpleDateFormat.parse(birthdayStr);
            customer.setBirthday(birthday);
        } else {
            customer.setBirthday(null);
        }
    }

    //查看会员信息
    @RequestMapping(value = "/customer/viewCustomer")
    public String viewCustomer(@RequestParam(value = "id") int id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "/customer/viewCustomer";
    }

    //修改会员信息
    @RequestMapping(value = "/customer/editCustomer")
    public String editCustomer(@RequestParam(value = "id") int id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "/customer/editCustomer";
    }

    //弹出会员充值页面
    @RequestMapping(value = "/customer/showDepositCustomer")
    public String showDepositCustomer(@RequestParam(value = "id") int id, Model model) {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "/customer/depositCustomer";
    }

    //充值提交
    @RequestMapping(value = "/customer/viDepositCustomer")
    @ResponseBody
    public SResult depositCustomer(@RequestParam(value = "id") int id, @RequestParam(value = "money") BigDecimal money, @RequestParam(value = "password") String password, HttpServletRequest request) {
        SResult result = customerService.depositCustomerById(id, money, password, request);
        return result;
        //model.addAttribute("message", "SUCCESS");
//        request.setAttribute("result", result);
//        return "/common/info";
    }

    //弹出会员消费页面
    @RequestMapping(value = "/customer/showConsumeCustomer")
    public String showConsumeCustomer(@RequestParam(value = "id") int id, Model model) {
        //Customer customer = customerService.consumeCustomer(id);
        EasyUIDataGridResult workerResult = workerService.getWorkerList();
        model.addAttribute("worker", workerResult.getRows());
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "/customer/consumeCustomer";
    }

    //消费提交
    @RequestMapping(value = "/customer/viConsumeCustomer")
    @ResponseBody
    public SResult viConsumeCustomer(@RequestParam(value = "id") int id, @RequestParam(value = "workerId") int workerId, @RequestParam(value = "payMoney") BigDecimal payMoney, @RequestParam(value = "payProperty") String payProperty, @RequestParam(value = "password") String password, HttpServletRequest request) {
        SResult result = customerService.consumeCustomer(id, workerId, payMoney, payProperty, password,request);
        return result;
//        request.setAttribute("result", result);
//        return "/common/info";
    }

    //导出客户信息
    @RequestMapping("/exportCustomerIds.action")
    @ResponseBody
    public SResult exportCustomerByIds(String customerIds, HttpServletRequest request, HttpServletResponse response) {
        customerService.exportCustomerByIds(customerIds, request);
        String exportFileName = (String) request.getAttribute("exportFileName");

        return SResult.build(200, exportFileName);
    }

    @RequestMapping("/customer/charts.html")
    public String showCharts(@RequestParam("id") int id, Model model) {
        //List<Wallet> list = customerWalletService.getCustomerBill(id);
        List<WalletCharts> list = customerWalletService.getCustomerBillChart(id);
        String result = JsonUtils.objectToJson(list);
        model.addAttribute("result", result);
        model.addAttribute("id", id);

        return "customer/consumeCharts";
    }

    @RequestMapping("/customer/deposit.html")
    public String depositCharts(@RequestParam("id") int id, Model model) {
        //List<Wallet> list = customerWalletService.getCustomerBill(id);
        List<Deposit> list = customerWalletService.getCustomerDepositChart(id);
        String result = JsonUtils.objectToJson(list);
        model.addAttribute("result", result);
        model.addAttribute("id", id);
        return "customer/depositCharts";
    }

    @RequestMapping("/customer/getCustomerByCardNo.action")
    @ResponseBody
    public SResult getCustomerByCardNo(String cardNo) {
        boolean result = customerService.getCustomerByCardNo(cardNo);
        if (result == true) {
            return SResult.build(200, "该卡号可用");
        }
        //存在该卡号的数据
        return SResult.build(300, "该卡号已存在");
    }

    //恢复状态
    @RequestMapping("/customer/rollBackCustomer.action")
    @ResponseBody
    public void rollBackCustomer(@RequestParam("id") int id) {
        customerService.updateCustomerStatus(id);
    }


    @RequestMapping("/customer/recycleCustomer.html")
    public String recycleCustomer() {
        return "/recycle/customerList";
    }

    @RequestMapping("/customer/getRecycleCustomer.action")
    @ResponseBody
    public String getRecycleCustomer(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit, @RequestParam(value = "search", defaultValue = "") String search, Model model) {
        LayResult result = customerService.getRecycleCustomer(page, limit, search);
        String json = JsonUtils.objectToJson(result);
        return json;
    }

    @RequestMapping("/customer/updateCustomerPayPwd.action")
    @ResponseBody
    public SResult updateCustomerPayPwd(@RequestParam("id") int id,@RequestParam("oldPwd") String oldPwd,@RequestParam("newPwd")String newPwd){
       return customerService.updateCustomerPayPwd(id, oldPwd, newPwd);
    }

    @RequestMapping("/customer/getConsumeChartsByPage.action")
    @ResponseBody
    public String getConsumeChartsByPage(@RequestParam("id")int id,@RequestParam("startStr")String startStr,@RequestParam("endStr")String endStr) throws ParseException {
        if(StringUtils.isBlank(startStr) || StringUtils.isBlank(endStr)){
            List<WalletCharts> list = customerWalletService.getCustomerBillChart(id);
            String json = JsonUtils.objectToJson(list);
            return json;
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = simpleDateFormat.parse(startStr);
        Date endDate = simpleDateFormat.parse(endStr);
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(calendar.DATE, 1);
        endDate = calendar.getTime();
        List<WalletCharts> consumeList = customerWalletService.getCustomerConsumeListByCondition(id,startDate,endDate);
        String json = JsonUtils.objectToJson(consumeList);
        return json;
    }
    @RequestMapping("/customer/getDepositChartsByPage.action")
    @ResponseBody
    public String getDepositChartsByPage(@RequestParam("id")int id,@RequestParam("startStr")String startStr,@RequestParam("endStr")String endStr) throws ParseException {
        if(StringUtils.isBlank(startStr) || StringUtils.isBlank(endStr)){
            List<WalletCharts> list = customerWalletService.getCustomerBillChart(id);
            String json = JsonUtils.objectToJson(list);
            return json;
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = simpleDateFormat.parse(startStr);
        Date endDate = simpleDateFormat.parse(endStr);
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(calendar.DATE, 1);
        endDate = calendar.getTime();
        List<Deposit> depositList = customerWalletService.getCustomerDepositListByCondition(id,startDate,endDate);
        String json = JsonUtils.objectToJson(depositList);
        return json;
    }

}
