package com.callor.rentalbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.callor.rentalbook.vo.Feed;
import com.callor.rentalbook.vo.User;

public interface FeedDao {
	@Insert("insert into feeds(no, writer_id, title, body, writed_at, read_count) values (feeds_seq.nextval,#{writerId},#{title},#{body},#{writedAt},#{readCount})")
	public int save(Feed newFeed);
	
	@Select("select * from feeds where no=#{no}")
	public Feed findByNo(int no);
	
	@Select("select * from feeds order by no desc")
	public List<Feed> findAll();
	
	@Update("update feeds set writer_id=null where writer_id=#{userId}")
	public void updateToDeleteUser(User user);
	
	@Select("select * from feeds order by writer_id")
	public List<Feed> orderByWriterId();
	
	@Select("select * from feeds order by writed_at desc")
	public List<Feed> orderByWriterAt();
	
	@Select("select * from feeds order by read_count desc")
	public List<Feed> orderByReadCount();
	
	@Select("select * from feeds order by title")
	public List<Feed> orderByTitle();

	@Update("update feeds set read_count=read_count+1 where no=#{no}")
	public void increaseReadCount(int no);
	
	@Delete("delete feeds where no=#{no}")
	public void deleteFeed(Feed feed);

	@Update("update feeds set title=#{title}, body=#{body} where no=#{no}")
	public void updateFeed(Feed feed);
}
