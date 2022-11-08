package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/y_update")
public class UpdticketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ticketNo = request.getParameter("tid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String contact = request.getParameter("contact");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");
		
		TicketdbUtil ticket = new TicketdbUtil();
		
		ticket.updateTicket(ticketNo, name, email, id, contact, subject, description);
		
		try {
			List<Ticket> getDetails = ticket.getinfo(id);
			request.setAttribute("getDetails", getDetails);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	
		boolean isTrue;
		
		isTrue = ticket.updateTicket(ticketNo, name, email, id, contact, subject, description);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("acc.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("acc.jsp");
			dis2.forward(request, response);
		}

		
	}

}
