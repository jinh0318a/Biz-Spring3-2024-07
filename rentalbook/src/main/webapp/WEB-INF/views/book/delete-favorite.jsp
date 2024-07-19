<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
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


BookDao bookDao = new BookDao();
FavoriteDao favoriteDao = new FavoriteDao();
boolean result = favoriteDao.deleteFavorite(authUserId, bookId);

if(result){
	bookDao.updateRentalCntMinus(bookId);	
	response.sendRedirect(application.getContextPath() + "/book/view.jsp?book_id="+bookId);
}else{
	out.println("<script>");
	out.println("window.alert(\"즐겨찾기 해제에 실패하였습니다.\")");
	out.println("history.go(-1);");
	out.println("</script>");
	return;
}
%>