package org.hostel.entity;

import java.sql.Date;

/**
* 学生
* @author unclesky4
* @date Oct 19, 2017 9:25:02 PM
*
*/

public class Student {
	
	private Integer stuId;
	
	//学生学号
	private Integer stuNumber;
	
	private String name;
	
	private String phone;
	
	//性别 0:男 1：女
	private Integer sex;
	
	//专业
	private String major;
	
	//入学年份
	private Integer year;
	
	//班级
	private Integer classNum;
	
	private Date createTime;
	
	private boolean active;
	
	private Dormitory dormitory;
	
	public Student() {}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getStuNumber() {
		return stuNumber;
	}

	public void setStuNumber(Integer stuNumber) {
		this.stuNumber = stuNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getClassNum() {
		return classNum;
	}

	public void setClassNum(Integer classNum) {
		this.classNum = classNum;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Dormitory getDormitory() {
		return dormitory;
	}

	public void setDormitory(Dormitory dormitory) {
		this.dormitory = dormitory;
	}

}
