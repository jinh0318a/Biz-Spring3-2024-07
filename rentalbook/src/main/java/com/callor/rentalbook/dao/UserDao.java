package com.callor.rentalbook.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.callor.rentalbook.vo.User;

/*
 * Users table 에 관련된 DB 작업을 처리할 Data Access Object
 * 
 * 
 */
public interface UserDao {

	// pk 로 조회하는 상황이 많음
	// return 이 닉네임, 비밀번호같은 단일밸류면 타입설정이 쉬움
	// 모든 컬럼을 리턴 시키길 원함
	// 전부다 담을 객체를 설계해서 리턴하는데, 그런 용도의 객체를 DTO 혹은 VO 라고함

	@Select("select * from users where user_id=#{userId}")
	public User findByUserId(String userId);

	// DB 테이블에 insert 하는 작업 메서드화
	@Insert("insert into users(user_id, password, nickname, gender, registerd_at) values (#{userId},#{password},#{nickname},#{gender},#{registerd_at)")
	public boolean save(User newUser);

	@Update("update users set nickname=#{nickname}, password=#{password} where user_id=#{userId}")
	public boolean updateNicknameAndPassword(User user);

	@Delete("delete from users where user_id=#{userId}")
	public boolean deleteUser(User user);

}
