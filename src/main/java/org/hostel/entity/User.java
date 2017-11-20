package org.hostel.entity;

import java.sql.Date;

/**
* 用户
* @author unclesky4
* @date Oct 19, 2017 8:45:09 PM
*
*/

public class User {

	private Integer userId;
	
	private String userName;
	
	private String userPwd;
	
	//性别  0：男 1：女
	private Short userSex;
	
	private String userPhone;
	
	private Date createTime;
	
	//是否显示
	private boolean active;
	
	//审核状态  0：待审核， 1:审核通过  -1：审核不通过
	private short userState;
	
	private Role role;
	
	public User() {}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Short getUserSex() {
		return userSex;
	}

	public void setUserSex(Short userSex) {
		this.userSex = userSex;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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

	public short getUserState() {
		return userState;
	}

	public void setUserState(short userState) {
		this.userState = userState;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "[userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userSex=" + userSex
				+ ", userPhone=" + userPhone + ", createTime=" + createTime + ", active=" + active + ", userState="
				+ userState + "]";
	}
}
