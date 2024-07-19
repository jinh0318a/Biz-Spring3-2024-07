<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Feed found;
if (request.getParameter("no") == null || !request.getParameter("no").matches("[0-9]+")) {
	found = null;
} else {

	int no = Integer.parseInt(request.getParameter("no"));
	FeedDao feedDao = new FeedDao();
	feedDao.increaseReadCount(no);
	found = feedDao.findByNo(no);

}
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
		window.alert("존재하지 않는 글입니다");
		history.go(-1);
	</script>

	<%
	} else {
	%>
	<%@include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
		<h2>의견 상세보기</h2>
		<p style="text-align: right">
			열린공간 &gt; <span style="color: hotpink;">의견 상세보기</span>
		</p>
		<div>
			<h3
				style="text-align: center; border-bottom: 1px solid #ddd; padding: 8px; magin-bottom: 8px;"><%=found.title()%></h3>
			<div style="padding: 4px; text-align: right">
				<span style="color: #777;">작성일</span> <span><%=found.writedAt()%></span>
				| <span style="color: #777;">작성자</span>
				<%
				if (found.writerId() == null) {
				%>
				<span>탈퇴회원</span>
				<%
				} else {
				%>
				<span><%=found.writerId()%></span>
				<%
				}
				%>
				| <span style="color: #777;">조회수</span> <span><%=found.readCount()%></span>
			</div>
			<p><%=found.body().replaceAll("\n", "<br/>")%>
			</p>

		</div>
		<div style="display: flex; justify-content: space-between;">
			<div style="text-align: left; display: inline-block;">
				<%
				if (found.writerId() != null && found.writerId().equals((String) session.getAttribute("auth_user_id"))) {
				%>
				<a
					href="<%=application.getContextPath()%>/feed/update.jsp?no=<%=Integer.parseInt(request.getParameter("no"))%>"><button
						type="button" style="padding: 6px 10px;" name="correction"
						value="1">수정</button></a> <a
					href="<%=application.getContextPath()%>/feed/delete-handle.jsp?no=<%=Integer.parseInt(request.getParameter("no"))%>"><button
						type="button" style="padding: 6px 10px;" name="delete" value="2">삭제</button></a>
				<%
				}
				%>
			</div>
			<div style="text-align: right; display: inline-block;">
				<a href="<%=application.getContextPath()%>/feed/write.jsp"><button
						style="padding: 6px 10px;">글쓰기</button></a> <a
					href="<%=application.getContextPath()%>/feed/list.jsp"><button
						style="padding: 6px 10px;">목록</button></a>
			</div>
		</div>
	</div>
	<%
	}
	%>

</body>
</html>