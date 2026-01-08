package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Doctor;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean getAppointment(Appointment apt) {
		boolean f = false;
		String query = "insert into appointment (userId,name,age,email,gender,appointDate,disease,doctId,phnNo,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, apt.getUserId());
		ps.setString(2,apt.getName());
		ps.setString(3, apt.getAge());
		ps.setString(4, apt.getEmail());
		ps.setString(5, apt.getGender());
		ps.setString(6, apt.getAppointDate());
		ps.setString(7, apt.getDisease());
		ps.setInt(8, apt.getDoctId());
		ps.setString(9, apt.getPhnNno());
		ps.setString(10, apt.getAddress());
		ps.setString(11, apt.getStatus());
		int i = ps.executeUpdate();
		if(i==1) {
			f = true;
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List getAppointmentDetailsbyUserId(int id) {
		List<Appointment> lst = new ArrayList<Appointment>();
		Appointment apt = null;
		try {
			String query = "select * from appointment where userId =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				apt = new Appointment();
				apt.setId(rs.getInt(1));
				apt.setUserId(rs.getInt(2));
				apt.setName(rs.getString(3));
				apt.setAge(rs.getString(4));
				apt.setEmail(rs.getString(5));
				apt.setGender(rs.getString(6));
				apt.setAppointDate(rs.getString(7));
				apt.setDisease(rs.getString(8));
				apt.setDoctId(rs.getInt(9));
				apt.setPhnNno(rs.getString(10));
				apt.setAddress(rs.getString(11));
				apt.setStatus(rs.getString(12));
				
				lst.add(apt);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	public List getAppointmentDetailsbyDoctId(int doctId) {
		List<Appointment> lst = new ArrayList<Appointment>();
		Appointment apt = null;
		try {
			String query = "select * from appointment where doctId =?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, doctId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				apt = new Appointment();
				apt.setId(rs.getInt(1));
				apt.setUserId(rs.getInt(2));
				apt.setName(rs.getString(3));
				apt.setAge(rs.getString(4));
				apt.setEmail(rs.getString(5));
				apt.setGender(rs.getString(6));
				apt.setAppointDate(rs.getString(7));
				apt.setDisease(rs.getString(8));
				apt.setDoctId(rs.getInt(9));
				apt.setPhnNno(rs.getString(10));
				apt.setAddress(rs.getString(11));
				apt.setStatus(rs.getString(12));
				
				lst.add(apt);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	public boolean getPatientStatus(int id, int doctId,String status) {
		boolean b= false;
		try {
			String query = "update appointment set status=? where id=? and doctId=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.setInt(2, doctId);
			ps.setString(3, status);
			int i= ps.executeUpdate();
			if(i==1) {
				b=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public List<Appointment> getAllPatients(){
		List<Appointment> lst = new ArrayList<Appointment>();
		Appointment appoint  =null;
		try {
			String query = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				appoint = new Appointment();
				appoint.setId(rs.getInt("id"));
				appoint.setUserId(rs.getInt("userId"));
				appoint.setName(rs.getString("name"));
				appoint.setAge(rs.getString("age"));
				appoint.setEmail(rs.getString("email"));
				appoint.setGender(rs.getString("gender"));
				appoint.setAppointDate(rs.getString("appointDate"));
				appoint.setDisease(rs.getString("disease"));
				appoint.setDoctId(rs.getInt("doctId"));
				appoint.setPhnNno(rs.getString("phnNo"));
				appoint.setAddress(rs.getString("address"));
				
				lst.add(appoint);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	public List<Doctor> getDoctNamebyDoctId(int doctId) {
		List<Doctor> docList = new ArrayList<Doctor>();
		try {
			String query = "select * from doctor_details where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1,doctId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Doctor doctor = new Doctor();
				 doctor.setId(rs.getInt("id"));
		         doctor.setFullName(rs.getString("fullName")); // Replace "name" with the actual column name for the doctor's name
		         docList.add(doctor);
				
			}
		}
	
		catch(Exception e) {
			e.printStackTrace();
		}
		return docList;
	}

}
