package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.BuildingDao;
import org.hostel.dao.DormitoryDao;
import org.hostel.entity.Building;
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
	
	@Autowired
	private BuildingDao buildingDao;
	
	@Override
	@Transactional
	public int saveDormitory(Integer dormitoryNumber, Integer buildingId) {
		return dormitoryDao.saveDormitory(dormitoryNumber, buildingId);
	}

	@Override
	@Transactional
	public int deleteDormitory(Integer dormitoryId) throws RuntimeException{
		Dormitory dormitory = dormitoryDao.getById(dormitoryId);
		if(dormitory.getStudents().size() > 0) {
			throw new RuntimeException("不能删除该宿舍");
		}
		return dormitoryDao.deleteDormitory(dormitoryId);
	}

	@Override
	public Integer findDormitoryNumber(Integer buildingId,Integer dormitoryNumber) {
		return dormitoryDao.findDormitoryNumber(buildingId, dormitoryNumber);
	}

	//（暂时放弃该接口）
	@Override
	public List<Dormitory> queryAllDormitory(Integer start, Integer pageSize, String order) {
		return dormitoryDao.queryAllDormitory(start, pageSize, order);
	}

	@Override
	public Dormitory getById(Integer dormitoryId) {
		return dormitoryDao.getById(dormitoryId);
	}

	@Override
	public Integer update(Integer dormitoryId, Integer dormitoryNumber, Integer totals) throws RuntimeException{
		Dormitory dormitory = dormitoryDao.getById(dormitoryId);
		Building building = dormitory.getBuilding();
		if(building == null) {
			throw new RuntimeException("关联的宿舍楼不存在");
		}
		List<Dormitory> list = buildingDao.getById(building.getBuildingId()).getDormitories();
		for(Dormitory dormitory2 : list) {
			if(dormitory2.getDormitoryNumber() == dormitoryNumber && dormitory.getDormitoryId() != dormitory2.getDormitoryId()) {
				throw new RuntimeException("宿舍门号不能重复");
			}
		}
		return dormitoryDao.updateDormitory(dormitoryId, dormitoryNumber, totals, null);
	}

}
