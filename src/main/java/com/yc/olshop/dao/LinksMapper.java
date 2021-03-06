package com.yc.olshop.dao;

import com.yc.olshop.bean.Links;
import com.yc.olshop.bean.LinksExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LinksMapper {
    int countByExample(LinksExample example);

    int deleteByExample(LinksExample example);

    int deleteByPrimaryKey(Integer lid);

    int insert(Links record);

    int insertSelective(Links record);

    List<Links> selectByExample(LinksExample example);

    Links selectByPrimaryKey(Integer lid);

    int updateByExampleSelective(@Param("record") Links record, @Param("example") LinksExample example);

    int updateByExample(@Param("record") Links record, @Param("example") LinksExample example);

    int updateByPrimaryKeySelective(Links record);

    int updateByPrimaryKey(Links record);
}