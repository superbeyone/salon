package cn.salon.service.impl;

import cn.salon.filter.RequestHolder;
import cn.salon.mapper.DepositMapper;
import cn.salon.pojo.Customer;
import cn.salon.pojo.Deposit;
import cn.salon.pojo.DepositExample;
import cn.salon.pojo.Worker;
import cn.salon.service.DepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @author super
 * @create 2018-04-02 14:22
 */
@Service
public class DepositServiceImpl implements DepositService {
    @Autowired
    DepositMapper depositMapper;

    @Override
    public void depositMoney2Customer(Customer customer, BigDecimal money) {
        Deposit deposit = new Deposit();
        deposit.setCid(customer.getId());
        deposit.setCreateTime(new Date());
        deposit.setDepositMoney(money);
        deposit.setMoney(customer.getWallet());
        Worker worker = RequestHolder.getCurrentUser();
        deposit.setOperator(worker.getUsername());
        depositMapper.insertSelective(deposit);
    }

    @Override
    public List<Deposit> getDepositRecordByCustomerId(int customerId) {
        DepositExample depositExample = new DepositExample();
        DepositExample.Criteria criteria = depositExample.createCriteria();
        criteria.andCidEqualTo(customerId);
        return depositMapper.selectByExample(depositExample);
    }

    @Override
    public void deleteDepositByCustomerId(int id) {
        DepositExample depositExample = new DepositExample();
        DepositExample.Criteria criteria = depositExample.createCriteria();
        criteria.andCidEqualTo(id);
        List<Deposit> depositList = depositMapper.selectByExample(depositExample);
        for (Deposit deposit : depositList) {
            depositMapper.deleteByPrimaryKey(deposit.getId());
        }
    }

    @Override
    public List<Deposit> getDepositRecordListByCondition(DepositExample depositExample) {
       return depositMapper.selectByExample(depositExample);
    }
}
