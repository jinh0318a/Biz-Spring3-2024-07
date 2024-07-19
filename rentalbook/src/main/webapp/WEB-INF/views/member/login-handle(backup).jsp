<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String userId = request.getParameter("user_id");
String password = request.getParameter("password");
boolean result = false;
if (!userId.isBlank() && !password.isBlank()) {
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
	ods.setUser("rentalbook");
	ods.setPassword("oracle");

	Connection conn = ods.getConnection();

	PreparedStatement stmt = conn.prepareStatement("select * from users where user_id=?");
	stmt.setString(1, userId);

	ResultSet rs = stmt.executeQuery();

	if (rs.next()) {
		String dbPass = rs.getString("password");
		if (dbPass.equals(password)) {
			result = true;
		}
	}
	conn.close();
} 

if(result){
	session.setAttribute("auth", true);
	session.setAttribute("auth_user_id", userId);
	response.sendRedirect(application.getContextPath()+"/mylib/index.jsp");
	return;
}else{

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이전 | 동네도서관</title>
</head>
<body>
<script type="text/javascript">

window.alert("정보가 정확하지 않거나 접속권한이 없습니다.");
location.href="<%=application.getContextPath()%>/member/login.jsp";
</script>
</body>
</html>

<%} %>