<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
 %>
 
 <%

//1. jdbc driver 등록
Class.forName("org.mariadb.jdbc.Driver");

//2. DB 와 연결(Connection) 생성
// 연결문자열 설정
String url = "jdbc:mariadb://localhost:3306/khgdb";
String user = "khg";
String pwd ="1111";

Connection con = DriverManager.getConnection(url, user, pwd);


//3. DB 연동
String sql = "select * from login";
Statement stmt = con.createStatement();

//4. sql 실행 결과 확인
ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB 연결</title>
</head>
<body>
	<table>
		<tr>
			<th>id</th>
			<th>pwd</th>
		</tr>
		<tr>
			<%
				while(rs.next()){
				String id = rs.getString("id");
				String passwd = rs.getString("pwd");
			%>
				<td><%= id %></td>
				<td><%=passwd %></td>
		</tr>
		<% } %>
	</table>
	<%
	//5. DB 연결해지
	rs.close();
	stmt.close();
	con.close();
	%>

</body>
</html>
