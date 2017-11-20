package org.hostel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	int saveStudent(@Param("stuNumber")Integer stuNumber, @Param("name")String name, @Param("phone")String phone,@Param("sex")Integer sex,
			@Param("major") String major,@Param("year")Integer year,@Param("classNum")Integer classNum, @Param("dormitoryId")Integer dormitoryId);
	
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
	int updateStudent(@Param("stuId")Integer stuId,@Param("stuNumber")Integer stuNumber, @Param("name")String name, @Param("phone")String phone,@Param("sex")Integer sex,
			@Param("major") String major,@Param("year")Integer year,@Param("classNum")Integer classNum, @Param("dormitoryId")Integer dormitoryId);
	
	
	/**
	 * 删除学生
	 * @param stuId - 学生主键
	 * @return
	 */
	int deleteStudent(@Param("stuId")Integer stuId);
	
	/**
	 * 通过主键查询学生
	 * @param stuId - 学生主键
	 * @return
	 */
	Student getById(@Param("stuId")Integer stuId);
	
	/**
	 * 通过学号查询学生
	 * @param stuNumber
	 * @return
	 */
	Student getByStuNumber(@Param("stuNumber")Integer stuNumber);

	/**
	 * 通过某个宿舍已入住学生
	 * @param dormitoryId
	 * @return
	 */
	List<Student> queryByDormitoryId(@Param("dormitoryId")Integer dormitoryId);
}
