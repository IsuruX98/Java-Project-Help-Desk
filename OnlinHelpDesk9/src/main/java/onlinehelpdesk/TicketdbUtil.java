package onlinehelpdesk;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

public class TicketdbUtil {

public boolean addticket(String name, String email, String id, String contact, String subject, String description){
		
				boolean isSuccess = false;
				
				try {
			
					Connection con = DBConnect.getConnection();
					
					Statement stmt = con.createStatement();
					
					String sql = "INSERT INTO addticket VALUES(0, '"+name+"', '"+email+"','"+id+"','"+contact+"','"+subject+"','"+description+"', now())";
					int rs = stmt.executeUpdate(sql); //if connect return 1. if not return 0;
					
					//Data Successfully Inserted?
					if(rs > 0) 
						isSuccess = true;
					else
						isSuccess = false;
					
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
		
		return isSuccess;
	}

	

	public List<Ticket> getinfo(String pid){
		
		ArrayList<Ticket> ticket1 =new ArrayList<>();

		try {
			
			Connection con = DBConnect.getConnection();
			Statement stmt = con.createStatement();
		
			String sql = "SELECT * FROM addticket WHERE studentID = '"+pid+"' ORDER BY date DESC";
		
			ResultSet rs = stmt.executeQuery(sql);
		
	
			while(rs.next()) {
				String ticketNo = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String id = rs.getString(4);
				String contact = rs.getString(5);
				String subject = rs.getString(6);
				String description = rs.getString(7);
				String date = rs.getString(8);
			
				Ticket t1 = new Ticket(ticketNo, name, email, id, contact, subject, description, date);
			
				ticket1.add(t1);
			
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ticket1;
	}
	
	
	public List<Ticket> getinfoAdmin(){
		
		ArrayList<Ticket> ticket1 =new ArrayList<>();

		try {
			
			Connection con = DBConnect.getConnection();
			Statement stmt = con.createStatement();
		
			String sql = "SELECT * FROM addticket ORDER BY date DESC";
		
			ResultSet rs = stmt.executeQuery(sql);
		
	
			while(rs.next()) {
				String ticketNo = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String id = rs.getString(4);
				String contact = rs.getString(5);
				String subject = rs.getString(6);
				String description = rs.getString(7);
				String date = rs.getString(8);
			
				Ticket t2 = new Ticket(ticketNo, name, email, id, contact, subject, description, date);
			
				ticket1.add(t2);
			
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ticket1;
	}
	

	public boolean updateTicket(String ticketNo, String name, String email, String id, String contact, String subject , String description) {
	
		boolean isSuccess = false;
	
		try {
			
			Connection con = DBConnect.getConnection();
			Statement stmt = con.createStatement();
		
			String sql = "UPDATE addticket SET name = '"+name+"', email = '"+email+"', studentID = '"+id+"', contactNo = '"+contact+"', subject = '"+subject+"', description = '"+description+"' WHERE ticketNo = '"+ticketNo+"' ";
		
			int rs = stmt.executeUpdate(sql);
		
			if(rs > 0)
				isSuccess = true;
			else
				isSuccess = false;
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
	
		return isSuccess;
	}

	
	
	public boolean deleteTicket(String ticketNo) {
	
		boolean isSuccess = false;
		
		try {
			
			Connection con = DBConnect.getConnection();
			Statement stmt = con.createStatement();
			
			String sql = "DELETE FROM addticket WHERE ticketNo = '"+ticketNo+"'";
			int rs = stmt.executeUpdate(sql); //if connect return 1. if not return 0;
			
			//Data Successfully Deleted?
			if(rs > 0) 
				isSuccess = true;
			else
				isSuccess = false;
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}
	
}
