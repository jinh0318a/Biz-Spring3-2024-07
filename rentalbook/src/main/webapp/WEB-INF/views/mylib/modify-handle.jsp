<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
boolean auth = (Boolean) session.getAttribute("auth");

String userId = (String) session.getAttribute("auth_user_id");
String password = request.getParameter("password");
String passwordcheck = request.getParameter("passwordcheck");
String nickname = request.getParameter("nickname");

if (!password.equals(passwordcheck)) {
	response.sendRedirect(application.getContextPath() + "/mylib/modify.jsp");
	return;
}

UserDao userDao = new UserDao();
User authUser = userDao.findByUserId(userId);
if(password.isBlank()){
	password = (String)authUser.password();
}
/*
if (password.isBlank()) {
	password = request.getParameter("authpass");
}
*/

User temp = new User(userId, password, nickname, null, null);
boolean result = userDao.updateNicknameAndPassword(temp);

if (result) {
%>
<script>
window.alert("정보가 수정되었습니다.");
location.href="<%=application.getContextPath()%>/mylib/modify.jsp";
</script>
<%
} else {
%>
<script>
	window.alert("정보가 수정에 실패했습니다.");
	history.go(-1);
</script>

<%
}
%>
