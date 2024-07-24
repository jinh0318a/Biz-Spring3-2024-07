package com.callor.student.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.callor.student.models.ScoreVO;

public interface ScoreDao {

	public List<ScoreVO> selectAll();

	public ScoreVO findById(String id);

	@Select("select * from view_score where sc_stnum=#{st_num}")
	public List<ScoreVO> findByStNum(String st_num);
}
