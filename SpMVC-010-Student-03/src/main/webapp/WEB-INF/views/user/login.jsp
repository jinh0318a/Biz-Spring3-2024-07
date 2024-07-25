<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<link rel="stylesheet" href="${rootPath }/static/css/user/login.css" />
<form class="user login" method="post">
	<fieldset>
		<legend>로그인</legend>
		<div>
			<input type="text" placeholder="ID" name="username" /> <span>*</span>
		</div>
		<div>
			<input type="password" placeholder="PASSWORD" name="password" /> <span>*</span>
		</div>
		<div>
			<input class="button" type="button" value="로그인" />
		</div>
	</fieldset>
</form>
