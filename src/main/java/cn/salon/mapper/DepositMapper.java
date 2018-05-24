package cn.salon.mapper;

import cn.salon.pojo.Deposit;
import cn.salon.pojo.DepositExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepositMapper {
    int countByExample(DepositExample example);

    int deleteByExample(DepositExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Deposit record);

    int insertSelective(Deposit record);

    List<Deposit> selectByExample(DepositExample example);

    Deposit selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Deposit record, @Param("example") DepositExample example);

    int updateByExample(@Param("record") Deposit record, @Param("example") DepositExample example);

    int updateByPrimaryKeySelective(Deposit record);

    int updateByPrimaryKey(Deposit record);
}