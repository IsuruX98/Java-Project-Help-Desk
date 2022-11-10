package onlinehelpdesk;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class ArticleDBUtil {
	

	private  Connection con = null;
	private  Statement stmt = null;
	private boolean isSuccess = false;
	
	public boolean insertArticle(String adminid,String subject,String description) {
		
		try {
			
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "insert into article values(0,'"+adminid+"','"+subject+"','"+description+"')";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			
			isSuccess = true;
		}
		
		else {
			isSuccess = false;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public List<articleDetails> viewArticle(){
		
		 ArrayList<articleDetails> details = new ArrayList<>();
		 
		 try {
			 	
			 	con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from article";
				ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()) {
					int id = rs.getInt(1);
					String adminID = rs.getString(2);
					String subject = rs.getString(3);
					String description = rs.getString(4);
					System.out.println(id);
					System.out.println(adminID);
					
					articleDetails ardls = new articleDetails(id,adminID,subject,description);
					details.add(ardls);
				}
			 
		 }catch(Exception e) {
			
			 e.printStackTrace();
		 }
		 
		 return details;
	}
	
	
	
	public boolean updateArticle(int id,String adminid,String subject,String description) {
		
		boolean isSuccess = false; 
		
		try {
			
		 	
		 	con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update helpdesk.article set subject = '"+subject+"', description = '"+description+"' where id = '"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else {
				isSuccess = false;
	
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
		
	}
	
	public boolean deleteArticle(int id) {
		
		boolean isSuccess = false;
		
		try {
		 	
		 	con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from helpdesk.article where id = '"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return isSuccess;
	}
	
	
	public List<articleDetails> viewArticleUser(){
		
		 ArrayList<articleDetails> details = new ArrayList<>();
		 
		 try {
			 	
			 	con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from article";
				ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()) {
					int id = rs.getInt(1);
					String adminID = rs.getString(2);
					String subject = rs.getString(3);
					String description = rs.getString(4);

					
					articleDetails ardls = new articleDetails(id, adminID, subject, description);
					details.add(ardls);
				}
			 
		 }catch(Exception e) {
			
			 e.printStackTrace();
		 }
		 
		 return details;
	}

}
