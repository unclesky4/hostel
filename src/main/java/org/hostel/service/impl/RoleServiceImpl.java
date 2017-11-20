package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.RoleDao;
import org.hostel.entity.Role;
import org.hostel.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:12:44 PM
*
*/
@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;

	@Override
	public List<Role> queryAllRole() {
		return roleDao.queryAllRole();
	}

	@Override
	public Role getById(Integer roleId) {
		return roleDao.getById(roleId);
	}

}
