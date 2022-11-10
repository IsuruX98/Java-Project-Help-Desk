package onlinehelpdesk;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class faqDBUtil implements I_faq {

	private static Connection con = null;
	 private static Statement stmt = null;
	 private static ResultSet rset = null;
	 
	 
	 // method for insert data
	 public  boolean insertFAQ(String heading,String content,String category) {
	  boolean isSuccess =  false;
	  
	  try {
	   
	   con = DBConnect.getConnection();
	   stmt = con.createStatement();
	   // insert query
	   String qry = "INSERT INTO faq VALUES(0,'"+heading+"','"+content+"','"+category+"');";
	   
	   int rs = stmt.executeUpdate(qry);
	   if(rs>0) {
	    isSuccess= true;
	   }
	   else {
	    isSuccess=false;
	   }
	   
	  }
	  catch(Exception e) {
	   e.printStackTrace();
	  }
	  
	  
	  return isSuccess;
	 }
	 //method to select data
	 public  ArrayList<FAQ> getFAQDetails(String heading){
	  ArrayList<FAQ> faq = new ArrayList<>();
	  try {
	   con = DBConnect.getConnection();
	   stmt = con.createStatement();
	   String qry = "SELECT * FROM faq WHERE Heading LIKE '%"+heading+"%'";
	   
	   rset = stmt.executeQuery(qry);
	   
	   while(rset.next()) {
	    int id = rset.getInt(1);
	    String heading1 = rset.getString(2);
	    String content = rset.getString(3);
	    String category = rset.getString(4);
	    
	    
	    FAQ f1 = new FAQ(id,heading1,content,category);
	    faq.add(f1);
	    
	    
	   }
	  }
	  catch(Exception e) {
	   e.printStackTrace();
	  }
	  
	  return faq;
	 }
	 //get single record
	 public List<FAQ> getSingleFAQ(String username){
	  ArrayList<FAQ> faq = new ArrayList<>();
	  try {
	   con = DBConnect.getConnection();
	   stmt = con.createStatement();
	   
	   String qry =  "SELECT * FROM faq where Heading='"+username+"'";
	   ResultSet rs =  stmt.executeQuery(qry);
	   
	   while(rs.next()){
	    
	    int id = rs.getInt(1);
	    String heading = rs.getString(2);
	    String content = rs.getString(3);
	    String category = rs.getString(4);
	    
	    FAQ faq1 = new FAQ(id,heading,content,category);
	    
	    faq.add(faq1);
	   }
	  }catch(Exception e) {
	   System.out.println("error in single updation");
	  }
	  
	  
	  return null;
	 }
	 
	 //method for update
	 public boolean updateFAQ(String id,String heading,String content,String category) {
	  boolean isSuccess = false;
	  
	  try {
	   con = DBConnect.getConnection();
	   stmt = con.createStatement();
	   //update
	   String qry = "UPDATE faq set Heading='"+heading+"',Content='"+content+"',Category='"+category+ "'where FAQ_ID='"+id+"'";
	   int rs = stmt.executeUpdate(qry);
	   if(rs>0) {
	    isSuccess = true;
	   }else {
	    isSuccess = false;
	   }
	    
	  }catch(Exception  e) {
	   System.out.println("updation error");
	  }
	  
	  
	  
	  return isSuccess;
	 }
	 
	 
	 // method for deleting
	 public boolean deleteEvent(String id,String heading) {
	  boolean isSuccess = false;
	  try {
	   con = DBConnect.getConnection();
	   stmt = con.createStatement();
	   String qry =  "delete from faq where FAQ_ID ='"+id+"'AND Heading='"+heading+"'";
	   
	   int rset=stmt.executeUpdate(qry);
	   
	   if(rset>0) {
	    isSuccess = true;
	   }
	  }
	  catch(Exception e ) {
	   System.out.println("deletion error");
	  }
	  
	  
	  
	  
	  return isSuccess;
	 }
	 @Override
	 public boolean updateFAQ(String heading, String content, String category) {
	  // TODO Auto-generated method stub
	  return false;
	 }
	 @Override
	 public boolean deleteFAQ(String id, String heading) {
	  // TODO Auto-generated method stub
	  return false;
	 }
	
}
