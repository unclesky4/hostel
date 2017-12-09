package org.hostel.service.impl;

import static org.junit.Assert.fail;

import org.hostel.exception.ObjectNotExistsException;
import org.hostel.service.StudentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
*
* @author unclesky4
* @date Dec 8, 2017 7:17:06 PM
*
*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class StudentServiceImplTest {
	
	@Autowired
	private StudentService studentService;

	@Test
	public void testSaveStudent() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateStudent() {
		try {
			studentService.saveStudent(141110188, "dsjkhf", "18814383363", 0, "", 2014, 1404, 2000);
		} catch (ObjectNotExistsException e) {
			System.out.println(e.getMessage());
		}
	}

	@Test
	public void testDeleteStudent() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetById() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetByStuNumber() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryByDormitoryId() {
		fail("Not yet implemented");
	}

}
