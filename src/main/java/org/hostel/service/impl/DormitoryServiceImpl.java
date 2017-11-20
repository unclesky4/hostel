package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.DormitoryDao;
import org.hostel.entity.Dormitory;
import org.hostel.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:08:21 PM
*
*/

@Service
public class DormitoryServiceImpl implements DormitoryService {

	@Autowired
	private DormitoryDao dormitoryDao;
	
	@Override
	@Transactional
	public int saveDormitory(Integer dormitoryNumber, Integer buildingId) {
		return dormitoryDao.saveDormitory(dormitoryNumber, buildingId);
	}

	@Override
	@Transactional
	public int deleteDormitory(Integer dormitoryId) {
		return dormitoryDao.deleteDormitory(dormitoryId);
	}

	@Override
	public Integer findDormitoryNumber(Integer dormitoryNumber) {
		return dormitoryDao.findDormitoryNumber(dormitoryNumber);
	}

	@Override
	public List<Dormitory> queryAllDormitory(Integer start, Integer pageSize, String order) {
		return dormitoryDao.queryAllDormitory(start, pageSize, order);
	}

	@Override
	public Dormitory getById(Integer dormitoryId) {
		return dormitoryDao.getById(dormitoryId);
	}

}
