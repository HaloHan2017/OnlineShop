package com.yc.olshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.olshop.bean.Orderitem;
import com.yc.olshop.bean.OrderitemExample;

public interface OrderitemMapper {
	int countByExample(OrderitemExample example);

	int deleteByExample(OrderitemExample example);

	int deleteByPrimaryKey(Integer oitemId);

	int insert(Orderitem record);

	int insertSelective(Orderitem record);

	List<Orderitem> selectByExample(OrderitemExample example);

	Orderitem selectByPrimaryKey(Integer oitemId);

	int updateByExampleSelective(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

	int updateByExample(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

	int updateByPrimaryKeySelective(Orderitem record);

	int updateByPrimaryKey(Orderitem record);

	List<Orderitem> queryItemForOrderByOid(String oid);
}