package cn.salon.mapper;

import cn.salon.pojo.Coffer;
import cn.salon.pojo.CofferExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CofferMapper {
    int countByExample(CofferExample example);

    int deleteByExample(CofferExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Coffer record);

    int insertSelective(Coffer record);

    List<Coffer> selectByExample(CofferExample example);

    Coffer selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Coffer record, @Param("example") CofferExample example);

    int updateByExample(@Param("record") Coffer record, @Param("example") CofferExample example);

    int updateByPrimaryKeySelective(Coffer record);

    int updateByPrimaryKey(Coffer record);
}