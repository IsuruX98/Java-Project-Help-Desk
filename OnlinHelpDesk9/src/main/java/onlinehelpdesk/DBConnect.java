package onlinehelpdesk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	public static Connection getConnection() {
		
		String url = "jdbc:mysql://localhost:3306/helpdesk";
		String username = "root";
		String password = "1234";
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			
		} catch (ClassNotFoundException e) {
			System.out.println("Database connection is not success!!!");
			e.getMessage();
		}catch (SQLException e) {
			System.out.println("Database connection is not success!!!");
			e.getMessage();
		}
		if (con != null) {
			System.out.println("connection successfull");
		}
		return con;
		
	}
	
}
