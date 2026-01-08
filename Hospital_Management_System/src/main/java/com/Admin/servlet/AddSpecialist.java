package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DbConnect;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
		boolean f = dao.addSpecialist(specName);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("succMsg", "Specialist Added Successfully");
			resp.sendRedirect("Admin/index.jsp");
		}
		else {
			session.setAttribute("ErrMsg", "Something went Wrong..!");
			resp.sendRedirect("Admin/index.jsp");
		}
	}
	
}
