package onlinehelpdesk;

import java.util.ArrayList;
import java.util.List;

public interface I_faq {

	// abstract method for insert data
	 public  boolean insertFAQ(String heading,String content,String category);
	 
	 //abstract method for select data
	 public  ArrayList<FAQ> getFAQDetails(String heading);
	 
	 //abstract method for update data 
	 public boolean updateFAQ(String heading,String content,String category);
	 
	 //abstract method for delete data
	 public boolean deleteFAQ(String id,String heading);
	 
	 //abstract method for get single data
	 public List<FAQ> getSingleFAQ(String username);
	
}
