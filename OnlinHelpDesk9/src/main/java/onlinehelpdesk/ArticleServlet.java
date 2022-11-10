package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/insert")
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		String AdminID = request.getParameter("adminid");
		String Subject = request.getParameter("subject");
		String Description = request.getParameter("dis");
		
		ArticleDBUtil dbutil = new ArticleDBUtil();
		
		boolean isTrue = dbutil.insertArticle(AdminID, Subject, Description);
		
		 if(isTrue ==true) {
			 RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			 dis.forward(request, response);
			 
		 }else {
			 RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
			 dis.forward(request, response);
		 }
		
		
	}

}
