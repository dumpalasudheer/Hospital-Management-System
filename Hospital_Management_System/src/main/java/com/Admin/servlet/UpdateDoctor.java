package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DbConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullName");
			String qualification = req.getParameter("qualification");
			String specialisation = req.getParameter("specialisation");
			String email = req.getParameter("email");
			String mobileNo = req.getParameter("mobileNo");
			String password = req.getParameter("password");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor d = new Doctor(id,fullName,qualification,specialisation,email,mobileNo,password);
			
			DoctorDao dao = new DoctorDao(DbConnect.getConn());
			
			HttpSession session =  req.getSession();
			
			if(dao.updateDoctor(d)) {
				session.setAttribute("succMsg","Doctor details updated Successfully");
				resp.sendRedirect("Admin/doctor.jsp");
			}
			else {
				req.setAttribute("ErrMsg","Something went Wrong");
				resp.sendRedirect("Admin/doctor.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
