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
	int saveDormitory(Integer dormitoryNumber, Integer buildingId);
	
	/**
	 * 删除宿舍
	 * @param dormitoryId
	 * @return
	 */
	int deleteDormitory(Integer dormitoryId);
	
	/**
	 * 用于判断宿舍门号是否存在
	 * @param buildingId
	 * @param dormitoryNumber
	 * @return
	 */
	Integer findDormitoryNumber(Integer buildingId, Integer dormitoryNumber);
	
	
	/**
	 * 查询所有宿舍--服务器分页
	 * @param start
	 * @param pageSize
	 * @param order
	 * @return
	 */
	List<Dormitory> queryAllDormitory(Integer start, Integer pageSize, 
			@Param("order") String order);
	
	/**
	 * 通过主键查询宿舍
	 * @param dormitoryId
	 * @return
	 */
	Dormitory getById(Integer dormitoryId);
	
	/**
	 * 更新宿舍信息 - 不修改宿舍楼外键
	 * @param dormitoryId - 宿舍主键
	 * @param dormitoryNumber - 宿舍门号
	 * @param totals - 已住人数
	 * @return
	 */
	Integer update(Integer dormitoryId, Integer dormitoryNumber,Integer totals);
}
