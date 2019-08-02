package com.yc.olshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.olshop.bean.User;
import com.yc.olshop.bean.UserExample;

public interface UserMapper {
	int countByExample(UserExample example);

	int deleteByExample(UserExample example);

	int deleteByPrimaryKey(Integer uid);

	int insert(User record);

	int insertSelective(User record);

	List<User> selectByExample(UserExample example);

	User selectByPrimaryKey(Integer uid);

	int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

	int updateByExample(@Param("record") User record, @Param("example") UserExample example);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	// 自定义
	List<User> findAllUserLevel();

	User findUserCount();

	List<User> findByLevel(String level);

	int updateScoreByUid(@Param("scores") int scores,@Param("uid") int uid);
}