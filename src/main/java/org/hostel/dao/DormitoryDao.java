package org.hostel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hostel.entity.Dormitory;

/**
* 宿舍 dao接口
* @author unclesky4
* @date Nov 5, 2017 9:12:05 PM
*
*/

public interface DormitoryDao {
	
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
	 * @param buildingId
	 * @param dormitoryNumber
	 * @return
	 */
	Integer findDormitoryNumber(@Param("buildingId") Integer buildingId, @Param("dormitoryNumber") Integer dormitoryNumber);
	
	/**
	 * 查询所有宿舍记录  ---- 可以放弃该接口
	 * @param start
	 * @param pageSize
	 * @param order
	 * @return
	 */
	List<Dormitory> queryAllDormitory(@Param("start") Integer start, @Param("pageSize") Integer pageSize, 
			@Param("order") String order);
	
	/**
	 * 通过主键查询宿舍
	 * @param dormitoryId
	 * @return
	 */
	Dormitory getById(@Param("dormitoryId") Integer dormitoryId);
	
	/**
	 * 更新宿舍信息
	 * @param dormitoryId - 宿舍主键
	 * @param dormitoryNumber - 宿舍门号
	 * @param totals - 已住人数
	 * @param buildingId - 宿舍楼主键
	 * @return
	 */
	Integer updateDormitory(@Param("dormitoryId")Integer dormitoryId, @Param("dormitoryNumber")Integer dormitoryNumber,@Param("totals")Integer totals,
			@Param("buildingId")Integer buildingId);

}
