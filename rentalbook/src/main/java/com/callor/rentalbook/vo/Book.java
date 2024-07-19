package com.callor.rentalbook.vo;

public class Book {
	protected int bookId; 
	protected int categoryId; 
	protected String categoryName; 
	protected String title; 
	protected String publisher; 
	protected String description; 
	protected int pages; 
	protected String imageUrl; 
	protected int rentalCnt;
	
	
	public Book() {
		super();
	}


	public Book(int bookId, int categoryId, String categoryName, String title, String publisher, String description,
			int pages, String imageUrl, int rentalCnt) {
		super();
		this.bookId = bookId;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.title = title;
		this.publisher = publisher;
		this.description = description;
		this.pages = pages;
		this.imageUrl = imageUrl;
		this.rentalCnt = rentalCnt;
	}


	public int getBookId() {
		return bookId;
	}


	public void setBookId(int bookId) {
		this.bookId = bookId;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPages() {
		return pages;
	}


	public void setPages(int pages) {
		this.pages = pages;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public int getRentalCnt() {
		return rentalCnt;
	}


	public void setRentalCnt(int rentalCnt) {
		this.rentalCnt = rentalCnt;
	}
	
	
	
	
}
