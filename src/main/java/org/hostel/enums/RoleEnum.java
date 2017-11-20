package org.hostel.enums;

/**
* 角色类型
* @author unclesky4
* @date Oct 19, 2017 8:23:46 PM
*
*/

public enum RoleEnum {
	ROOT("root","超级管理员","具有角色指派，修改密码的权限，包括ADMIN角色的权限"),
	ADMIN("administrator","管理员","具有对数据增删改查的权限"),
	GUEST("guest","来宾","只有查看数据的权限");
	
	private String symbol;
	
	private String roleName;
	
	private String description;
	
	RoleEnum(String symbol, String roleName, String description) {
		this.symbol = symbol;
		this.roleName = roleName;
		this.description = description;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * 通过symbol值获取也一个RoleEnum对象
	 * @param symbol
	 * @return
	 */
	public static RoleEnum getBySymbol(String symbol) {
		switch (symbol) {
		case "root":
			return RoleEnum.ROOT;
		case "administrator":
			return RoleEnum.ADMIN;
		case "guest":
			return RoleEnum.GUEST;
		default:
			return null;
		}
	}

}
