package cn.salon.service;

import cn.salon.dto.Wallet;
import cn.salon.dto.WalletCharts;
import cn.salon.pojo.Deposit;

import java.util.Date;
import java.util.List;

/**
 * Created by super on 2018/2/21 20:48.
 */
public interface CustomerWalletService {
    List<Wallet> getCustomerBill(int id);

    List<WalletCharts> getCustomerBillChart(int id);

    List<Deposit> getCustomerDepositChart(int id);

    List<WalletCharts> getCustomerConsumeListByCondition(int id, Date startDate, Date endDate);

    List<Deposit> getCustomerDepositListByCondition(int id, Date startDate, Date endDate);
}
