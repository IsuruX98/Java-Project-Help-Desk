package onlinehelpdesk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class UserDBUtil implements I_User {
	
	private static boolean isSuccess = false;
	static boolean userCheck = false;
	private static Connection con = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;
	static HashMap<String, String> user;
	static ArrayList<String> list;
	
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
			String id = rs.getString(1);
			String name = rs.getString(2);
			String email = rs.getString(3);
			String mobile = rs.getString(4);
			String pwd = rs.getString(5);
			String type = rs.getString(6);
			
			user = new HashMap<>();
			
			user.put("id", id);
			user.put("name", name);
			user.put("email", email);
			user.put("mobile", mobile);
			user.put("pw", pwd);


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
	   //method for updating user
       public boolean updateUser(String id,String name,String email,String mobile,String pw) {
		
		try {
			con = DBConnect.getConnection();
			
			pst = con.prepareStatement("update users set uname='"+name+"',uemail='"+email+"',umobile='"+mobile+"',upw='"+pw+"'"
    				+ "where id='"+id+"'");
			
			int rs = pst.executeUpdate();
			
			//Checking the query has errors or not
			if (rs > 0) {
				isSuccess = true;
	
			}else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
     //method for deleting user
        public boolean deleteUser(String id) {
		
		try {
			con = DBConnect.getConnection();
			
			pst = con.prepareStatement("delete from users where id='"+id+"'");
			int rs = pst.executeUpdate();
			
			//Checking the query has errors or not
			if (rs > 0) {
				isSuccess = true;
	
			}else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
        
    //method for store contact us details
        public boolean storeContactUs(String name,String email,String subject,String msg) {
        	
        	try {
    			//making the database connection
    			con = DBConnect.getConnection();
    			
    			//passing the values to the database table
    			pst = con.prepareStatement("insert into contactus(cname,cemail,csubject,cmessage) values(?,?,?,?)");
    			
    			pst.setString(1, name);
    			pst.setString(2, email);
    			pst.setString(3, subject);
    			pst.setString(4, msg);
    			
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
        
      //method to det a list of users
    	public List<User> getUserDetails(){
    		
    		ArrayList<User> user = new ArrayList<>();
    		
    		try {
    			//making the database connection
    			con = DBConnect.getConnection();
    			
    			//create a statement and executing the query
    			pst = con.prepareStatement("select * from users");
    			
    			
    			//passing the result to the result set object
    			rs = pst.executeQuery();
    			
    			while(rs.next()) {
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
    	
    	//method to get a list of contact us
		
		  public List<ContactUs> getcontactUsdetails(){
		  
		  ArrayList<ContactUs> contactUsList = new ArrayList<>();
		  
		  try { 
			  //making the database connection 
			  con = DBConnect.getConnection();
		  
			  //create a statement and executing the query 
			  pst = con.prepareStatement("select * from contactus order by cid desc");
		  
		 
			  //passing the result to the result set object 
			  
			  rs = pst.executeQuery();
		  
			  while(rs.next()) { 
				  int cid = rs.getInt(1); 
				  String cname = rs.getString(2);
				  String cemail = rs.getString(3); 
				  String csubject = rs.getString(4); 
				  String cmessage = rs.getString(5);
		  
		  ContactUs c = new ContactUs(cid, cname, cemail, csubject, cmessage);
		  contactUsList.add(c);
		  
		  }
			  
		} catch (Exception e) { 
			e.printStackTrace(); 
			} 
		  
		  return contactUsList; 
	 }
		 	
}
