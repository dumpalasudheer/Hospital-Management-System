package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DbConnect;
import com.entity.Appointment;

@WebServlet("/makeAppointment")
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
	try{
			int userId = Integer.parseInt(req.getParameter("userId"));
			String name = req.getParameter("name");
			String age = req.getParameter("age");
			String email = req.getParameter("email");
			String gender = req.getParameter("gender");
			String appointDate = req.getParameter("appointDate");
			String disease = req.getParameter("disease");
			int doctId = Integer.parseInt(req.getParameter("doct"));
			String phnNno = req.getParameter("phnNo");
			String address = req.getParameter("address");
			
			Appointment apt = new Appointment(userId,name,age,email,gender,appointDate,
					disease,doctId,phnNno,address,"pending");
			AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
			HttpSession session = req.getSession();
			if(dao.getAppointment(apt)) {
				session.setAttribute("succMsg","Appointment request is generated successfully");
				resp.sendRedirect("appointment.jsp");
			}
			else {
				session.setAttribute("ErrMsg","Something went wrong");
				resp.sendRedirect("appointment.jsp");
			}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	}
}
