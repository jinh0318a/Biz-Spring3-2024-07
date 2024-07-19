package com.callor.rentalbook.vo;

import java.sql.Date;

public class Feed {
	protected int no;
	protected String writerId;
	protected String title;
	protected String body;
	protected Date writedAt;
	protected int readCount;
	
	public Feed() {
		super();
	}

	public Feed(int no, String writerId, String title, String body, Date writedAt, int readCount) {
		super();
		this.no = no;
		this.writerId = writerId;
		this.title = title;
		this.body = body;
		this.writedAt = writedAt;
		this.readCount = readCount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Date getWritedAt() {
		return writedAt;
	}

	public void setWritedAt(Date writedAt) {
		this.writedAt = writedAt;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	
	
}
