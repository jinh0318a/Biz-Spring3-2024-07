<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
session.setAttribute("auth", false);
session.setAttribute("auth_user_id", null);
response.sendRedirect(application.getContextPath() + "/index.jsp");

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