<%@page import="rentalbook.vo.FavoriteBook"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalbook.vo.Book"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean auth = (Boolean) session.getAttribute("auth");

String authUserId = (String) session.getAttribute("auth_user_id");
BookDao bookDao = new BookDao();
FavoriteDao favoriteDao = new FavoriteDao();
List<FavoriteBook> favoriteBooks = new ArrayList<>();
List<Favorite> favorites = favoriteDao.findAllFavorite(authUserId);
if(favorites.size()==0){
	out.println("<script>");
	out.println("window.alert(\"즐겨찾기가 없습니다.\")");
	out.println("history.go(-1);");
	out.println("</script>");
	return;
}

for(Favorite one : favorites){
	FavoriteBook favorite = new FavoriteBook(bookDao.findByBookId(one.bookId()), one.createdAt());
	favoriteBooks.add(favorite);
}

int lastP = favoriteBooks.size() / 15 + (favoriteBooks.size() % 15 > 0 ? 1 : 0);

int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
if (p > lastP) {
	response.sendRedirect(application.getContextPath() + "/mylib/favorite.jsp");
	return;
}

int fromIndex = (p - 1) * 15;
int toIndex = p * 15;
if (p == lastP) {
	toIndex = favoriteBooks.size();
}

List<FavoriteBook> extractFavoriteBooks = favoriteBooks.subList(fromIndex, toIndex);

int blockEnd = (int) Math.ceil(p / 10.0) * 10;
int blockStart = blockEnd - 9;

blockEnd = (blockEnd > lastP) ? lastP : blockEnd;

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜목록 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css">
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico">
</head>
<body>
	<%@include file="/common/header.jsp"%>

	<%
	if (!auth) {
	%>
	<script>
	window.alert("회원 로그인 후 사용하세요.");
	location.href="<%=application.getContextPath()%>
		/member/login.jsp";
	</script>

	<%
	} else {
	%>
	<div style="width: 840px; margin: auto; text-align: center;">
		<h2>찜목록</h2>
		<p style="text-align: right">
			회원서비스 &gt; <span style="color: hotpink;">찜목록</span>
		</p>
	</div>
	<div style="width: 840px; margin: 60px auto; padding: 30px;">
	<div>
			총 <b style="color: magenta"><%=favorites.size()%></b> 권의 도서가 등록되어 있습니다.
		</div>
		<form action="<%=application.getContextPath()%>/book/favorite-delete.jsp">
		<table class="default-table">
			<thead>
				<tr class="border-tr">
					<th></th>
					<th style="width: 10%;">도서번호</th>
					<th style="width: 10%;">카테고리</th>
					<th>책제목</th>
					<th style="width: 18%;">출판사</th>
					<th style="width: 15%;">찜한 날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (FavoriteBook one : extractFavoriteBooks) {
				%>
				<tr class="border-tr">
					<td><input type="checkbox" name="bookId" value="<%=one.book().bookId()%>"></td>
					<td><%=one.book().bookId()%></td>
					<td><%=one.book().categoryName()%></td>
					<td><a
						href="<%=application.getContextPath()%>/book/view.jsp?book_id=<%=one.book().bookId()%>"
						class="no-deco-link"><%=one.book().title()%></a></td>
					<td><%=one.book().publisher()%></td>
					<td><%=one.createdAt() %></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
		<div style="margin-top:20px;">
		<button type="submit">즐겨찾기 해제</button>
		</div>
		</form>

	</div>
	<%
	}
	%>
</body>
</html>