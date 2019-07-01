package com.uncc.internship.model;

import java.io.Serializable;

public class Application implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;
	/**
	 * `ApplicationID` VARCHAR(15) NOT NULL, `HireOrNot` int NOT NULL DEFAULT 3,
	 * `StudentID` VARCHAR(15) NOT NULL, `InternshipID` VARCHAR(15) NOT NULL,
	 */
	private String applicationID;
	private String studentID;
	private String internshipID;
	private int HireOrNot;

	public String getApplicationID() {
		return applicationID;
	}

	public void setApplicationID(String applicationID) {
		this.applicationID = applicationID;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getInternshipID() {
		return internshipID;
	}

	public void setInternshipID(String internshipID) {
		this.internshipID = internshipID;
	}

	public int getHireOrNot() {
		return HireOrNot;
	}

	public void setHireOrNot(int hireOrNot) {
		HireOrNot = hireOrNot;
	}


}
