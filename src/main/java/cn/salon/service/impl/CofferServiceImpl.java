package cn.salon.service.impl;

import cn.salon.mapper.CofferMapper;
import cn.salon.pojo.Coffer;
import cn.salon.pojo.CofferExample;
import cn.salon.pojo.Worker;
import cn.salon.service.CofferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

/**
 * @author super
 * @create 2018-04-02 15:10
 */
@Service
public class CofferServiceImpl implements CofferService {
    @Autowired
    CofferMapper cofferMapper;
    @Value("${cofferCount}")
    int cofferCount;

    @Override
    public void addCoffer(BigDecimal money, HttpServletRequest request) {
        CofferExample cofferExample = new CofferExample();
        Coffer coffer = new Coffer();
        List<Coffer> cofferList = cofferMapper.selectByExample(cofferExample);
        if (cofferList.size() > 0) {
            Coffer coffer1 = cofferList.get(cofferList.size() - 1);
            coffer.setLastMoney(coffer1.getNowMoney());
            coffer.setNowMoney(new BigDecimal(coffer1.getNowMoney().doubleValue() + money.doubleValue()));

        } else {
            coffer.setNowMoney(money);
            coffer.setLastMoney(new BigDecimal(0));
        }
        coffer.setCreateDate(new Date());
        // HttpServletRequest request = RequestHolder.getCurrentRequest();
        Worker worker = (Worker) request.getSession().getAttribute("user");
        coffer.setOperator(worker.getUsername());
        cofferMapper.insertSelective(coffer);
    }

    @Override
    public List<Coffer> getCofferList() {

        CofferExample cofferExample = new CofferExample();
        List<Coffer> result = new ArrayList<>();
        List<Coffer> cofferList = cofferMapper.selectByExample(cofferExample);
        if (cofferList.size() > cofferCount) {
            for (int j = 0; j < cofferList.size(); j++) {
                if (j < cofferCount) {

                    Coffer coffer = cofferList.get(cofferList.size() - cofferCount + j);
                    result.add(coffer);
                } else {
                    break;
                }
            }

            return result;

        } else {
            if (cofferList.size() > 0) {

                return cofferList;
            }

        }
        return new ArrayList<>();
    }

    @Override
    public List<Coffer> getCofferListByCondition(Date startDate, Date endDate) {
        CofferExample cofferExample = new CofferExample();
        CofferExample.Criteria criteria = cofferExample.createCriteria();
        criteria.andCreateDateGreaterThanOrEqualTo(startDate);

        criteria.andCreateDateLessThanOrEqualTo(endDate);
        List<Coffer> cofferList = cofferMapper.selectByExample(cofferExample);

            if (cofferList.size() > 0) {

                return cofferList;
            }
            return new ArrayList<>();

    }
}
