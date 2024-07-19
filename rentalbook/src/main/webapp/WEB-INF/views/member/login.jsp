<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 동네도서관</title>
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css">
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico">
<style type="text/css">

#button1:hover{
	background-color: #848484;
}


</style>

</head>
<body>
<%@include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
		<div style="text-align: center">
			<h2>로그인</h2>
			<p style="text-align: right">
				회원서비스 &gt; <span style="color: hotpink;">로그인</span>
		</p>
		</div>
	</div>
	<div
		style="width: 400px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
		<form action="<%=application.getContextPath()%>/member/login-handle.jsp">
			<p>
				<input type="text" class="login-input" placeholder="아이디"
					name="user_id">
			</p>
			<p>
				<input type="password" class="login-input" placeholder="비밀번호"
					name="password">
			</p>
			<p><button type="submit" class="login-input" id="button1" style="color:#A4A4A4">로그인</button>
			</p>

		</form>
		<p style="text-align:center"><a href="<%=application.getContextPath()%>/member/join.jsp" class="no-deco-link">회원가입</a></p>
		
	</div>


</body>
</html>