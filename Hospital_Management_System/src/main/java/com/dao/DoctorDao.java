package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean RegisterDoctor(Doctor d) {
		boolean f = false;
		try {
			String query = "insert into doctor_details (fullName,qualification,specialisation,email,mobileNo,password) values (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,d.getFullName());
			ps.setString(2, d.getQualification());
			ps.setString(3,d.getSpecialisation());
			ps.setString(4,d.getEmail());
			ps.setString(5,d.getMobileNo());
			ps.setString(6, d.getPassword());
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Doctor> getAllDoctors(){
		List<Doctor> doc = new ArrayList<Doctor>();
		Doctor d = null;
		try {
		String query = "select * from doctor_details order by id desc";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			d = new Doctor();
			d.setId(rs.getInt(1));
			d.setFullName(rs.getString(2));
			d.setQualification(rs.getString(3));
			d.setSpecialisation(rs.getString(4));
			d.setEmail(rs.getString(5));
			d.setMobileNo(rs.getString(6));
			d.setPassword(rs.getString(7));
			
			doc.add(d);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return doc;
	}
	
	public Doctor getDoctorbyId(int id){
		Doctor d = null;
		try {
		String query = "select * from doctor_details where id=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			d = new Doctor();
			d.setId(rs.getInt(1));
			d.setFullName(rs.getString(2));
			d.setQualification(rs.getString(3));
			d.setSpecialisation(rs.getString(4));
			d.setEmail(rs.getString(5));
			d.setMobileNo(rs.getString(6));
			d.setPassword(rs.getString(7));
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f = false;
		try {
			String query = "update doctor_details set fullName=?,qualification=?,specialisation=?,email=?,mobileNo=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,d.getFullName());
			ps.setString(2, d.getQualification());
			ps.setString(3,d.getSpecialisation());
			ps.setString(4,d.getEmail());
			ps.setString(5,d.getMobileNo());
			ps.setString(6, d.getPassword());
			ps.setInt(7,d.getId());
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String query = "delete from doctor_details where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
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
	public Doctor Login(String email,String password) {
		Doctor d= null;
		
		try {
			String query = "select * from doctor_details where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setQualification(rs.getString(3));
				d.setSpecialisation(rs.getString(4));
				d.setEmail(rs.getString(5));
				d.setMobileNo(rs.getString(6));
				d.setPassword(rs.getString(7));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	}
}
