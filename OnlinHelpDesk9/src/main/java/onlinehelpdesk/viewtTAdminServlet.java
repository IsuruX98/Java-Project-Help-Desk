package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/yadminlist")
public class viewtTAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TicketdbUtil ticket4 = new TicketdbUtil();

		
			List<Ticket> getAdminTicket = ticket4.getinfoAdmin();
			request.setAttribute("getAdminTicket", getAdminTicket);
			
			RequestDispatcher dis = request.getRequestDispatcher("AdminuserTicketList.jsp"); 
			dis.forward(request, response);
			
		
		
		
		
	}

}
