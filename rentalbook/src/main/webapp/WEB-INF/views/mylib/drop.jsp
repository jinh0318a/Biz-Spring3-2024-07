<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
boolean auth = (Boolean) session.getAttribute("auth");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css">
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico">
<style type="text/css">
#button1:hover {
	background-color: #848484;
}
</style>

</head>
<body>
	<%@include file="/common/header.jsp"%>
	<%
	if (!auth) {
	%>
	<script>
window.alert("회원 로그인 후 사용하세요.");
location.href="<%=application.getContextPath()%>/member/login.jsp";
	</script>

	<%
	} else {
	%>

	<div style="width: 840px; margin: auto;">
		<div style="text-align: center">
			<h2>회원탈퇴</h2>
			<p style="text-align: right">
				회원서비스 &gt; <span style="color: hotpink;">회원탈퇴</span>
			</p>
		</div>
	</div>
	<div
		style="width: 400px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
		<h3>유의사항</h3>
		<p>비밀번호가 일치하여야만 회원탈퇴가 진행됩니다.</p>

		<form action="<%=application.getContextPath()%>/mylib/drop-handle.jsp">
			<p>
				<input type="password" class="login-input" placeholder="현재 비밀번호 입력"
					name="password">
			</p>
			<p>
				<button type="submit" class="login-input" id="button1"
					style="color: #A4A4A4">회원탈퇴</button>
			</p>

		</form>

	</div>

	<%
	}
	%>

</body>
</html>
