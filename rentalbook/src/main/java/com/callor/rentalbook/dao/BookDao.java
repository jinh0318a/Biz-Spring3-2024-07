package com.callor.rentalbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.callor.rentalbook.vo.Book;

import oracle.jdbc.datasource.impl.OracleDataSource;

public interface BookDao {

	@Select("select * from books order by book_id")
	public List<Book> findAllAsc();

	@Select("select * from books order by title")
	public List<Book> findTitleAsc();

	@Select("select * from books order by category_id")
	public List<Book> findCategoryAsc();

	@Select("select * from books where book_id=#{bookId}")
	public Book findByBookId(int bookId);

	@Select("select * from books where category_name=#{category_name")
	public List<Book> findByCategory(String category_name);

	@Update("update books set rental_cnt = rental_cnt + 1 where book_id=#{bookId}")
	public boolean updateRentalCntPlus(int bookId);

	@Update("update books set rental_cnt = rental_cnt - 1 where book_id=#{bookId}")
	public boolean updateRentalCntMinus(int bookId);

}
