package cn.salon.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Coffer {
    private Integer id;

    private BigDecimal nowMoney;

    private BigDecimal lastMoney;

    private Date createDate;

    private String operator;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getNowMoney() {
        return nowMoney;
    }

    public void setNowMoney(BigDecimal nowMoney) {
        this.nowMoney = nowMoney;
    }

    public BigDecimal getLastMoney() {
        return lastMoney;
    }

    public void setLastMoney(BigDecimal lastMoney) {
        this.lastMoney = lastMoney;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }
}