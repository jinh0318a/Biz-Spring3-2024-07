<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean auth = (Boolean) session.getAttribute("auth");

if (!auth) {
	response.sendRedirect(application.getContextPath() + "/member/login.jsp");
	return;
}

String authUser = (String) session.getAttribute("auth_user_id");
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
		<h2>의견 남기기</h2>
		<p style="text-align: right">
				열린공간 &gt; <span style="color: hotpink;">의견 남기기</span>
		</p>

		<div style="width: 840px; margin: 60px auto; padding: 30px;">
			<form
				action="<%=application.getContextPath()%>/feed/write-handle.jsp">
				<table style="border-collapse: collapse; width: 100%">
					<tr>
						<td class="td-left">작성자</td>
						<td class="td-right"><%=authUser%></td>
					</tr>
					<tr>
						<td class="td-left">제목</td>
						<td class="td-right"><input name="title" type="text"
							style="padding: 6px 10px; width: 500px; border: 1px solid #ccc" /></td>
					</tr>
					<tr>
						<td class="td-left" colspan="2">
							<textarea name="body"
								style="height: 200px; resize: none; width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc"></textarea>
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
</body>
</html>