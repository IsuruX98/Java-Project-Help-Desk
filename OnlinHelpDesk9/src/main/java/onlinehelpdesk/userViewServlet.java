package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userview")

public class userViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArticleDBUtil dbutil = new ArticleDBUtil();
		List<articleDetails> artdls = dbutil.viewArticleUser();
		request.setAttribute("artdls", artdls);
		RequestDispatcher rd = request.getRequestDispatcher("userview.jsp");
		rd.forward(request, response);
		
	
		
		
		
	}

}
