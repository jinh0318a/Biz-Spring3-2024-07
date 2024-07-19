package com.callor.rentalbook.vo;

import java.sql.Date;

public class Favorite {
	protected int no; 
	protected String userId; 
	protected int bookId; 
	protected Date createdAt;
	
	
	
	public Favorite() {
		super();
	}

	public Favorite(int no, String userId, int bookId, Date createdAt) {
		super();
		this.no = no;
		this.userId = userId;
		this.bookId = bookId;
		this.createdAt = createdAt;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
}
