package org.hostel.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;

/**
*
* @author unclesky4
* @date Nov 6, 2017 9:14:32 PM
*
*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class StudentDaoTest {
	
	@Autowired
	private StudentDao studentDao;
	
	Gson gson = new Gson();

	@Test
	public void testSaveStudent() {
		System.out.println(studentDao.saveStudent(141110188, "黄志标", "141110188", 0, "计算机", 2014, 1404, 1000));
	}

	@Test
	public void testUpdateStudent() {
		System.out.println(studentDao.updateStudent(1002, 141110188, "黄志标", "141110188", 0, "计算机学院", 2014, 1404, null));
	}

	@Test
	public void testDeleteStudent() {
		System.out.println(studentDao.deleteStudent(1000));
	}

	@Test
	public void testGetById() {
		System.out.println(gson.toJson(studentDao.getById(1001)));
	}

	@Test
	public void testGetByStuNumber() {
		System.out.println(gson.toJson(studentDao.getByStuNumber(141110188)));
	}

	@Test
	public void testQueryByDormitoryId() {
		System.out.println(gson.toJson(studentDao.queryByDormitoryId(1000)));
	}

}
