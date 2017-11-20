package org.hostel.service;

import java.util.List;

import org.hostel.entity.Role;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:11:51 PM
*
*/

public interface RoleService {

	/**
	 * 
	 * 获取所有角色信息
	 * @return
	 */
	List<Role> queryAllRole();
	
	/**
	 * 通过主键查找角色信息
	 * @param roleId
	 * @return
	 */
	Role getById(Integer roleId);
}
