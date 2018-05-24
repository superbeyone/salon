package cn.salon.mapper;

import cn.salon.pojo.CustomerWallet;
import cn.salon.pojo.CustomerWalletExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerWalletMapper {
    int countByExample(CustomerWalletExample example);

    int deleteByExample(CustomerWalletExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CustomerWallet record);

    int insertSelective(CustomerWallet record);

    List<CustomerWallet> selectByExample(CustomerWalletExample example);

    CustomerWallet selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CustomerWallet record, @Param("example") CustomerWalletExample example);

    int updateByExample(@Param("record") CustomerWallet record, @Param("example") CustomerWalletExample example);

    int updateByPrimaryKeySelective(CustomerWallet record);

    int updateByPrimaryKey(CustomerWallet record);
}