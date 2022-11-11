package onlinehelpdesk;

import java.util.List;

public interface I_User {
	
	//method for validating the user
	public boolean validateUser(String uemail,String upw);
	
	//method for insert users
	public boolean insertuser(String uname,String uemail,String umobile,String upw);
	
	//method for updating user
    public boolean updateUser(String id,String name,String email,String mobile,String pw);
    
    //method for deleting user
    public boolean deleteUser(String id);
    
    //method for store contact us details
    public boolean storeContactUs(String name,String email,String subject,String msg);
    
    //method to det a list of users
	public List<User> getUserDetails();
	
	//method to get a list of contact us
	public List<ContactUs> getcontactUsdetails();
		
	

}
