<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<link rel="stylesheet" href="${rootPath }/static/css/user/join.css" />
<form class="user join" method="post">
	<fieldset>
		<legend>회원가입</legend>
		<div>
			<input type="text" placeholder="ID" />
		</div>
		<div>
			<input type="password" placeholder="PASSWORD" />
		</div>
		<div>
			<input type="text" placeholder="본명" />
		</div>
		<div>
			<input type="text" placeholder="닉네임" />
		</div>
		<div>
			<input class="button" type="button" value="회원가입" />
		</div>	
	</fieldset>
</form>
