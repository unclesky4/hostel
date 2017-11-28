package org.hostel.entity;

import java.util.List;

/**
* 角色
* @author unclesky4
* @date Oct 21, 2017 12:53:05 PM
*
*/

public class Role {
	
	private Integer roleId;
	
	private String symbol;  //对应RoleEnum的symbol字段
	
	private String description;
	
	private List<User> users;
	
	public Role() {}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "[roleId=" + roleId + ", symbol=" + symbol + ", description=" + description + "]";
	}

}
