package com.yc.olshop.dao;

import com.yc.olshop.bean.Leavemsg;
import com.yc.olshop.bean.LeavemsgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LeavemsgMapper {
    int countByExample(LeavemsgExample example);

    int deleteByExample(LeavemsgExample example);

    int deleteByPrimaryKey(Integer lmId);

    int insert(Leavemsg record);

    int insertSelective(Leavemsg record);

    List<Leavemsg> selectByExample(LeavemsgExample example);

    Leavemsg selectByPrimaryKey(Integer lmId);

    int updateByExampleSelective(@Param("record") Leavemsg record, @Param("example") LeavemsgExample example);

    int updateByExample(@Param("record") Leavemsg record, @Param("example") LeavemsgExample example);

    int updateByPrimaryKeySelective(Leavemsg record);

    int updateByPrimaryKey(Leavemsg record);
}