package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.BuildingDao;
import org.hostel.entity.Building;
import org.hostel.exception.ValueDuplicateException;
import org.hostel.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:04:38 PM
*
*/

@Service
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingDao buildingDao;
	
	@Override
	public List<Building> queryAllBuilding() {
		return buildingDao.queryAllBuilding();
	}

	@Override
	public Building getById(Integer buildingId) {
		return buildingDao.getById(buildingId);
	}

	@Override
	@Transactional
	public int saveBuilding(String buildingName, Integer floors, Integer rooms, Integer lives) throws ValueDuplicateException{
		if(buildingDao.getByName(buildingName) != null) {
			throw new ValueDuplicateException("宿舍楼名称已存在");
		}
		return buildingDao.saveBuilding(buildingName, floors, rooms, lives);
	}

	@Override
	@Transactional
	public int updateBuilding(Integer buildingId, String buildingName, Integer floors, Integer rooms, Integer lives) 
			throws ValueDuplicateException{
		return buildingDao.updateBuilding(buildingId, buildingName, floors, rooms, lives);
	}

	@Override
	@Transactional
	public int deleteBuilding(Integer buildingId) throws RuntimeException{
		//宿舍楼有正在使用的宿舍时不能删除
		if (buildingDao.getById(buildingId).getDormitories().size() > 0) {
			throw new RuntimeException("不能删除该宿舍楼");
		}
		return buildingDao.deleteBuilding(buildingId);
	}

}
