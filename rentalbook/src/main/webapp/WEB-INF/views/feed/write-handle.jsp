<%@page import="java.sql.Date"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String title = request.getParameter("title");
String body = request.getParameter("body");
String writeId = (String) session.getAttribute("auth_user_id");

Feed one = new Feed(0, writeId, title, body, new Date(System.currentTimeMillis()), 0);
FeedDao feedDao = new FeedDao();
boolean r = feedDao.save(one);

if(title.isBlank() || body.isBlank()){
	r = false;
}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	if (r) {
	%>
	<script type="text/javascript">
		window.alert("성공적으로 등록되었습니다.");
		location.href="<%=application.getContextPath()%>/feed/list.jsp";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		window.alert("오류가 발생하였습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>

</body>
</html>