package com.yc.olshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.olshop.bean.Product;
import com.yc.olshop.bean.ProductExample;

public interface ProductMapper {
	int countByExample(ProductExample example);

	int deleteByExample(ProductExample example);

	int deleteByPrimaryKey(Integer pid);

	int insert(Product record);

	int insertSelective(Product record);

	List<Product> selectByExampleWithBLOBs(ProductExample example);

	List<Product> selectByExample(ProductExample example);

	Product selectByPrimaryKey(Integer pid);

	int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

	int updateByExampleWithBLOBs(@Param("record") Product record, @Param("example") ProductExample example);

	int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKeyWithBLOBs(Product record);

	int updateByPrimaryKey(Product record);

	// 根据 pid 查询
	// List<Product> selectByPidsWithPage(@Param("pidArr") int[] pidArr,
	// @Param("index") int index,
	// @Param("pageSize") Integer pageSize);

	// 查询总记录数
	// int getCountByPids(@Param("pidArr") int[] pidArr);

	List<Product> selectByPidsWithPage(@Param("pidArr") int[] pidArr);

	int selectCountPro();

	int selectCountFlag();

	int selectCountHot();

	int selectALLsale();

	int addPSaleNumWithPid(@Param("psalenum") Integer psalenum, @Param("pid") Integer pid);
}