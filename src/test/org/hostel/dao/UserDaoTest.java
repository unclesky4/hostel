package org.hostel.dao;

import java.util.List;

import org.hostel.entity.User;
import org.hostel.utils.MD5Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;

/**
*
* @author unclesky4
* @date Oct 21, 2017 9:24:12 PM
*
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserDaoTest {

	@Autowired
	private UserDao userDao;

	@Test
	public void testSaveUser() {
		String pwd = MD5Util.Encrypt("huangzhibiao");
		int count = userDao.saveUser("zhibiao", pwd, (short) 0, "18814383363", 101);
		System.out.println(count);
		if(count > 0) {
			System.out.println("添加成功");
		}else {
			System.out.println("添加失败");
		}
	}

	@Test
	public void testUpdateUser() {
		int count = userDao.updateUser(1001, "标", null, null, null, null, null);
		System.out.println(count);
		if(count > 0) {
			System.out.println("更新成功");
		}else {
			System.out.println("更新失败");
		}
	}
	
	@Test
	public void testDeleteUser() {
		int count = userDao.deleteUser(1003);
		System.out.println(count);
		if(count > 0) {
			System.out.println("删除成功");
		}else {
			System.out.println("删除失败");
		}
	}

	@Test
	public void testGetUserById() {
		User user = userDao.getUserById(1002);
		if(user == null) {
			System.out.println("查询信息不存在");
		}else {
			System.out.println(user.toString());
		//	System.out.println(user.getRole().toString());
			System.out.println(new Gson().toJson(user));
		}
	}

	@Test
	public void testQueryAllUser() {
		System.out.println("=========================");
		List<User> users = userDao.queryAllUser();
		System.out.println(users.size());
		for (User user : users) {
			System.out.println(user.toString());
		//	System.out.println(user.getRole()==null);
		}
		
		Gson gson = new Gson();
		System.out.println(gson.toJson(users));
	}
	
	@Test
	public void testGetByName() {
		User user = userDao.getByName("uncle");
		if(user != null) {
			System.out.println(new Gson().toJson(user));
		}else{
			System.out.println("对象不存在");
		}
	}
	
	@Test
	public void testLogin() {
		User user = userDao.login("uncle", "980aa49b5ffa705c408abcdee3861340");
		if(user != null) {
			System.out.println(new Gson().toJson(user));
		}else{
			System.out.println("对象不存在");
		}
	}
}
