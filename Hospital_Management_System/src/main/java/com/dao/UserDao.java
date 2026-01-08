package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(User u) {
		boolean b = false;
		try {
			String query = "insert into user_details(full_name,email,password) values (?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, u.getFull_name());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public User Login(String em,String psw) {
		User u = null;
		try {
		String sqlQuery = "select * from user_details where email = ? and password = ?";
		PreparedStatement ps = conn.prepareStatement(sqlQuery);
		ps.setString(1, em);
		ps.setString(2, psw);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			u = new User();
			u.setId(rs.getInt(1));
			u.setFull_name(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPassword(rs.getString(4));
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public List<User> getAllUsers(){
		User u =null;
		List<User> lst = new ArrayList<User>();
		try {
			String query = "select * from user_details";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt("id"));
	            u.setFull_name(rs.getString("full_name"));
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password"));
				lst.add(u);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return lst;
	}
}
