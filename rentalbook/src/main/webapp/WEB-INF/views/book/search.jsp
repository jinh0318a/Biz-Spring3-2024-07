<%@page import="java.util.ArrayList"%>
<%@page import="rentalbook.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
BookDao bookDao = new BookDao();
List<Book> books = null;
String sort = request.getParameter("sort") == null ? "1" : request.getParameter("sort");
int r = Integer.parseInt(sort);
String rr = "";
if (r == 1) {
	books = bookDao.findTitleAsc();
	rr += "가나다순";
} else if (r == 2) {
	books = bookDao.findCategoryAsc();
	rr += "카테고리순";
} else if (r == 3) {
	books = bookDao.findAllAsc();
	rr += "도서번호순";
}

int lastP = books.size() / 15 + (books.size() % 15 > 0 ? 1 : 0);

int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
if (p > lastP) {
	response.sendRedirect(application.getContextPath() + "/book/search.jsp");
	return;
}

int fromIndex = (p - 1) * 15;
int toIndex = p * 15;
if (p == lastP) {
	toIndex = books.size();
}

List<Book> extractBooks = books.subList(fromIndex, toIndex);

int blockEnd = (int) Math.ceil(p / 10.0) * 10;
int blockStart = blockEnd - 9;

blockEnd = (blockEnd > lastP) ? lastP : blockEnd;

if(request.getParameter("category") == ""){
	response.sendRedirect(application.getContextPath() + "/book/search.jsp");
	return;
}

int category = request.getParameter("category") == null ? 0 : Integer.parseInt(request.getParameter("category"));
List<Book> cateBooks = new ArrayList<>();

if (category > 0) {
	if (category == 1) {
		cateBooks = bookDao.findByCategory("연구/논문");
	} else if (category == 2) {
		cateBooks = bookDao.findByCategory("통계");
	} else if (category == 3) {
		cateBooks = bookDao.findByCategory("일반행정");
	} else if (category == 4) {
		cateBooks = bookDao.findByCategory("역사/사료");
	} else if (category == 5) {
		cateBooks = bookDao.findByCategory("문화/관광");
	}

	lastP = cateBooks.size() / 15 + (cateBooks.size() % 15 > 0 ? 1 : 0);

	fromIndex = (p - 1) * 15;
	toIndex = p * 15;
	if (p == lastP) {
		toIndex = cateBooks.size();
	}

	extractBooks = cateBooks.subList(fromIndex, toIndex);

	blockEnd = (int) Math.ceil(p / 10.0) * 10;
	blockStart = blockEnd - 9;

	blockEnd = (blockEnd > lastP) ? lastP : blockEnd;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css">
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico">
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
		<h2>도서 목록</h2>
		<p style="text-align: right">
			도서목록 &gt; <span style="color: hotpink;">도서목록(<%=rr%>)
			</span>

		</p>
		<%if(cateBooks.size() == 0){ %>
		<div>
			총 <b style="color: magenta"><%=books.size()%></b> 권의 도서가 등록되어 있습니다.
		</div>
		<%}else{ %>
		<div>
			총 <b style="color: magenta"><%=cateBooks.size()%></b> 권의 도서가 등록되어 있습니다.
		</div>
		<%} %>
		<div style="text-align: right">
			<a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=1&p=<%=p%>"
				class="no-deco-link"> <span style="color: #777;">가나다순</span>
			</a> | <a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=2&p=<%=p%>"
				class="no-deco-link"><span style="color: #777;">카테고리순</span></a> | <a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=3&p=<%=p%>"
				class="no-deco-link"><span style="color: #777;">도서번호순</span></a>
		</div>

		<div>
			<a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=p%>&category=1"
				class="no-deco-link"> <span style="color: #777;">연구/논문</span></a> <a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=p%>&category=2"
				class="no-deco-link"> <span style="color: #777;">통계</span></a> <a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=p%>&category=3"
				class="no-deco-link"> <span style="color: #777;">일반행정</span></a> <a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=p%>&category=4"
				class="no-deco-link"> <span style="color: #777;">역사/사료</span></a> <a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=p%>&category=5"
				class="no-deco-link"> <span style="color: #777;">문화/관광</span></a>
		</div>

		<table class="default-table">
			<thead>
				<tr class="border-tr">
					<th style="width: 10%;">도서번호</th>
					<th style="width: 10%;">카테고리</th>
					<th>책제목</th>
					<th style="width: 20%;">출판사</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Book one : extractBooks) {
				%>
				<tr class="border-tr">
					<td><%=one.bookId()%></td>
					<td><%=one.categoryName()%></td>
					<td><a
						href="<%=application.getContextPath()%>/book/view.jsp?book_id=<%=one.bookId()%>"
						class="no-deco-link"><%=one.title()%></a></td>
					<td><%=one.publisher()%></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>

		<p style="text-align: center; margin: 60px 0px">
			<%
			if (blockStart == 1) {

			} else {
			%>
			<a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=blockStart - 1%>&category=<%=category %>"
				class="no-deco-link"> <span style="margin: 0 10px;">&lt;</span>
			</a>
			<%
			}
			%>
			<%
			for (int i = blockStart; i <= blockEnd; i++) {
			%>
			<%
			if (i != p) {
			%>
			<a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=i%>&category=<%=category %>"
				class="no-deco-link"><%=i%></a>
			<%
			} else {
			%>
			<b style="color: hotpink"><%=i%></b>
			<%
			}
			}
			%>
			<%
			if (p < lastP && blockEnd != lastP) {
			%>
			<a
				href="<%=application.getContextPath()%>/book/search.jsp?sort=<%=r%>&p=<%=blockEnd + 1%>&category=<%=category %>"
				class="no-deco-link"> <span style="margin: 0 10px;">&gt;</span>
			</a>
			<%
			}
			%>
		</p>

	</div>

</body>
</html>
