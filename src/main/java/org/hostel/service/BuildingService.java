package org.hostel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hostel.entity.Building;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:02:02 PM
*
*/

public interface BuildingService {
	/**
	 * 查询所有宿舍楼信息
	 * @return
	 */
	List<Building> queryAllBuilding();
	
	/**
	 * 通过主键查询宿舍楼
	 * @param buildingId - 宿舍楼主键
	 * @return
	 */
	Building getById(Integer buildingId);
	
	/**
	 * 添加宿舍楼
	 * @param buildingName - 宿舍楼名称
	 * @param floors - 多少层
	 * @param rooms - 每层多少间
	 * @param lives - 每间住多少人
	 * @return - 影响的行数
	 */
	int saveBuilding(String buildingName, Integer floors, Integer rooms, 
			@Param("lives")Integer lives);
	
	/**
	 * 更新宿舍楼
	 * @param buildingId
	 * @param buildingName
	 * @param floors
	 * @param rooms
	 * @param lives
	 * @return
	 */
	int updateBuilding(Integer buildingId, String buildingName, Integer floors, Integer rooms, Integer lives);
	
	/**
	 * 删除宿舍楼
	 * @param buildingId
	 * @return
	 */
	int deleteBuilding(Integer buildingId);
}
