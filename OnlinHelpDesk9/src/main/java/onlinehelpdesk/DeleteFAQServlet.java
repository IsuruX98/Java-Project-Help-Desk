package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteFAQServlet")
public class DeleteFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String id = request.getParameter("FAQ_ID");
		  String heading = request.getParameter("heading");
		  
		  faqDBUtil faq = new faqDBUtil();
		  
		  boolean rs = faq.deleteEvent(id, heading);
		  
		  if(rs) {
		   request.setAttribute("FAQdelete", "FAQdeleted");
		   RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
		   rd.forward(request,response);
		  }
		  else {
		   List<FAQ> faq1 =  faq.getSingleFAQ(heading);
		   request.setAttribute("faqDel", faq1);
		   response.sendRedirect("GetFAQ");
		   
		  }
		
	}

}
