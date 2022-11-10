package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateFAQS")
public class UpdateFAQS extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String id = request.getParameter("FAQ_ID");
		  String heading = request.getParameter("heading");
		  String content = request.getParameter("Content");
		  String category = request.getParameter("category");
		  
		  faqDBUtil db = new faqDBUtil();
		  
		  boolean rs = db.updateFAQ(id, heading, content, category);
		  
		  if(rs==true) {
		   RequestDispatcher rd = request.getRequestDispatcher("Success.jsp"); 
		   rd.forward(request, response);
		    
		  }
		  else {
		   RequestDispatcher rd = request.getRequestDispatcher("UnSuccess.jsp");
		   rd.forward(request, response);
		  }
		
	}

}
