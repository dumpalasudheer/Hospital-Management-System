package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import com.dao.UserDao;
import com.entity.User;
import com.db.DbConnect;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String full_name = req.getParameter("full_name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User u = new User(full_name,email,password);
			
			UserDao dao = new UserDao(DbConnect.getConn());
			boolean f = dao.register(u);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg","Register Successful");
				resp.sendRedirect("sign up.jsp");
			}
			else {
				session.setAttribute("ErrMsg","something went wrong..!");
				resp.sendRedirect("sign up.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
