package com.yc.olshop.dao;

import com.yc.olshop.bean.Adminloginrecord;
import com.yc.olshop.bean.AdminloginrecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminloginrecordMapper {
    long countByExample(AdminloginrecordExample example);

    int deleteByExample(AdminloginrecordExample example);

    int deleteByPrimaryKey(Integer alrId);

    int insert(Adminloginrecord record);

    int insertSelective(Adminloginrecord record);

    List<Adminloginrecord> selectByExample(AdminloginrecordExample example);

    Adminloginrecord selectByPrimaryKey(Integer alrId);

    int updateByExampleSelective(@Param("record") Adminloginrecord record, @Param("example") AdminloginrecordExample example);

    int updateByExample(@Param("record") Adminloginrecord record, @Param("example") AdminloginrecordExample example);

    int updateByPrimaryKeySelective(Adminloginrecord record);

    int updateByPrimaryKey(Adminloginrecord record);
    
    List<Adminloginrecord> searchadminLoginRecord();
    
    List<Adminloginrecord> searchadminLoginRecordByAid(int aid);
}