package org.hostel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hostel.entity.User;

/**
* 用户接口
* @author unclesky4
* @date Oct 20, 2017 10:12:55 PM
*
*/

public interface UserDao {
	
	/**
	 * 用户注册
	 * @param userName
	 * @param userPwd
	 * @param userSex
	 * @param userPhone
	 * @param roleId
	 * @return
	 */
	int saveUser(@Param("userName") String userName, @Param("userPwd") String userPwd, @Param("userSex") Short userSex, 
			@Param("userPhone") String userPhone, @Param("roleId") Integer roleId);
	
	/**
	 * 更新用户
	 * @param userId - 用户主键
	 * @param userName - 用户名
	 * @param userPwd - 密码
	 * @param userSex - 性别 0：男 1：女
	 * @param userPhone - 电话号码
	 * @param userState - 审核状态
	 * @param roleId - 角色主键
	 * @return
	 */
	int updateUser(@Param("userId") Integer userId, @Param("userName") String userName, @Param("userPwd") String userPwd, @Param("userSex") Short userSex, 
			@Param("userPhone") String userPhone, @Param("userState") Short userState, @Param("roleId") Integer roleId);
	
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	int deleteUser(Integer userId);
	
	/**
	 * 通过主键查询用户
	 * @param userId
	 * @return
	 */
	User getUserById(Integer userId);
	
	/**
	 * 查询所有用户 active: true
	 * @return
	 */
	List<User> queryAllUser();
	
	/**
	 * 通过用户名查询User
	 * @param userName
	 * @return
	 */
	User getByName(@Param("userName")String userName);
	
	/**
	 * 用户登陆
	 * @param userName
	 * @param password
	 * @return
	 */
	User login(@Param("userName")String userName, @Param("password")String password);

}
