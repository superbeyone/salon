package cn.salon.dto;

import cn.salon.pojo.CustomerWallet;
import cn.salon.pojo.Worker;

/**
 * @author super
 * @create 2018-02-21 21:48
 */
public class Wallet {
    private CustomerWallet customerWallet;
    private Worker worker;

    public CustomerWallet getCustomerWallet() {
        return customerWallet;
    }

    public void setCustomerWallet(CustomerWallet customerWallet) {
        this.customerWallet = customerWallet;
    }

    public Worker getWorker() {
        return worker;
    }

    public void setWorker(Worker worker) {
        this.worker = worker;
    }
}