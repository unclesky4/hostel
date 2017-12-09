package org.hostel.entity;

import java.util.List;

/**
* 宿舍
* @author unclesky4
* @date Oct 20, 2017 9:25:37 PM
*
*/

public class Dormitory {
	
	private Integer dormitoryId;
	
	private Integer dormitoryNumber;
	
	private Integer totals;
	
	private boolean active;
	
	private Building building;
	
	private List<Student> students;
	
	public Dormitory() {}

	public Integer getDormitoryId() {
		return dormitoryId;
	}

	public void setDormitoryId(Integer dormitoryId) {
		this.dormitoryId = dormitoryId;
	}

	public Integer getDormitoryNumber() {
		return dormitoryNumber;
	}

	public void setDormitoryNumber(Integer dormitoryNumber) {
		this.dormitoryNumber = dormitoryNumber;
	}

	public Integer getTotals() {
		return totals;
	}

	public void setTotals(Integer totals) {
		this.totals = totals;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

}
