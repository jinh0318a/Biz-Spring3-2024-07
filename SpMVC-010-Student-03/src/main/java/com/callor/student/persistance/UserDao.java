package com.callor.student.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.callor.student.models.UserVO;

public interface UserDao {
	
	@Select("select * from tbl_users")
	public List<UserVO> selectAll();
	
	@Select("select * from tbl_users where username = #{username}")
	public UserVO findByID(String username);
	
	public int insert(UserVO userVO);
	
}
