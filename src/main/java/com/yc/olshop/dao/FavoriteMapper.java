package com.yc.olshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.olshop.bean.Favorite;
import com.yc.olshop.bean.FavoriteExample;
import com.yc.olshop.bean.Product;

public interface FavoriteMapper {
	int countByExample(FavoriteExample example);

	int deleteByExample(FavoriteExample example);

	int deleteByPrimaryKey(Integer favId);

	int insert(Favorite record);

	int insertSelective(Favorite record);

	List<Favorite> selectByExample(FavoriteExample example);

	Favorite selectByPrimaryKey(Integer favId);

	int updateByExampleSelective(@Param("record") Favorite record, @Param("example") FavoriteExample example);

	int updateByExample(@Param("record") Favorite record, @Param("example") FavoriteExample example);

	int updateByPrimaryKeySelective(Favorite record);

	int updateByPrimaryKey(Favorite record);

	List<Product> selectByUid(Integer uid);
}