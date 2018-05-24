package cn.salon.service;

import cn.salon.pojo.Customer;
import cn.salon.pojo.Deposit;
import cn.salon.pojo.DepositExample;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by super on 2018/4/2 14:22.
 */
public interface DepositService {
    void depositMoney2Customer(Customer customer, BigDecimal money);

    List<Deposit> getDepositRecordByCustomerId(int customerId);

    void deleteDepositByCustomerId(int id);

    List<Deposit> getDepositRecordListByCondition(DepositExample depositExample);
}
