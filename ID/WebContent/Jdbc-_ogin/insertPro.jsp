<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<% 	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String passwd = request.getParameter("pwd");
 %>
 <% request.setCharacterEncoding("UTF-8");  %>
<%
//1. jdbc driver 등록
Class.forName("org.mariadb.jdbc.Driver");

//2. DB 와 연결(Connection) 생성
// 연결문자열 설정
String url = "jdbc:mariadb://localhost:3306/khgdb";
String user = "khg";
String pwd ="1111";

Connection con = DriverManager.getConnection(url, user, pwd);

//3. SQL 실행 준비
//String sql = "insert into login(id, pwd) valuse('"+id+"','"+passwd+"')";
//Statement stmt = con.createStatement();
String sql = "insert into login(id,name, pwd) values(?,?,?)";

//4. SQL 실행
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, name);
pstmt.setString(3, passwd);
pstmt.executeUpdate();

//5. 객체 해제
	pstmt.close();
	con.close();
	
	response.sendRedirect("DBlogin.jsp");

 %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	당신의 아이디는 <%=id %>이고<br>
	암호는 <%=pwd %>입니다.
	이름은 <%=name %>입니다/
</body>
</html><body>

</body>
</html>