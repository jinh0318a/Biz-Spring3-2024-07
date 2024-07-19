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
String title = request.getParameter("title");
String body = request.getParameter("body");

Feed found = feedDao.findByNo(no);
if (found.writerId() != null && found.writerId().equals(authUserId)) {
	
	
	Feed temp = new Feed(found.no(), found.writerId(), title, body, found.writedAt(), found.readCount());
	boolean result = feedDao.updateFeed(temp);
	
	if(result){
%>
<script>
	window.alert("수정 되었습니다.");
	location.href="<%=application.getContextPath()%>/feed/view.jsp?no=<%=no%>";
	</script>
<%
	}else{%>
		<script>
	window.alert("오류가 발생했습니다.");
	history.go(-2);
	</script>
	<%}
} else {
%>
<script>
	window.alert("권한이 없습니다.");
	location.href="<%=application.getContextPath()%>/feed/list.jsp";
</script>
<%
}
%>