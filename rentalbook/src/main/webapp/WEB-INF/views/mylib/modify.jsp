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
		<p style="text-align: right">
				회원서비스 &gt; <span style="color: hotpink;">회원정보수정</span>
		</p>
		<div style="text-align: right; margin-bottom: 8px">
			<span style="color: red">*</span> 비밀번호와 닉네임만 수정가능합니다.
		</div>
	</div>
	<div
		style="width: 840px; margin: 60px auto; padding: 30px;">
		<form
			action="<%=application.getContextPath()%>/mylib/modify-handle.jsp">
			<input type="hidden" name="authpass" value=<%=authUser.password() %>/>
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td class="td-left">회원상태</td>
					<td class="td-right">정회원(정상)</td>
				</tr>
				<tr>
					<td class="td-left">아이디</td>
					<td class="td-right"><%=authUser.userId()%></td>
				</tr>
				<tr>
					<td class="td-left"><span style="color: red">*</span> 닉네임</td>
					<td class="td-right"><input type="text" style="padding: 6px;"
						name="nickname" value="<%=authUser.nickname()%>"/>&nbsp; *
						변경시에만 입력하세요.</td>
				</tr>
				<tr>
					<td class="td-left"><span style="color: red">*</span> 비밀번호</td>
					<td class="td-right"><input type="password" style="padding: 6px;"
						name="password"/>&nbsp; * 변경시에만 입력하세요.</td>
				</tr>
				<tr>
					<td class="td-left"><span style="color: red">*</span> 비밀번호확인</td>
					<td class="td-right"><input type="password" style="padding: 6px;"
						name="passwordcheck"/></td>
				</tr>

				<tr>
					<td class="td-left">성별</td>
					<td class="td-right"><%=authUser.gender()%></td>
				</tr>
				<tr>
					<td class="td-left">가입일</td>
					<td class="td-right"><%=authUser.registerd_at()%></td>
				</tr>


			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 6px 10px;">정보수정</button>
				<a href="<%=application.getContextPath()%>/mylib/drop.jsp"><button
						type="button" style="padding: 6px 10px;">회원탈퇴</button></a>
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