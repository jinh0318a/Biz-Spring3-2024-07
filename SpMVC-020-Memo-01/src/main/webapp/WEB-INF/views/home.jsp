<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0' />
<title>오늘은 나의 날</title>
<link rel="stylesheet" href="${rootPath }/static/css/main.css">
<script>
	const rootPath = "${rootPath}"
</script>
<script src="${rootPath }/static/js/list.js"></script>
</head>
<body>
	<h1>오늘의 내 인생의 가장 젊은날</h1>
	<section class="memo main">
		<article class="list">
			<div class="date-time">
				<input type="date" placeholder="작성일" name="m_date" /> <input
					type="time" placeholder="작성시각" name="m_time" /> <input
					type="button" value="새로작성" />
			</div>
			<ul class="memo-list">
				<li>오늘은 수요일</li>
				<li>메모장 만들기</li>
				<li>Spring MVC</li>
			</ul>
		</article>
		<article class="sub"></article>
	</section>
	<footer>
		<address>CopyRigt &copy; jinh0318a@naver.com</address>
	</footer>
</body>
</html>