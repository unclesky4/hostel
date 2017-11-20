package org.hostel.dao;

import java.util.List;

import org.hostel.entity.Role;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;

/**
*
* @author unclesky4
* @date Oct 21, 2017 9:59:00 PM
*
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class RoleDaoTest {
	
	@Autowired
	private RoleDao roleDao;

	@Test
	public void testQueryAllRole() {
		System.out.println("===========");
		List<Role> roles = roleDao.queryAllRole();
		for(Role role : roles) {
			System.out.println(role.getSymbol());
		}
		System.out.println(new Gson().toJson(roles));
	}

	@Test
	public void testGetById() {
		Role role = roleDao.getById(101);
		System.out.println(role.getSymbol());
		System.out.println(new Gson().toJson(role));
	}

}
