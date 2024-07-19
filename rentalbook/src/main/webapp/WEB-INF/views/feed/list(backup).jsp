<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
FeedDao feedDao = new FeedDao();
List<Feed> feeds = feedDao.findAll();
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
	<%@include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
		<h2>의견 목록</h2>
		<p style="text-align: right">
			열린공간 &gt; <span style="color: hotpink;">의견 목록</span>
		</p>
		<div>
			총 <b style="color: magenta"><%=feeds.size()%></b> 건의 의견이 등록되어 있습니다.
		</div>
		<table class="default-table">
			<thead>
				<tr class="border-tr">
					<th style="width: 10%;">번호</th>
					<th>제목</th>
					<th style="width: 10%;">글쓴이</th>
					<th style="width: 15%;">등록일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Feed one : feeds) {
				%>
				<tr class="border-tr">
					<td><%=one.no()%></td>
					<td><a
						href="<%=application.getContextPath()%>/feed/view.jsp?no=<%=one.no()%>"
						class="no-deco-link"><%=one.title()%></a></td>
					<%
					if (one.writerId() == null) {
					%>
					<td>탈퇴회원</td>
					<%
					} else {
					%>
					<td><%=one.writerId()%></td>
					<%
					}
					%>

					<td><%=one.writedAt()%></td>
					<td><%=one.readCount()%></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
		<div style="margin-top: 10px; text-align: right;">
			<a href="<%=application.getContextPath()%>/feed/write.jsp"><button
					style="padding: 6px 10px;">글쓰기</button></a>
		</div>

	</div>
</body>
</html>