<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>
	<%
		String id = "", pwd="", name="", num1="", num2="", email="", phone="", zipcode="", address="", jobs="";
		int counter = 0;
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mirim2");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from tblRegister");
	%>
		<h2>JSP에서 데이터베이스 연동 예제</h2><br/>
		<h3>회원정보</h3>
		<table border="1">
			<tr>
				<td><strong>ID</strong></td>
				<td><strong>PWD</strong></td>
				<td><strong>NAME</strong></td>
				<!-- <td><strong>NUM1</strong></td>
				<td><strong>NUM2</strong></td>
				<td><strong>EMAIL</strong></td>
				<td><strong>PHONE</strong></td>
				<td><strong>ZIPCODE/ADDRESS</strong></td>
				<td><strong>JOBS</strong></td>    -->
			</tr>
	<%
		if (rs != null) {
			while (rs.next()) {
				id = rs.getString("id");
				pwd = rs.getString("pwd");
				name = rs.getString("name");
				// num1 = rs.getString("num1");
				// num2 = rs.getString("num2");
				// email = rs.getString("email");
				// phone = rs.getString("phone");
				// zipcode = rs.getString("zipcode");
				// address = rs.getString("address");
				// jobs = rs.getString("jobs");

	%>
			<tr>
				<td><%=id%></td>
				<td><%=pwd%></td>
				<td><%=name%></td>
				<!-- <td><%=num1%></td>
				<td><%=num2%></td>
				<td><%=email%></td>
				<td><%=phone%></td>
				<td><%=zipcode%>/<%=address %></td>
				<td><%=jobs%></td>  -->
			</tr>
	<%
					counter++;
				}//end while
			}//end if
	%>
		</table>
		<br/>
			total records : <%=counter %>
		<%
		} catch(SQLException sqlException) {
			System.out.println("sql exception");
		} catch (Exception exception) {
			System.out.println("exception");
		} finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception ex) {
				}
		}
		%>
</body>
</html>