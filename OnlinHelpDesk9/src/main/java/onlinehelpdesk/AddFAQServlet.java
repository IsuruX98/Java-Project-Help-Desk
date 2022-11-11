package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddFAQServlet")
public class AddFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String heading = request.getParameter("heading");
		  String content = request.getParameter("content");
		  String category = request.getParameter("category");
		  
		  faqDBUtil db = new faqDBUtil();
		  
		  boolean isTrue;
		  
		  isTrue=db.insertFAQ(heading, content, category);
		  
		  if(isTrue==true) {
			  request.setAttribute("FAQ", "FAQadded");
		   RequestDispatcher dis = request.getRequestDispatcher("adminHome.jsp");
		    dis.forward(request, response);
		  }else{
		   RequestDispatcher dis2 = request.getRequestDispatcher("adminHome.jsp");
		   dis2.forward(request, response);
		  }

		  
		
	}

}
