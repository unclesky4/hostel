package org.hostel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hostel.entity.Dormitory;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:07:38 PM
*
*/

public interface DormitoryService {
	
	/**
	 * 保存一个宿舍
	 * @param dormitoryNumber
	 * @param buildingId
	 * @return
	 */
	int saveDormitory(@Param("dormitoryNumber") Integer dormitoryNumber, @Param("buildingId") Integer buildingId);
	
	/**
	 * 删除宿舍
	 * @param dormitoryId
	 * @return
	 */
	int deleteDormitory(@Param("dormitoryId") Integer dormitoryId);
	
	/**
	 * 用于判断宿舍门号是否存在
	 * @param dormitoryNumber
	 * @return
	 */
	Integer findDormitoryNumber(@Param("dormitoryNumber") Integer dormitoryNumber);
	
	
	List<Dormitory> queryAllDormitory(@Param("start") Integer start, @Param("pageSize") Integer pageSize, 
			@Param("order") String order);
	
	/**
	 * 通过主键查询宿舍 ---- 可以放弃该接口
	 * @param dormitoryId
	 * @return
	 */
	Dormitory getById(@Param("dormitoryId") Integer dormitoryId);
}
