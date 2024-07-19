<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String userId = request.getParameter("user_id");
String password = request.getParameter("password");
boolean result = false;

if(userId.isBlank() || password.isBlank()){
	response.sendRedirect(application.getContextPath() + "/member/login.jsp");
	return;
}



if (!userId.isBlank() && !password.isBlank()) {
	UserDao userDao = new UserDao();
	User found = userDao.findByUserId(userId);

	if (found != null) {
		result = found.password().equals(password) ? true : false;
	}
}

if (result) {
	session.setAttribute("auth", true);
	session.setAttribute("auth_user_id", userId);
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이전 | 동네도서관</title>
</head>
<body>
	<script type="text/javascript">
window.alert("정보가 정확하지 않거나 접속권한이 없습니다.");
location.href="<%=application.getContextPath()%>/member/login.jsp";
	</script>
</body>
</html>

<%
}
%>