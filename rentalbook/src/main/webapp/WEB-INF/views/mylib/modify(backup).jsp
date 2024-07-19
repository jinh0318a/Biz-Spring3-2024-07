<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean auth = (Boolean) session.getAttribute("auth");

String authUserId = (String) session.getAttribute("auth_user_id");

UserDao userDao = new UserDao();
User authUser = userDao.findByUserId(authUserId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css">
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
	<div style="width: 840px; margin: auto; text-align: center;">
			<h2>회원정보수정</h2>
		<div style="text-align: right; margin-bottom: 8px">
			<span style="color: red">*</span> 비밀번호와 닉네임만 수정가능합니다.
		</div>
	</div>
	<div
		style="width: 840px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
		<form action="<%=application.getContextPath()%>/member/modify-handle.jsp">
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd">회원상태</td>
					<td style="border: 1px solid #ccc; padding: 6px;">정상</td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd">아이디</td>
					<td style="border: 1px solid #ccc; padding: 6px;"><%=authUser.userId()%></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd"><span
						style="color: red">*</span>닉네임</td>
					<td style="border: 1px solid #ccc; padding: 6px;"><input
						type="text" style="padding: 6px;" name="nickname" value="<%=authUser.nickname()%>">&nbsp; * 변경시에만 입력하세요.</td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd"><span
						style="color: red">*</span> 비밀번호</td>
					<td style="border: 1px solid #ccc; padding: 6px;"><input
						type="password" style="padding: 6px;" name="password">&nbsp; * 변경시에만 입력하세요.</td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd"><span
						style="color: red">*</span> 비밀번호확인</td>
					<td style="border: 1px solid #ccc; padding: 6px;"><input
						type="password" style="padding: 6px;" name="passwordcheck"></td>
				</tr>
				
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd">성별</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><%=authUser.gender()%></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #dddddd">가입일</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><%=authUser.registerd_at()%></td>
				</tr>
		

			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 6px 10px;">정보수정</button>
				<a href="<%=application.getContextPath()%>/index.jsp"><button
						type="button" style="padding: 6px 10px;">취소</button></a>
			</div>

		</form>
	</div>

	<%
	}
	%>

</body>
</html>