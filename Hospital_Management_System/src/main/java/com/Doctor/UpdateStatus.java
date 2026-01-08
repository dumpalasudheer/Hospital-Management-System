package com.Doctor;

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

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get data from the form
            int id = Integer.parseInt(req.getParameter("id"));
            int doctId = Integer.parseInt(req.getParameter("doctId"));
            String status = req.getParameter("status");

            Appointment apt = new Appointment(doctId,status);
            AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
            boolean updated = dao.getPatientStatus(id, doctId, status);

            // Redirect with appropriate message
            HttpSession session = req.getSession();
            if (updated) {
                session.setAttribute("succMsg", "Status updated successfully!");
            } else {
                session.setAttribute("ErrMsg", "Failed to update status.");
            }
            resp.sendRedirect("doctor/index.jsp"); // Redirect back to the dashboard
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
