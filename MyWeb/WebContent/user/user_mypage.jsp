<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//주소를 치고 강제로 들어오려는 접근을 막는 방법.
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}

	String id = (String) session.getAttribute("user_id");
	String name = (String) session.getAttribute("user_name");

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<div align="center">
	<h3>My Page</h3>
	<hr>
	
	<%=name %>(<%=id %>) 님의 정보를 관리합니다.
	<br>
	<br>
	
	<a href="user_change_pw.jsp">비밀번호 변경</a> &nbsp;&nbsp;
	<a href="user_update.jsp">회원정보 변경</a> &nbsp;&nbsp;
	<a href="user_delete.jsp">회원 탈퇴</a>
		
	</div>

	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
















