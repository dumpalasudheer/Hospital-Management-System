package com.entity;

public class Doctor {
	private int id;
	private String fullName;
	private String qualification;
	private String specialisation;
	private String email;
	private String mobileNo;
	private String password;
	
	public Doctor() {
		super();
	}

	public Doctor(String fullName, String qualification, String specialisation, String email, String mobileNo,
			String password) {
		super();
		this.fullName = fullName;
		this.qualification = qualification;
		this.specialisation = specialisation;
		this.email = email;
		this.mobileNo = mobileNo;
		this.password = password;
	}
	
	 

	public Doctor(int id, String fullName, String qualification, String specialisation, String email, String mobileNo,
			String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.qualification = qualification;
		this.specialisation = specialisation;
		this.email = email;
		this.mobileNo = mobileNo;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialisation() {
		return specialisation;
	}

	public void setSpecialisation(String specialisation) {
		this.specialisation = specialisation;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
