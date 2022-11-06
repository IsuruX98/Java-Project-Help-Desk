package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/msglist")
public class contactuslistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDBUtil o = new UserDBUtil();
		List<ContactUs> clist = o.getcontactUsdetails();
		request.setAttribute("clist", clist);
		
		RequestDispatcher dis = request.getRequestDispatcher("contactuslist.jsp");
		dis.forward(request, response);
		
	}

}
