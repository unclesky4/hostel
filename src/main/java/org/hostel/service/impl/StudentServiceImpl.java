package org.hostel.service.impl;

import java.util.List;

import org.hostel.dao.DormitoryDao;
import org.hostel.dao.StudentDao;
import org.hostel.entity.Building;
import org.hostel.entity.Dormitory;
import org.hostel.entity.Student;
import org.hostel.exception.ObjectNotExistsException;
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
	
	@Autowired
	private DormitoryDao dormitoryDao;
	
	@Override
	@Transactional
	public int saveStudent(Integer stuNumber, String name, String phone, Integer sex, String major, Integer year,
			Integer classNum, Integer dormitoryId) throws RuntimeException, ObjectNotExistsException{
		
		try {
			Dormitory dormitory = dormitoryDao.getById(dormitoryId);
			if(dormitory == null) {
				throw new ObjectNotExistsException("宿舍对象不存在");
			}
			if(studentDao.getByStuNumber(stuNumber) != null) {
				throw new RuntimeException("学号重复");
			}
			if (dormitory.getTotals() >= dormitory.getBuilding().getLives()) {
				throw new RuntimeException("保存失败，该宿舍入住学生已满");
			}
			int count = studentDao.saveStudent(stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
			if(count < 1) {
				return 0;
			}
			int totals = dormitory.getTotals();
			totals++;
			dormitory.setTotals(totals);
			count = dormitoryDao.updateDormitory(dormitoryId, null, totals, null);
			if(count < 1) {
				throw new RuntimeException("更新失败");
			}
			return 1;
		} catch (ObjectNotExistsException e1) {
			throw e1;
		} catch (RuntimeException e2) {
			throw e2;
		}
	}

	@Override
	@Transactional
	public int updateStudent(Long stuId, Integer stuNumber, String name, String phone, Integer sex, String major,
			Integer year, Integer classNum, Integer dormitoryId) throws ObjectNotExistsException, RuntimeException{
		Student student = studentDao.getById(stuId);
		if(student == null) {
			throw new ObjectNotExistsException("学生对象不存在");
		}
		if(student.getDormitory() == null) {
			throw new ObjectNotExistsException("关联的宿舍对象不存在");
		}
		//判断是否要更新学生的宿舍外键
		if(dormitoryId != null) {
			if(dormitoryId == student.getDormitory().getDormitoryId()) {
				//更新的宿舍外键与原来的一样
				return studentDao.updateStudent(stuId, stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
			}else {
				Dormitory dormitory = dormitoryDao.getById(student.getDormitory().getDormitoryId());
				if(dormitory.getBuilding() == null) {
					throw new ObjectNotExistsException("关联的宿舍楼对象不存在");
				}
				Dormitory new_dormitory = dormitoryDao.getById(dormitoryId);
				if(new_dormitory == null) {
					throw new RuntimeException("宿舍对象不存在");
				}
				Building building = dormitoryDao.getById(dormitoryId).getBuilding();
				if(building == null) {
					throw new RuntimeException("操作失败");
				}
				//判断宿舍是否已满人
				if(new_dormitory.getTotals() >= building.getLives()) {
					throw new RuntimeException("宿舍人数已满");
				}
				int count = studentDao.updateStudent(stuId, stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
				if(count < 1) {
					return 0;
				}
				//原来的宿舍已住人数减一
				int totals = student.getDormitory().getTotals();
				if(totals > 0 ) {
					totals--;
					if(dormitoryDao.updateDormitory(dormitoryId, null, totals, null) < 1) {
						throw new RuntimeException("更新失败");
					}
				}
				//新入住的宿舍已住人数加一
				totals = new_dormitory.getTotals();
				totals++;
				if(dormitoryDao.updateDormitory(dormitoryId, null, totals, null) < 1) {
					throw new RuntimeException("更新失败");
				}
				return 1;
			}
		}
		//不更新宿舍外键
		return studentDao.updateStudent(stuId, stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
	}

	@Override
	@Transactional
	public int deleteStudent(Long stuId) throws RuntimeException{
		Student student = studentDao.getById(stuId);
		if (student == null) {
			throw new RuntimeException("学生对象不存在");
		}
		Dormitory dormitory = student.getDormitory();
		if(dormitory == null) {
			throw new RuntimeException("关联的宿舍对象不存在");
		}
		int count = studentDao.deleteStudent(stuId);
		//删除学生失败
		if(count < 1) {
			return 0;
		}
		//更新宿舍已住人数失败
		int totals = dormitory.getTotals();
		if(totals > 1) {
			totals--;
			count = dormitoryDao.updateDormitory(dormitory.getDormitoryId(), null, totals, null);
		}
		if(count < 1) {
			throw new RuntimeException("删除失败");
		}
		return 1;
	}

	@Override
	public Student getById(Long stuId) {
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

	@Override
	public List<Student> queryByBuildingId(Integer buildingId) {
		return studentDao.queryByBuildingId(buildingId);
	}

}
