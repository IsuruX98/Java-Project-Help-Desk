package onlinehelpdesk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

public class UserDBUtil {
	
	private static boolean isSuccess = false;
	static boolean userCheck = false;
	private static Connection con = null;
	private static Statement stmt = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;
	
	//method for validating the user
	public boolean validateUser(String uemail,String upw) {
		try {
		//making the database connection
		con = DBConnect.getConnection();
		
		//create a statement and executing the query
		pst = con.prepareStatement("select * from users where uemail = ? and upw = ?");
		pst.setString(1, uemail);
		pst.setString(2, upw);
		
		//passing the result to the result set object
		rs = pst.executeQuery();
		
		if(rs.next()) {
			String type = rs.getString(6);
			System.out.println(type);

			if (type.equals("admin")) {
				userCheck = true;
			}else {
				userCheck = false;
			}
			if (type.equals("user")) {
				isSuccess = true;
			}else {
				isSuccess = false;
				
			}	
		}else {
			isSuccess = false;
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//method to store details of user
	public List<User> getUserDetails(String uemail,String upw){
		
		ArrayList<User> user = new ArrayList<>();
		
		try {
			//making the database connection
			con = DBConnect.getConnection();
			
			//create a statement and executing the query
			pst = con.prepareStatement("select * from users where uemail = ? and upw = ?");
			pst.setString(1, uemail);
			pst.setString(2, upw);
			
			//passing the result to the result set object
			rs = pst.executeQuery();
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String mobile = rs.getString(4);
				String pwd = rs.getString(5);
				
				User u = new User(id, name, email, mobile, pwd);
				user.add(u);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return user;
	}
	
	//method for insert users
	public boolean insertuser(String uname,String uemail,String umobile,String upw) {
		
		try {
			//making the database connection
			con = DBConnect.getConnection();
			
			//passing the values to the database table
			pst = con.prepareStatement("insert into users(uname,uemail,umobile,upw) values(?,?,?,?)");
			
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, umobile);
			pst.setString(4, upw);
			
			//executing the query
			int rawCount = pst.executeUpdate();
			
			//Checking the query has errors or not
			if (rawCount > 0) {
				isSuccess = true;
	
			}else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			try {
				con.close();//closing the connection 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
}
