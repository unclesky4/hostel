package org.hostel.dao;

import java.util.List;

import org.hostel.entity.Role;

/**
*
* @author unclesky4
* @date Oct 21, 2017 9:43:28 PM
*
*/

public interface RoleDao {
	
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
