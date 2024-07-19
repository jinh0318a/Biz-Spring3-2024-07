<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="java.sql.Date"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean auth = (Boolean) session.getAttribute("auth");
if(!auth){
	response.sendRedirect(application.getContextPath() + "/book/search.jsp");
	return;
}
String authUserId = (String) session.getAttribute("auth_user_id");
int bookId = Integer.parseInt(request.getParameter("bookId"));

Favorite one = new Favorite(-1, authUserId, bookId, new Date(System.currentTimeMillis()));
FavoriteDao favortieDao = new FavoriteDao();
boolean result = favortieDao.save(one);
if(!result){
	out.println("<script>");
	out.println("window.alert(\"즐겨찾기 등록에 실패하였습니다.\")");
	out.println("history.go(-1);");
	out.println("</script>");
	return;
}else{
	BookDao bookDao = new BookDao();
	bookDao.updateRentalCntPlus(bookId);
	response.sendRedirect(application.getContextPath() + "/book/view.jsp?book_id="+bookId);
}
%>
