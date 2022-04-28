package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserLogin {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void UserDAO() {
		try {
			String url = "jdbc:mariadb://localhost:3306/khgdb";
			String user = "khg";
			String pwd ="1111";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);
			} catch(Exception e) {
				e.printStackTrace();
		}
	}
	public int login(String userID, String userPw) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setNString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getNString(1).contentEquals(userPw))
					return 1;
				else
					return 0;
			}return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
		
	}

}
