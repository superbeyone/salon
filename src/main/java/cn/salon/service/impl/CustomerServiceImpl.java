package cn.salon.service.impl;

import cn.salon.common.EasyUIDataGridResult;
import cn.salon.common.LayResult;
import cn.salon.dto.CustomerDto;
import cn.salon.filter.RequestHolder;
import cn.salon.mapper.CustomerMapper;
import cn.salon.mapper.CustomerWalletMapper;
import cn.salon.mapper.WorkerMapper;
import cn.salon.pojo.*;
import cn.salon.pojo.CustomerExample.Criteria;
import cn.salon.service.CofferService;
import cn.salon.service.CustomerService;
import cn.salon.service.DepositService;
import cn.salon.utils.ExportBeanExcel;
import cn.salon.utils.SResult;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private CustomerWalletMapper customerWalletMapper;
    @Autowired
    private WorkerMapper workerMapper;
    @Autowired
    CofferService cofferService;

    @Autowired
    DepositService depositService;
    @Value("${exportCustomerName}")
    String exportCustomerName;
    @Value("${password}")
    String password;
    @Value("${payPwd}")
    String payPwd;

    @Override
    public SResult addCustomerInfo(Customer customer) {
        if (StringUtils.isBlank(customer.getPassword())) {
            customer.setPassword(DigestUtils.md5DigestAsHex(customer.getCardNo().getBytes()).toString());
        } else {
            customer.setPassword(DigestUtils.md5DigestAsHex(customer.getPassword().getBytes()).toString());

        }
        //初始支付密码
        customer.setPayPwd(DigestUtils.md5DigestAsHex(password.getBytes()).toString());
        customer.setPayMoney(new BigDecimal(0));
        customer.setUpdateDate(new Date());
        customer.setCreateDate(new Date());
        customer.setState("1");
        customer.setWallet(new BigDecimal(0));
        int i = customerMapper.insertSelective(customer);
        CustomerExample example = new CustomerExample();
        Criteria criteria = example.createCriteria();
        criteria.andCardNoEqualTo(customer.getCardNo());
        List<Customer> list = customerMapper.selectByExample(example);
        if (list == null || list.size() <= 0)
            return SResult.build(400, "系统繁忙。。。。");
        Customer cus = list.get(0);
        CustomerWallet customerWallet = new CustomerWallet();
        customerWallet.setCid(cus.getId());
        customerWallet.setPayDate(new Date());
        customer.setPayMoney(customer.getPayMoney());
        customerWalletMapper.insertSelective(customerWallet);
        if(i>0){
            return SResult.build(200, "添加成功");
        }
        return SResult.build(300, "添加失败");
    }

    @Override
    public EasyUIDataGridResult getCustomerList() {
        CustomerExample example = new CustomerExample();
        List<Customer> list = customerMapper.selectByExample(example);
        EasyUIDataGridResult result = new EasyUIDataGridResult();
        result.setRows(list);
        return result;
    }

    //查询出所有的钱包
    @Override
    public EasyUIDataGridResult getCustomerWallet() {
        EasyUIDataGridResult result = new EasyUIDataGridResult();
        CustomerWalletExample example = new CustomerWalletExample();
        customerWalletMapper.selectByExample(example);
        return result;
    }

    //根据主键ID查询会员信息
    @Override
    public Customer getCustomerById(int id) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        return customer;
    }

    //根据查询条件查询会员信息
    @Override
    public LayResult getCustomerBySearch(String search) {
		/*search = search.trim();
		CustomerExample example1 = new CustomerExample();
		CustomerExample example2 = new CustomerExample();
		ArrayList<Object> list = new ArrayList<>();
		//if(StringUtils.isNotBlank(search)) {
			Criteria criteria1 = example1.createCriteria();
			Criteria criteria2 = example2.createCriteria();
			
			criteria1.andCardnoLike("%"+search+"%");
			List<Customer> list1 = customerMapper.selectByExample(example1);
			criteria2.andUsernameLike("%"+search+"%");
			List<Customer> list2 = customerMapper.selectByExample(example2);
			
			//criteria.andUsernameLike("%"+search+"%");
			//criteria.andUsernameLike(search);
			if(list1 != null && list1.size() > 0)
				list.add( list1);
			if(list2 != null && list2.size() > 0)
				list.add( list2);
		//}
		//List<Criterion> allCriteria = criteria.getAllCriteria();
		
		//List<Customer> list = customerExtMapper.selectByConditon(search,search);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		PageInfo<Object> pageInfo = new PageInfo<>(list);
		 long total = pageInfo.getTotal();
		 result.setTotal(total);*/
        LayResult result = getSearchResult(-1, -1, search);
        return result;
    }

    @Override
    public LayResult getCustomerBySearch(int page, int limits, String search) {
        LayResult result = getSearchResult(page, limits, search);
        return result;
    }

    public LayResult getSearchResult(int page, int limit, String search) {
        return getLayResult(page, limit, search,true);
    }

    private LayResult getLayResult(int page, int limit, String search,boolean flag) {
        search = search.trim();
        CustomerExample example1 = new CustomerExample();
        CustomerExample example2 = new CustomerExample();
        CustomerExample example3 = new CustomerExample();
        ArrayList<Integer> list = new ArrayList<>();
        Criteria criteria1 = example1.createCriteria();
        Criteria criteria2 = example2.createCriteria();
        Criteria criteria3 = example3.createCriteria();
        if(flag)
            criteria1.andStateEqualTo("1");
        else
            criteria1.andStateEqualTo("0");
        criteria1.andCardNoLike("%" + search + "%");
        List<Customer> list1 = customerMapper.selectByExample(example1);
        if(list1.size()>0){
            for (Customer customer : list1) {
                list.add(customer.getId());
            }
        }
        if(flag)
            criteria2.andStateEqualTo("1");
        else
            criteria2.andStateEqualTo("0");
        criteria2.andUsernameLike("%"+search+"%");
        List<Customer> list2 = customerMapper.selectByExample(example2);
        if(list2.size()>0){
            for (Customer customer : list2) {
                if(!list.contains(customer.getId())){
                    list.add(customer.getId());
                }
            }
        }
        if(flag)
            criteria3.andStateEqualTo("1");
        else
            criteria3.andStateEqualTo("0");
        criteria3.andMobileLike("%" + search + "%");
        List<Customer> list3 = customerMapper.selectByExample(example3);
        if(list3.size()>0){
            for (Customer customer : list3) {
                if(!list.contains(customer.getId())){
                    list.add(customer.getId());
                }
            }
        }
        int count = list.size();
        CustomerExample example = new CustomerExample();
        Criteria criteria = example.createCriteria();
        if(list.size() <= 0)
            return  new LayResult(count, new ArrayList<Customer>());
        criteria.andIdIn(list);
        if (page > 0 || limit > 0)
            PageHelper.startPage(page, limit);
        List<Customer> customerList = customerMapper.selectByExample(example);
        LayResult result = new LayResult(count, customerList);
        return result;
    }

    //伪删除，即只更新状态为0停用状态,1为启用状态
    @Override
    public void deleteCustomerById(int id) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        customer.setState("0");
        customerMapper.updateByPrimaryKey(customer);
        //customerMapper.deleteByPrimaryKey(id);

    }


    //更新会员信息
    @Override
    public SResult updateCustomer(Customer customer, int id) {
        /*CustomerExample example = new CustomerExample();
        Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(id);
        customerMapper.updateByExampleSelective(customer, example);*/
        customerMapper.updateByPrimaryKeySelective(customer);
        customer = customerMapper.selectByPrimaryKey(id);
        customer.setPassword("");
//        Customer cust = customerMapper.selectByPrimaryKey(id);
//        //同时修改customer_wallet表的信息
//        CustomerWalletExample customerWalletExample = new CustomerWalletExample();
//
//        CustomerWallet customerWallet = new CustomerWallet();
//        customerWallet.setCid(cust.getId());
//        customerWalletMapper.updateByExampleSelective(customerWallet, customerWalletExample);
        return SResult.build(200, "SUCCESS", customer);

    }

    //会员充值
    @Transactional
    @Override
    public SResult depositCustomerById(int id, BigDecimal money, String password,HttpServletRequest request) {
//        String md5Pwd = DigestUtils.md5DigestAsHex(password.getBytes()).toString();
//        String admin = "21232f297a57a5a743894a0e4a801fc3";
        if (!payPwd.equals(password)) {
            return SResult.build(400, "支付密码错误!");
        }
        Customer customer = customerMapper.selectByPrimaryKey(id);
        BigDecimal wallet = BigDecimal.valueOf(customer.getWallet().doubleValue() + money.doubleValue());
        customer.setWallet(wallet);
        customer.setUpdateDate(new Date());
        customer.setDeposit("1");
        customerMapper.updateByPrimaryKeySelective(customer);
        depositService.depositMoney2Customer(customer,money);
        cofferService.addCoffer(money,request);
//		CustomerWallet customerWallet = new CustomerWallet();
//		//同时修改customer_wallet表的信息
//		CustomerWalletExample example = new CustomerWalletExample();
//		CustomerWalletExample.Criteria criteria = example.createCriteria();
//		criteria.andCidEqualTo(id);
//		customerWalletMapper.updateByExampleSelective(customerWallet, example);
        return SResult.build(200, "充值成功!", customer);
    }

    //消费信息提交处理
    @Transactional
    @Override
    public SResult consumeCustomer(int id, int workerId, BigDecimal payMoney, String payProperty, String password,HttpServletRequest request) {
        String md5Pwd = DigestUtils.md5DigestAsHex(password.getBytes()).toString();
        Customer customerInfo = customerMapper.selectByPrimaryKey(id);
        if (!md5Pwd.equals(customerInfo.getPayPwd())) {
            return SResult.build(400, "支付密码错误!");
        }
        //运算后的余额结果
        BigDecimal wallet = BigDecimal.valueOf(customerInfo.getWallet().doubleValue() - payMoney.doubleValue());
        double scale = wallet.doubleValue();
        if (scale < 0.00) {
            return SResult.build(400, "余额不足!");
        }
        //设置会员的消费信息与职员的信息关联
        if (StringUtils.isNotBlank(workerId + "")) {
            CustomerWallet customerWallet = new CustomerWallet();
            //设置会员主键
            customerWallet.setCid(id);
            //设置职员主键
            customerWallet.setWid(workerId);
            customerWallet.setPayMoney(payMoney);
            //设置操作属性
            customerWallet.setPayProperty(payProperty);
            //设置创建日期
            customerWallet.setPayDate(new Date());
            Worker worker = RequestHolder.getCurrentUser();

            //Worker worker = (Worker) request.getSession().getAttribute("user");
            customerWallet.setOperator(worker.getUsername());
            customerWalletMapper.insertSelective(customerWallet);
        }
        customerInfo.setWallet(wallet);
        customerInfo.setPayMoney(payMoney);
        customerInfo.setUpdateDate(new Date());
        customerInfo.setPayDate(new Date());
        customerMapper.updateByPrimaryKeySelective(customerInfo);
        return SResult.build(200, "支付成功!", customerInfo);
    }

    @Override
    public void exportCustomerByIds(String customerIds, HttpServletRequest request) {
        String[] strings = StringUtils.split(customerIds, ",");
        CustomerExample customerExample = new CustomerExample();
        Criteria criteria = customerExample.createCriteria();
        ArrayList<Integer> ids = new ArrayList<>();
        for (String id : strings) {
            ids.add(Integer.parseInt(id));
        }
        criteria.andIdIn(ids);
        List<Customer> customerList = customerMapper.selectByExample(customerExample);
        if (customerList.size() > 0) {
            ArrayList<CustomerDto> customerDtoList = new ArrayList<>();
            ArrayList<String> fieldTitle = new ArrayList<>();
            fieldTitle.add("会员卡号");
            fieldTitle.add("姓名");
            fieldTitle.add("性别");
            fieldTitle.add("余额");
            fieldTitle.add("出生日期");
            fieldTitle.add("手机");
            fieldTitle.add("邮箱");
            fieldTitle.add("身份证号");
            fieldTitle.add("校园卡号");
            fieldTitle.add("院系");
            fieldTitle.add("年级");
            ArrayList<String> field = new ArrayList<>();
            field.add("cardNo");
            field.add("username");
            field.add("sex");
            field.add("wallet");
            field.add("birthday");
            field.add("mobile");
            field.add("email");
            field.add("idCard");
            field.add("creditCard");
            field.add("college");
            field.add("grade");
            for (int i = 0; i < customerList.size(); i++) {
                CustomerDto customerDto = new CustomerDto();
                Customer customer = customerList.get(i);
                customerDto.setCardNo(customer.getCardNo()==null?"":customer.getCardNo());
                customerDto.setUsername(customer.getUsername()==null?"":customer.getUsername());
                customerDto.setSex(customer.getSex().equals("1") ? "男" : "女");
                customerDto.setWallet(customer.getWallet() == null ? "" : customer.getWallet().toString());
                if(customer.getBirthday()==null){
                    customerDto.setBirthday("");
                }else{
                    String format = new SimpleDateFormat("yyyy-MM-dd").format(customer.getBirthday());
                    customerDto.setBirthday(format);
                }

                customerDto.setMobile(customer.getMobile() == null ? "" : customer.getMobile());
                customerDto.setEmail(customer.getEmail() == null ? "" : customer.getEmail());
                customerDto.setIdCard(customer.getcIdCard() == null ? "" : customer.getcIdCard());
                customerDto.setCreditCard(customer.getCreditCard() == null ? "" : customer.getCreditCard());
                customerDto.setCollege(customer.getCollege() == null ? "" : customer.getCollege());
                customerDto.setGrade(customer.getGrade() == null ? "" : customer.getGrade());
                customerDtoList.add(customerDto);

            }
            ExportBeanExcel<CustomerDto> exportBeanExcel = new ExportBeanExcel<>();

            String filePath = request.getSession().getServletContext().getRealPath("");

            filePath += exportCustomerName;

            String exportFileName = exportBeanExcel.exportExcel(filePath, null, fieldTitle, field, customerDtoList);
            request.setAttribute("exportFileName", exportFileName);
        }

    }

    @Override
    public boolean getCustomerByCardNo(String cardNo) {
        CustomerExample customerExample = new CustomerExample();
        Criteria criteria = customerExample.createCriteria();
        criteria.andCardNoEqualTo(cardNo);
        List<Customer> customerList = customerMapper.selectByExample(customerExample);
        if (customerList.size() > 0) {
            return false;
        }
        return true;
    }

    @Override
    public LayResult getRecycleCustomer(int page, int limit, String search) {

        LayResult result = getLayResult(page, limit, search, false);

        return result;
    }

    @Override
    public void deleteCustomerActuallyById(int id) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        CustomerWalletExample customerWalletExample = new CustomerWalletExample();
        CustomerWalletExample.Criteria criteria = customerWalletExample.createCriteria();
        criteria.andCidEqualTo(customer.getId());
        List<CustomerWallet> customerWalletList = customerWalletMapper.selectByExample(customerWalletExample);
        for (CustomerWallet customerWallet : customerWalletList) {
            customerWalletMapper.deleteByPrimaryKey(customerWallet.getId());
        }
        depositService.deleteDepositByCustomerId(id);
        customerMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void updateCustomerStatus(int id) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        customer.setState("1");
        customerMapper.updateByPrimaryKey(customer);

    }

    @Override
    public SResult updateCustomerPayPwd(int id, String oldPwd, String newPwd) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        String md5OldPwd = DigestUtils.md5DigestAsHex(oldPwd.getBytes());
        if(!customer.getPayPwd().equals(md5OldPwd)){
            return SResult.build(300, "原密码输入错误");
        }
        String md5NewPwd = DigestUtils.md5DigestAsHex(newPwd.getBytes());
        customer.setPayPwd(md5NewPwd);
        customerMapper.updateByPrimaryKeySelective(customer);
        return SResult.build(200,"密码更新成功");
    }

}
