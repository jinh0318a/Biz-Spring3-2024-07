<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean auth = (Boolean) session.getAttribute("auth");

if (!auth) {
	response.sendRedirect(application.getContextPath() + "/member/login.jsp");
	return;
}

if(request.getParameter("no")==null || !request.getParameter("no").matches("[0-9]+")){
	response.sendRedirect(application.getContextPath() + "/feed/list.jsp");
	return;
}


String authUserId = (String) session.getAttribute("auth_user_id");
FeedDao feedDao = new FeedDao();
int no = Integer.parseInt(request.getParameter("no"));
Feed found = feedDao.findByNo(no);

if (found.writerId() != null && found.writerId().equals(authUserId)) {

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
		<h2>의견 수정하기</h2>
		<p style="text-align: right">
				열린공간 &gt; <span style="color: hotpink;">의견 수정하기</span>
		</p>

		<div style="width: 840px; margin: 60px auto; padding: 30px;">
			<form
				action="<%=application.getContextPath()%>/feed/update-handle.jsp">
				<input type="hidden" name="no" value="<%=no%>"/>
				<table style="border-collapse: collapse; width: 100%">
					<tr>
						<td class="td-left">작성자</td>
						<td class="td-right"><%=authUserId%></td>
					</tr>
					<tr>
						<td class="td-left">제목</td>
						<td class="td-right"><input name="title" type="text"
							style="padding: 6px 10px; width: 500px; border: 1px solid #ccc" value="<%=found.title() %>" /></td>
					</tr>
					<tr>
						<td class="td-left" colspan="2">
							<textarea name="body"
								style="height: 200px; resize: none; width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc"><%=found.body() %></textarea>
						</td>
					</tr>

				</table>
				<div style="text-align: center; margin-top: 20px;">
					<button type="submit" style="padding: 6px 10px;">저장</button>
					<a href="<%=application.getContextPath()%>/feed/list.jsp"><button
							type="button" style="padding: 6px 10px;">취소</button></a>
				</div>

			</form>
		</div>
	</div>
	<%}else{%>
<script>
	window.alert("권한이 없습니다.");
	location.href="<%=application.getContextPath()%>/feed/list.jsp";
</script>
<%}%>
</body>
</html>
