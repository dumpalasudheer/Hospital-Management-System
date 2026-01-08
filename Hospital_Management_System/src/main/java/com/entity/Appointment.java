package com.entity;

public class Appointment {
	private int id;
	private int userId;
	private String name;
	private String age;
	private String email;
	private String gender;
	private String appointDate;
	private String disease;
	private int doctId;
	private String phnNno;
	private String address;
	private String status;

	public Appointment() {
		super();
	}

	public Appointment(int userId,  String name, String age, String email, String gender, String appointDate,
			String disease, int doctId, String phnNno, String address, String status) {
		super();
		this.userId = userId;
		this.name = name;
		this.age = age;
		this.email = email;
		this.gender = gender;
		this.appointDate = appointDate;
		this.disease = disease;
		this.doctId = doctId;
		this.phnNno = phnNno;
		this.address = address;
		this.status = status;
	}
	
	public Appointment(int doctId,String status) {
		super();
		this.doctId = doctId;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAppointDate() {
		return appointDate;
	}

	public void setAppointDate(String appointDate) {
		this.appointDate = appointDate;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public int getDoctId() {
		return doctId;
	}

	public void setDoctId(int doctId) {
		this.doctId = doctId;
	}

	public String getPhnNno() {
		return phnNno;
	}

	public void setPhnNno(String phnNno) {
		this.phnNno = phnNno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
