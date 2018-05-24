package cn.salon.service.impl;

import cn.salon.dto.Wallet;
import cn.salon.dto.WalletCharts;
import cn.salon.mapper.CustomerWalletMapper;
import cn.salon.mapper.WorkerMapper;
import cn.salon.pojo.*;
import cn.salon.service.CustomerWalletService;
import cn.salon.service.DepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * @author super
 * @create 2018-02-21 20:48
 */
@Service
public class CustomerWalletServiceImpl implements CustomerWalletService {
    @Autowired
    CustomerWalletMapper customerWalletMapper;
    @Autowired
    WorkerMapper workerMapper;
    @Autowired
    DepositService depositService;
    @Value("${consumeCount}")
    int consumeCount;
    @Value("${depositCount}")
    int depositCount;

    @Override
    public List<Wallet> getCustomerBill(int id) {
        CustomerWalletExample example = new CustomerWalletExample();
        example.setOrderByClause(" pay_date desc");
        CustomerWalletExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(id);
        List<CustomerWallet> customerWalletList = customerWalletMapper.selectByExample(example);
        List<Wallet> walletList = new ArrayList<>();
        Wallet wallet = null;
        for (CustomerWallet customerWallet : customerWalletList) {
            wallet = new Wallet();
            Worker worker = workerMapper.selectByPrimaryKey(customerWallet.getWid());
            worker.setPassword(null);
            wallet.setWorker(worker);
            wallet.setCustomerWallet(customerWallet);
            walletList.add(wallet);
        }
        return walletList;
    }

    @Override
    public List<WalletCharts> getCustomerBillChart(int id) {
        CustomerWalletExample example = new CustomerWalletExample();
        example.setOrderByClause(" pay_date asc");
        CustomerWalletExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(id);
        List<CustomerWallet> customerWalletList = customerWalletMapper.selectByExample(example);
        List<WalletCharts> walletList = new LinkedList<>();
        List<CustomerWallet> result = new ArrayList<>();
        if (customerWalletList.size() > consumeCount) {
            for (int j = 0; j < customerWalletList.size(); j++) {
                if (j < consumeCount) {

                    CustomerWallet customerWallet = customerWalletList.get(customerWalletList.size() - consumeCount + j);
                    result.add(customerWallet);
                } else {
                    break;
                }
            }
            return getWalletCharts(result, walletList);
        } else {
            return getWalletCharts(customerWalletList, walletList);
        }


    }

    @Override
    public List<Deposit> getCustomerDepositChart(int id) {
        List<Deposit> depositList = depositService.getDepositRecordByCustomerId(id);
        List<Deposit> result = new ArrayList<>();
        if (depositList.size() > depositCount) {
            for (int j = 0; j < depositList.size(); j++) {
                if (j < depositCount) {

                    Deposit deposit = depositList.get(depositList.size() - depositCount + j);
                    result.add(deposit);
                } else {
                    break;
                }
            }
            return result;

        }else {
            return depositList;
        }
    }

    @Override
    public List<WalletCharts> getCustomerConsumeListByCondition(int id, Date startDate, Date endDate) {
        CustomerWalletExample customerWalletExample = new CustomerWalletExample();
        CustomerWalletExample.Criteria criteria = customerWalletExample.createCriteria();
        criteria.andPayDateGreaterThanOrEqualTo(startDate);
        criteria.andCidEqualTo(id);
        criteria.andPayDateLessThanOrEqualTo(endDate);
        List<CustomerWallet> customerWalletList = customerWalletMapper.selectByExample(customerWalletExample);
        List<WalletCharts> walletList = new LinkedList<>();
        return getWalletCharts(customerWalletList, walletList);

    }

    @Override
    public List<Deposit> getCustomerDepositListByCondition(int id, Date startDate, Date endDate) {
        DepositExample depositExample = new DepositExample();
        DepositExample.Criteria criteria = depositExample.createCriteria();
        criteria.andCidEqualTo(id);
        criteria.andCreateTimeGreaterThanOrEqualTo(startDate);
        criteria.andCreateTimeLessThanOrEqualTo(endDate);
        List<Deposit> depositList = depositService.getDepositRecordListByCondition(depositExample);
        return depositList;
    }

    private List<WalletCharts> getWalletCharts(List<CustomerWallet> customerWalletList, List<WalletCharts> walletList) {
        WalletCharts wallet;
        for (CustomerWallet customerWallet : customerWalletList) {
            wallet = new WalletCharts();
            Worker worker = workerMapper.selectByPrimaryKey(customerWallet.getWid());
            wallet.setDate(customerWallet.getPayDate());
            wallet.setMoney(customerWallet.getPayMoney());
            wallet.setOperator(worker.getUsername());
            wallet.setType(customerWallet.getPayProperty());

            walletList.add(wallet);
        }
        return walletList;
    }
}
