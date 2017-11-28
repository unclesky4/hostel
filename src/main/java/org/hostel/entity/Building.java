package org.hostel.entity;

import java.sql.Date;
import java.util.List;

/**
* 宿舍楼
* @author unclesky4
* @date Oct 19, 2017 9:02:40 PM
*
*/

public class Building {
	
	private Integer buildingId;
	
	//名称
	private String buildingName;
	
	//多少层
	private Integer floors;
	
	//每层多少间
	private Integer rooms;
	
	//每间宿舍住多少人
	private Integer lives;
	
	private Date createTime;
	
	//是否软删除 true：否
	private boolean active;
	
	private List<Dormitory> dormitories;
	
	public Building() {};

	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildiingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public Integer getFloors() {
		return floors;
	}

	public void setFloors(Integer floors) {
		this.floors = floors;
	}

	public Integer getRooms() {
		return rooms;
	}

	public void setRooms(Integer rooms) {
		this.rooms = rooms;
	}

	public Integer getLives() {
		return lives;
	}

	public void setLives(Integer lives) {
		this.lives = lives;
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

	public List<Dormitory> getDormitories() {
		return dormitories;
	}

	public void setDormitories(List<Dormitory> dormitories) {
		this.dormitories = dormitories;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

}
