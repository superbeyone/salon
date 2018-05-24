package cn.salon.service;

import cn.salon.common.EasyUIDataGridResult;
import cn.salon.common.LayResult;
import cn.salon.pojo.Customer;
import cn.salon.utils.SResult;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

public interface CustomerService {
	SResult addCustomerInfo(Customer customer);

	EasyUIDataGridResult getCustomerList();

	EasyUIDataGridResult getCustomerWallet();

	Customer getCustomerById(int id);

	LayResult getCustomerBySearch(String search);

	LayResult getCustomerBySearch(int page, int limits, String search);

	void deleteCustomerById(int id);

	SResult updateCustomer(Customer customer, int id);

	SResult depositCustomerById(int id, BigDecimal money, String password,HttpServletRequest request);

	SResult consumeCustomer(int id, int workerId, BigDecimal payMoney, String payProperty, String password,HttpServletRequest request);

    void exportCustomerByIds(String customerIds, HttpServletRequest request);

    boolean getCustomerByCardNo(String cardNo);

    LayResult getRecycleCustomer(int page, int limit, String search);

	void deleteCustomerActuallyById(int id);

    void updateCustomerStatus(int id);

    SResult updateCustomerPayPwd(int id, String oldPwd, String newPwd);
}
