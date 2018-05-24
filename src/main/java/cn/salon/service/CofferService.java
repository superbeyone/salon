package cn.salon.service;

import cn.salon.pojo.Coffer;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by super on 2018/4/2 15:10.
 */
public interface CofferService {
    void addCoffer(BigDecimal money,HttpServletRequest request);

    List<Coffer> getCofferList();

    List<Coffer> getCofferListByCondition(Date startDate, Date endDate);
}
