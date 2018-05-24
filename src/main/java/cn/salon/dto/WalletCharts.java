package cn.salon.dto;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author super
 * @create 2018-03-21 16:56
 */

public class WalletCharts {

    private Date date;

    private BigDecimal money;

    private String operator;

    private String type;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
