<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String authUserId = (String) session.getAttribute("auth_user_id");
String[] bookId = request.getParameterValues("bookId");
if(bookId == null){
	bookId = new String[0];
}

BookDao bookDao = new BookDao();
FavoriteDao favoriteDao = new FavoriteDao();
for (String n : bookId) {
	int a = Integer.parseInt(n);
	bookDao.updateRentalCntMinus(a);
	favoriteDao.deleteFavorite(authUserId, a);
}
%>
<script>
window.alert("총 <%=bookId.length%>개의 도서가 해제되었습니다.");
location.href="<%=application.getContextPath()%>/mylib/favorite.jsp";
</script>

