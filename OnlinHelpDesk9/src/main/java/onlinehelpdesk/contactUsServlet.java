package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/contactus")
public class contactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cname = request.getParameter("cname");
		String cemail = request.getParameter("cemail");
		String csubject = request.getParameter("csubject");
		String cmessage = request.getParameter("cmessage");
		
		boolean isTrue;
		
			    //for redirect after adding the data to the table
				RequestDispatcher dispatcher = null;

				UserDBUtil o = new UserDBUtil();
				isTrue = o.storeContactUs(cname, cemail, csubject, cmessage);
				
				
				if (isTrue == true) {
					
					request.setAttribute("status", "contactusdone");
					dispatcher = request.getRequestDispatcher("index.jsp");
					
				}else {
					
					request.setAttribute("status", "contactusfail");
					dispatcher = request.getRequestDispatcher("contactus.jsp");
				}
				
				dispatcher.forward(request, response);
		
	}

}
