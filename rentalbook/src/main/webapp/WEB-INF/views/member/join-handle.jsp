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
<%@ page errorPage="/member/join-error.jsp"%>

<%
String userId = request.getParameter("user_id");
String password = request.getParameter("password");
String passwordcheck = request.getParameter("passwordcheck");
String nickname = request.getParameter("nickname");
String gender = request.getParameter("gender");

if (userId.isBlank() || password.isBlank() || passwordcheck.isBlank() || nickname.isBlank() || !password.equals(passwordcheck)) {
	response.sendRedirect(application.getContextPath() + "/member/join.jsp");
	return;
}

UserDao userDao = new UserDao();
User found = userDao.findByUserId(userId);
int result = 0;

if (found != null) {
	result = 1;
} else {
	User one = new User(userId, password, nickname, gender, new Date(System.currentTimeMillis()));
	boolean saved = userDao.save(one);
	result = saved ? 3 : 2;
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	if (result == 3) {
	%>
	<script type="text/javascript">
		window.alert("회원가입 성공! 로그인 페이지로 이동합니다");
		location.href="<%=application.getContextPath()%>/member/login.jsp";
	</script>

	<%
	} else if (result == 1) {
	%>
	<script type="text/javascript">
		window.alert("이미 사용중인 아이디입니다");
		history.go(-1);
	</script>

	<%
	} else {
	%>
	<script type="text/javascript">
		window.alert("데이터 처리중에 오류가 발생하였습니다. 다시 시도해주세요.");
		history.go(-1);
	</script>

	<%
	}
	%>
</body>
</html>