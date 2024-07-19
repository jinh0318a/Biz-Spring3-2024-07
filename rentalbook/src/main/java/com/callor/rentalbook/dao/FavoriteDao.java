package com.callor.rentalbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.callor.rentalbook.vo.Favorite;
import com.callor.rentalbook.vo.User;

public interface FavoriteDao {

	@Insert("insert into favorites values(favorites_seq.nextval, #{userId}, #{bookId}, #{createdAt})")
	public boolean save(Favorite favorite);

	@Delete("delete favorites where user_id=#{userId} and book_id=#{bookId}")
	public boolean deleteFavorite(String userId, int bookId);

	@Select("select * from favorites where user_id=#{userId")
	public List<Favorite> findAllFavorite(String userId);

	@Delete("delete favorites where user_id=#{userId}")
	public boolean deleteFavoriteAll(User user);

	@Select("select * from favorites where user_id=#{userId} and book_id=#{bookId}")
	public boolean isFavorited(String userId, int bookId);
}
