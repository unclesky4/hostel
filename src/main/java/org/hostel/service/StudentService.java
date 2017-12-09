package org.hostel.service;

import java.util.List;

import org.hostel.entity.Student;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:14:07 PM
*
*/

public interface StudentService {

	/**
	 * 保存学生
	 * @param stuNumber - 学号
	 * @param name - 姓名
	 * @param phone - 电话号码
	 * @param sex - 性别  0：男 1：女
	 * @param major - 学院专业
	 * @param year - 入学年份
	 * @param classNum - 班级
	 * @param dormitoryId - 宿舍主键
	 * @return
	 */
	int saveStudent(Integer stuNumber, String name, String phone,Integer sex,
			String major,Integer year,Integer classNum, Integer dormitoryId);
	
	/**
	 * 
	 * @param stuId - 学生主键
	 * @param stuNumber - 学号
	 * @param name - 姓名
	 * @param phone - 电话号码
	 * @param sex - 性别  0：男 1：女
	 * @param major - 学院专业
	 * @param year - 入学年份
	 * @param classNum - 班级
	 * @param dormitoryId - 宿舍主键
	 * @return
	 */
	int updateStudent(Long stuId,Integer stuNumber, String name,String phone,Integer sex,
			String major,Integer year,Integer classNum, Integer dormitoryId);
	
	
	/**
	 * 删除学生
	 * @param stuId - 学生主键
	 * @return
	 */
	int deleteStudent(Long stuId);
	
	/**
	 * 通过主键查询学生
	 * @param stuId - 学生主键
	 * @return
	 */
	Student getById(Long stuId);
	
	/**
	 * 通过学号查询学生
	 * @param stuNumber
	 * @return
	 */
	Student getByStuNumber(Integer stuNumber);

	/**
	 * 通过某个宿舍已入住学生
	 * @param dormitoryId
	 * @return
	 */
	List<Student> queryByDormitoryId(Integer dormitoryId);
	
	/**
	 * 通过某栋宿舍楼的所有入住学生
	 * @param buildingId - 宿舍楼主键
	 * @return
	 */
	List<Student> queryByBuildingId(Integer buildingId);
}
