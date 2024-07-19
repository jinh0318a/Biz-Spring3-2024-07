<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean h_auth = (Boolean)session.getAttribute("auth");
String h_authUserId=(String)session.getAttribute("auth_user_id");
UserDao h_userDao = new UserDao();
User h_authUser= h_userDao.findByUserId(h_authUserId);

%>

<%-- header include --%>
<div style="padding: 8px;">
	<%-- banner / login & join / search --%>
	<div
		style="display: flex; align-items: center; justify-content: space-between;">
		<%--banner --%>
		<div>
			<h1 style="font-weight: lighter;">
				<a href="<%=application.getContextPath()%>/index.jsp"
					class="no-deco-link">동네도서관</a>
			</h1>

		</div>
		<%--search --%>
		<div>
			<input type="text" class="srch-bar" placeholder="검색어를 입력하세요">
		</div>
		<%--login/join --%>
		<%if(!h_auth){ %>
		<div>
			<a href="<%=application.getContextPath()%>/member/login.jsp"
				class="no-deco-link">로그인</a> | <a
				href="<%=application.getContextPath()%>/member/join.jsp"
				class="no-deco-link">회원가입</a>
		</div>
		
		<%}else {%>
		<div>
		<%=h_authUser.nickname() %>님 
			<a href="<%=application.getContextPath()%>/member/logout.jsp"
				class="no-deco-link">로그아웃</a> | <a
				href="<%=application.getContextPath()%>/mylib/modify.jsp"
				class="no-deco-link">정보수정</a> | <a
				href="<%=application.getContextPath()%>/mylib/favorite.jsp"
				class="no-deco-link">찜목록</a>
		</div>
		<%} %>
		
	</div>
	<%-- shortcut --%>
	<div style="display: flex; align-items: center; justify-content: space-around; font-size: large;" >
		<div><a href="<%=application.getContextPath()%>/book/search.jsp" class="no-deco-link fs-large">도서 검색</a></div>
		<div><a href="<%=application.getContextPath()%>/feed/list.jsp" class="no-deco-link">열린공간</a></div>
	</div>
</div>
