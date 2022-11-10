package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/GetFAQ")
public class ShowFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String search = request.getParameter("search");
		  
		  faqDBUtil db = new faqDBUtil();
		  ArrayList<FAQ> faqdetails = db.getFAQDetails(search);
		  request.setAttribute("faqdetails", faqdetails);
		  
		  RequestDispatcher dis = request.getRequestDispatcher("GetFAQ.jsp");
		  dis.forward(request, response);
		
	}

}
