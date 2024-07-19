<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean auth = (Boolean) session.getAttribute("auth");

String authUserId = (String) session.getAttribute("auth_user_id");

UserDao userDao = new UserDao();
FeedDao feedDao = new FeedDao();
FavoriteDao favoriteDao = new FavoriteDao();
User authUser = userDao.findByUserId(authUserId);

if (authUser.password().equals(request.getParameter("password"))) {
	boolean r = feedDao.updateToDeleteUser(authUser);
	boolean rr = userDao.deleteUser(authUser);
	boolean rrr = favoriteDao.deleteFavoriteAll(authUser);
	if(r && rr && rrr){
	session.setAttribute("auth", false);
%>
<script>
	window.alert("회원 탈퇴가 성공적으로 완료되었습니다.");
	location.href="<%=application.getContextPath()%>/member/login.jsp";
</script>

<%
	}
} else {
%>
<script>
	window.alert("비밀번호가 일치하지않습니다.");
	history.go(-1);
</script>

<%
}
%>
