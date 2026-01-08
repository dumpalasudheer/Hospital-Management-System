package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DbConnect;
import com.dao.DoctorDao;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DbConnect.getConn());
		HttpSession session = req.getSession();
		if(dao.deleteDoctor(id)) {
			session.setAttribute("succMsg","Doctor removed Successfully");
			resp.sendRedirect("Admin/doctor.jsp");
		}
		else {
			req.setAttribute("ErrMsg","Something went Wrong");
			resp.sendRedirect("Admin/doctor.jsp");
		}
	}
	
}
