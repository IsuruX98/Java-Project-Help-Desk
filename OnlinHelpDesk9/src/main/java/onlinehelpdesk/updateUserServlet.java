package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String mobile = request.getParameter("umobile");
		String pw = request.getParameter("upw");
		String rpw = request.getParameter("rpw");
		
		boolean isTrue;
		//making a dispatcher object to redirect
		RequestDispatcher dis = null;
		
		//validations
		if (pw != rpw) {
			request.setAttribute("status", "pwdmissmatch");
			dis = request.getRequestDispatcher("register.jsp");
			dis.forward(request, response);
		}else {
		
		UserDBUtil o = new UserDBUtil();
		isTrue = o.updateUser(id, name, email, mobile, pw);
		
		if (isTrue == true) {
			request.setAttribute("status", "updatedone");
			dis = request.getRequestDispatcher("login.jsp");
		}else {
			request.setAttribute("status", "updatefailed");
			dis = request.getRequestDispatcher("updateuser.jsp");
		}
		dis.forward(request, response);
		
		}
	}

}
