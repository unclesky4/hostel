package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.StudentDao;
import org.hostel.entity.Student;
import org.hostel.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:14:56 PM
*
*/

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;
	
	@Override
	@Transactional
	public int saveStudent(Integer stuNumber, String name, String phone, Integer sex, String major, Integer year,
			Integer classNum, Integer dormitoryId) {
		return studentDao.saveStudent(stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
	}

	@Override
	@Transactional
	public int updateStudent(Integer stuId, Integer stuNumber, String name, String phone, Integer sex, String major,
			Integer year, Integer classNum, Integer dormitoryId) {
		return studentDao.updateStudent(stuId, stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
	}

	@Override
	@Transactional
	public int deleteStudent(Integer stuId) {
		return studentDao.deleteStudent(stuId);
	}

	@Override
	public Student getById(Integer stuId) {
		return studentDao.getById(stuId);
	}

	@Override
	public Student getByStuNumber(Integer stuNumber) {
		return studentDao.getByStuNumber(stuNumber);
	}

	@Override
	public List<Student> queryByDormitoryId(Integer dormitoryId) {
		return studentDao.queryByDormitoryId(dormitoryId);
	}

}
