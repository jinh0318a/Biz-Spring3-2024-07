<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.vo.Book"%>
<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Book found;
if (request.getParameter("book_id") == null || !request.getParameter("book_id").matches("[0-9]+")) {
	found = null;
}

int bookId = Integer.parseInt(request.getParameter("book_id"));
boolean auth = (Boolean) session.getAttribute("auth");
BookDao bookDao = new BookDao();
FavoriteDao favortieDao = new FavoriteDao();
found = bookDao.findByBookId(bookId);

String authUserId = (String) session.getAttribute("auth_user_id");
boolean isFavorited = favortieDao.isFavorited(authUserId ,bookId);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열린공간 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css">
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico">
</head>
<body>

	<%
	if (found == null) {
	%>
	<script>
		window.alert("존재하지 않는 도서입니다");
		history.go(-1);
	</script>

	<%
	} else {
	%>
	<%@include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
		<h2>도서 상세보기</h2>
		<p style="text-align: right">
			도서 &gt; <span style="color: hotpink;">도서 상세보기</span>
		</p>
		<div>
			<h3
				style="text-align: center; border-bottom: 1px solid #ddd; padding: 8px; magin-bottom: 8px;"><%=found.title()%></h3>
			<div style="padding: 4px; text-align: right">
				<span style="color: #777;">카테고리</span> <span><%=found.categoryName()%></span>
				<span style="color: #777;">출판사</span> <span><%=found.publisher()%></span>
				<span style="color: #777;">도서번호</span> <span><%=found.bookId()%></span>
				<span style="color: #777;">페이지</span> <span><%=found.pages()%></span>
				<span style="color: #777;">대출횟수</span> <span><%=found.rentalCnt()%></span>
			</div>
			<div>
				<img src="<%=found.imageUrl()%>">
				<%
				if (found.description() != null) {
				%>
				<p><%=found.description()%></p>
				<%
				} else {
				%>
				<p>소개가 없습니다.</p>
				<%
				}
				%>
			</div>

		</div>

		<div style="text-align: right">
		<%if(auth && !isFavorited){ %>
			<a href="<%=application.getContextPath()%>/book/add-favorite.jsp?bookId=<%=bookId%>"><button type="button">찜하기</button></a>
		<%} else if(auth && isFavorited){ %>
			<a href="<%=application.getContextPath()%>/book/delete-favorite.jsp?bookId=<%=bookId%>"><button type="button">찜해제</button></a>
		<%} %>
			<a href="<%=application.getContextPath()%>/book/search.jsp"><button type="button">목록</button></a>
		</div>
	</div>
	<%
	}
	%>



</body>
</html>