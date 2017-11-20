package org.hostel.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;

/**
*
* @author unclesky4
* @date Nov 5, 2017 11:03:35 PM
*
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class DormitoryDaoTest {
	
	@Autowired
	private DormitoryDao dormitoryDao;
	
	Gson gson = new Gson();

	@Test
	public void testSaveDormitory() {
		System.out.println(dormitoryDao.saveDormitory(1002, 1000));
	}

	@Test
	public void testDeleteDormitory() {
		System.out.println(dormitoryDao.deleteDormitory(1002));
	}

	@Test
	public void testFindDormitoryNumber() {
		Integer aInteger= dormitoryDao.findDormitoryNumber(314);
		System.out.println("------------------");
		System.out.println(aInteger);
	}

	@Test
	public void testQueryAllDormitory() {
		System.out.println(gson.toJson(dormitoryDao.queryAllDormitory(0, 10, "desc")));
	}

	@Test
	public void testGetById() {
		System.out.println(gson.toJson(dormitoryDao.getById(1000)));
	}

}
