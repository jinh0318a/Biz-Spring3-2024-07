package com.callor.hello.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.callor.hello.models.UserVO;

public interface UserDao {

	@Select("select * from tbl_users")
	public List<UserVO> selectAll();

	@Select("select * from tbl_users where username = #{username}")
	public UserVO findeById(String username);

	public void create_user_table(String dumy);
}
