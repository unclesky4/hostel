package org.hostel.dao;

import java.util.List;

import org.hostel.entity.Building;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;

/**
*
* @author unclesky4
* @date Oct 22, 2017 10:26:21 PM
*
*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class BuildingDaoTest {
	
	@Autowired
	private BuildingDao buildingDao;
	
	Gson gson = new Gson();

	@Test
	public void testQueryAllBuilding() {
		List<Building> buildings = buildingDao.queryAllBuilding();
		System.out.println(buildings.size());
		System.out.println(gson.toJson(buildings));
	}

	@Test
	public void testGetById() {
		Building building = buildingDao.getById(1000);
		System.out.println(building==null);
		System.out.println(gson.toJson(building));
	}

	@Test
	public void testSaveBuilding() {
		int count = buildingDao.saveBuilding("中区2栋", 7, 10, 6);
		if(count>0) {
			System.out.println("添加成功");
		}else {
			System.out.println("添加失败");
		}
	}

	@Test
	public void testUpdateBuilding() {
		int count = buildingDao.updateBuilding(1002, null, null, 10,null);
		if(count>0) {
			System.out.println("更新成功");
		}else {
			System.out.println("更新失败");
		}
	}
	
	@Test
	public void testDeleteBuilding() {
		int count = buildingDao.deleteBuilding(1002);
		if(count>0) {
			System.out.println("删除成功");
		}else {
			System.out.println("删除失败");
		}
	}
	
	@Test
	public void testGetByName() {
		Building building = buildingDao.getByName("南区二栋");
		System.out.println(building==null);
		System.out.println(gson.toJson(building));
	}

}
