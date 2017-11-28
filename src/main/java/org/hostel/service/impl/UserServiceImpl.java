package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.UserDao;
import org.hostel.entity.User;
import org.hostel.exception.ValueDuplicateException;
import org.hostel.service.UserService;
import org.hostel.utils.MD5Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
*
* @author unclesky4
* @date Oct 21, 2017 3:07:18 PM
*
*/

@Service
public class UserServiceImpl implements UserService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserDao userDaoMapper;

	@Override
	@Transactional
	public int addUser(String userName, String userPwd, Short userSex, String userPhone, Integer roleId) throws
		ValueDuplicateException, RuntimeException{
		try {
			//判断用户名是否存在
			User user = userDaoMapper.getByName(userName);
			if(user != null) {
				throw new ValueDuplicateException("用户名已存在");
			}
			//密码加密
			if(userPwd != null && userPwd != null) {
				userPwd = MD5Util.Encrypt(userPwd);
			}
			return userDaoMapper.saveUser(userName, userPwd, userSex, userPhone, roleId);
		} catch (ValueDuplicateException e) {
			logger.error(e.getMessage(),e);
			throw e;
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			throw new RuntimeException(e1.getMessage());
		}
	}

	@Override
	@Transactional
	public int updateUser(Integer userId, String userName, String userPwd, Short userSex, String userPhone,
			Short userState, Integer roleId) throws RuntimeException{
		try {
			if( userPwd!=null && userPwd != "") {
				userPwd = MD5Util.Encrypt(userPwd);
			}
			return userDaoMapper.updateUser(userId, userName, userPwd, userSex, userPhone, userState, roleId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public User getUserById(Integer userId) {
		return userDaoMapper.getUserById(userId);
	}

	@Override
	public List<User> getAllUser() {
		return userDaoMapper.queryAllUser();
	}

	@Override
	public User login(String username, String pwd) {
		pwd = MD5Util.Encrypt(pwd);
		return userDaoMapper.login(username, pwd);
	}

}
