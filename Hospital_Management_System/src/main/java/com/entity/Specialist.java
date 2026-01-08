package com.entity;

public class Specialist {
	private int id;
	private String SpecialistName;
	
	public Specialist() {
		super();
	}

	public Specialist(int id, String specialistName) {
		super();
		this.id = id;
		SpecialistName = specialistName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return SpecialistName;
	}

	public void setSpecialistName(String specialistName) {
		SpecialistName = specialistName;
	}
	
}
