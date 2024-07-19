<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page errorPage="/member/join-error.jsp" %>

<%
String userId = request.getParameter("user_id");
String password = request.getParameter("password");
String passwordcheck = request.getParameter("passwordcheck");
String nickname = request.getParameter("nickname");
String gender = request.getParameter("gender");


if(userId.isBlank() || password.isBlank() || passwordcheck.isBlank() || !password.equals(passwordcheck)){
	response.sendRedirect(application.getContextPath()+"/member/join.jsp");
	return;
}

UserDao userDao = new UserDao();
User found = userDao.findByUserId(userId);

if(found != null){
	
}

OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
ods.setUser("rentalbook");
ods.setPassword("oracle");

Connection conn = ods.getConnection();

PreparedStatement stmt = conn.prepareStatement("insert into users(user_id, password, nickname, gender, registerd_at) values (?,?,?,?,?)");

stmt.setString(1, userId);
stmt.setString(2, password);
stmt.setString(3, nickname);
stmt.setString(4, gender);
stmt.setDate(5, new Date(System.currentTimeMillis()));

int r = stmt.executeUpdate();


conn.close();


if(r==1){
	response.sendRedirect(application.getContextPath()+"/member/login.jsp");
	return;
}


%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>