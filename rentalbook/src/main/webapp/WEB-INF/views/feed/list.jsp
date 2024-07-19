<%@page import="java.util.ArrayList"%>
<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
FeedDao feedDao = new FeedDao();
List<Feed> feeds = feedDao.findAll();
String sort = request.getParameter("sort") == null ? "3" : request.getParameter("sort");
int r = Integer.parseInt(sort);
String rr = "";
if (r == 1) {
	feeds = feedDao.findByWriterId();
	rr += "작성자순";
} else if (r == 2) {
	feeds = feedDao.findByReadCount();
	rr += "조회수순";
} else if (r == 3) {
	feeds = feedDao.findByWriterAt();
	rr += "등록일순";
} else if (r == 4) {
	feeds = feedDao.findByTitle();
	rr += "제목순";
}

int lastP = feeds.size() / 15 + (feeds.size() % 15 > 0 ? 1 : 0);

int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
if (p > lastP) {
	response.sendRedirect(application.getContextPath() + "/feed/list.jsp");
	return;
}

int fromIndex = (p - 1) * 15;
int toIndex = p * 15;
if (p == lastP) {
	toIndex = feeds.size();
}

List<Feed> extractfeeds = feeds.subList(fromIndex, toIndex);

int blockEnd = (int) Math.ceil(p / 10.0) * 10;
int blockStart = blockEnd - 9;

blockEnd = (blockEnd > lastP) ? lastP : blockEnd;
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
			열린공간 &gt; <span style="color: hotpink;">의견목록(<%=rr%>)
			</span>

		</p>
		<div>
			총 <b style="color: magenta"><%=feeds.size()%></b> 건의 의견이 등록되어 있습니다.
		</div>
		<div style="text-align: right">
		<a
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=4&p=<%=p%>"
				class="no-deco-link"> <span style="color: #777;">제목순</span>
			</a> |
			<a
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=1&p=<%=p%>"
				class="no-deco-link"> <span style="color: #777;">작성자순</span>
			</a> | <a
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=2&p=<%=p%>"
				class="no-deco-link"><span style="color: #777;">조회수순</span></a> | <a
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=3&p=<%=p%>"
				class="no-deco-link"><span style="color: #777;">등록일순</span></a>
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
				for (Feed one : extractfeeds) {
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
		<p style="text-align: center; margin: 60px 0px">
			<%
			if (blockStart == 1) {

			} else {
			%>
			<a
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=<%=r%>&p=<%=blockStart - 1%>"
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
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=<%=r%>&p=<%=i%>"
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
				href="<%=application.getContextPath()%>/feed/list.jsp?sort=<%=r%>&p=<%=blockEnd + 1%>"
				class="no-deco-link"> <span style="margin: 0 10px;">&gt;</span>
			</a>
			<%
			}
			%>
		</p>

	</div>

</body>
</html>