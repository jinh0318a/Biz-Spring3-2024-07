<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String authUserId = (String) session.getAttribute("auth_user_id");
FeedDao feedDao = new FeedDao();

if(request.getParameter("no")==null || !request.getParameter("no").matches("[0-9]+")){
	response.sendRedirect(application.getContextPath() + "/feed/list.jsp");
	return;
}

int no = Integer.parseInt(request.getParameter("no"));

Feed found = feedDao.findByNo(no);
if (found.writerId() != null && found.writerId().equals(authUserId)) {

	found = feedDao.findByNo(no);

		boolean dr = feedDao.deleteFeed(found);
		if (dr) {
%>
<script>
	window.alert("삭제 되었습니다.");
	location.href="<%=application.getContextPath()%>/feed/list.jsp";
	</script>
<%
}

} else {
%>
<script>
	window.alert("권한이 없습니다.");
	location.href="<%=application.getContextPath()%>/feed/list.jsp";
</script>
<%
}
%>
