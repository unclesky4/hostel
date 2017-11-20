package org.hostel.service;

import java.util.List;

import org.hostel.entity.User;

/**
*
* @author unclesky4
* @date Oct 21, 2017 2:58:52 PM
*
*/

public interface UserService {
	
	/**
	 * 添加用户
	 * @param userName
	 * @param userPwd
	 * @param userSex
	 * @param userPhone
	 * @param roleId
	 * @return
	 */
	int addUser(String userName,String userPwd, Short userSex, String userPhone, Integer roleId);
	
	/**
	 * 更新用户信息
	 * @param userId
	 * @param userName
	 * @param userPwd
	 * @param userSex
	 * @param userPhone
	 * @param userState
	 * @param roleId
	 * @return
	 */
	int updateUser(Integer userId, String userName, String userPwd, Short userSex, String userPhone, 
			Short userState, Integer roleId);
	
	/**
	 * 通过主键查询用户
	 * @param userId
	 * @return
	 */
	User getUserById(Integer userId);
	
	
	/**
	 * 查询所有用户信息
	 * @return
	 */
	List<User> getAllUser();

	/**
	 * 登陆
	 * @param username
	 * @param pwd
	 * @return
	 */
	User login(String username, String pwd);
}
