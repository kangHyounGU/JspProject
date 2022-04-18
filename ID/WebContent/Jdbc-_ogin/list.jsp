<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
 %>
 
 <%
//1. jdbc driver 등록
Class.forName("org.mariadb.jdbc.Driver");

//2. DB 와 연결(Connection) 생성
//연결문자열 설정
String url = "jdbc:mariadb://localhost:3306/khgdb";
String user = "khg";
String passwd ="1111";

//url, user, passwdw 의 정보를 받아서 가지는 객체 생성
Connection con = DriverManager.getConnection(url, user, passwd);


//3. DB 연동
String sql = "select id, name, pwd from login"; //==or select * from login
Statement stmt = con.createStatement(); //생성하기 위한 객체  생성

ResultSet rs = stmt.executeQuery(sql); //실행을 위한 객체생성


//4 결과 셋에서 데이터 추출하기
String id = "";
String name = "";
String pwd = "";
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>DB 연결</title>
</head>
<body>

<table class="table table-striped  table-striped">
<h2>사용자 목록</h2>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>PWD</th>
	</tr>
	<tr>
	
<%
while(rs.next()){
	 id = rs.getString("id");
	 name = rs.getString("name");
	 pwd = rs.getString("pwd");
%>
	<td><a href="updateForm.jsp?id=<%=id %>"> <%=id %></a></td>
	<td><%=name %></td>
	<td><%=pwd %></td>
	</tr>
<% 	}


//4. 연동 확인
out.println("DB 연결 성공!!!!");

//5. DB 연결 해지
stmt.close();
con.close();
%>

</table>
</body>
</html>