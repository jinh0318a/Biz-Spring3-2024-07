package com.callor.rentalbook.vo;

import java.sql.Date;

public class User {
	protected String userId;
	protected String password;
	protected String nickname;
	protected String gender;
	protected Date registerd_at;
	
	
	public User() {
		super();
	}

	public User(String userId, String password, String nickname, String gender, Date registerd_at) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickname = nickname;
		this.gender = gender;
		this.registerd_at = registerd_at;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegisterd_at() {
		return registerd_at;
	}

	public void setRegisterd_at(Date registerd_at) {
		this.registerd_at = registerd_at;
	}
	
	
	
	
}
