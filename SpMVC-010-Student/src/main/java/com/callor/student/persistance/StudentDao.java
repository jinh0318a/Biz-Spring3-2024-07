package com.callor.student.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.callor.student.models.StudentVO;

public interface StudentDao {
	
	@Select("select * from tbl_student order by st_num")
	public List<StudentVO> selectAll();
	
	
	@Insert("insert into tbl_student(st_num, st_name, st_dept, st_grade, st_tel, st_addr) values(#{st_num}, #{st_name}, #{st_dept}, #{st_grade}, #{st_tel}, #{st_addr})")
	public int insert(StudentVO stVO);
}
