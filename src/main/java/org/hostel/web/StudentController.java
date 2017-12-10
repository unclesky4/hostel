package org.hostel.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hostel.entity.Building;
import org.hostel.entity.Student;
import org.hostel.entity.User;
import org.hostel.exception.ObjectNotExistsException;
import org.hostel.service.BuildingService;
import org.hostel.service.StudentService;
import org.hostel.utils.DateUtil;
import org.hostel.utils.SiderbarUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:25:07 PM
*
*/
@Service
@RequestMapping(value="/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private BuildingService buildingService;
	/**
	 * 跳转到添加学生功能的界面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.GET)
	public String toSavePage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "404";
		}
		//入学年份列表
		List<Integer> years = new ArrayList<Integer>();
		Integer year = DateUtil.getCurrentYear();
		years.add(year-4);
		years.add(year-3);
		years.add(year-2);
		years.add(year-1);
		years.add(year);
		years.add(year+1);
		years.add(year+2);
		model.addAttribute("years", years);
		
		//宿舍楼列表
		List<Building> buildings = buildingService.queryAllBuilding();
		model.addAttribute("buildings", buildings);
		SiderbarUtil.setSidebar(user, model);
		return "save_student";
	}
	
	/**
	 * 保存学生
	 * @param session
	 * @param stuNumber - 学号
	 * @param name - 姓名
	 * @param phone - 手机号码
	 * @param sex - 性别 （0：男 1：女）
	 * @param major - 学院专业
	 * @param year - 入学年份
	 * @param classNum - 班级
	 * @param dormitoryId - 宿舍主键
	 * @return
	 */
	@RequestMapping(value="/saveStu", method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String save(HttpSession session, Integer stuNumber, String name, String phone,Integer sex,
			String major,Integer year,Integer classNum, Integer dormitoryId) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有权限";
		}
		if(stuNumber==null || name==null || phone==null || sex==null || major==null || year==null || classNum==null || dormitoryId==null) {
			return "参数错误";
		}
		try {
			int count = studentService.saveStudent(stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
			if(count > 0) {
				return "保存成功";
			}
			return "保存失败";
		} catch (ObjectNotExistsException e) {
			return e.getMessage();
		} catch (RuntimeException e) {
			return e.getMessage();
		}
	}
	
	/**
	 * 跳转到学生查询界面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/query",method=RequestMethod.GET)
	public String toQueryPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		SiderbarUtil.setSidebar(user, model);
		return "student_query";
	}
	
	/**
	 * 通过学号查询
	 * @param session
	 * @param stuNumber - 学号
	 * @return
	 */
	@RequestMapping(value="/getByStuNum",method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, List<Student>> getByStuNum(HttpSession session, Integer stuNumber) {
		User user = (User) session.getAttribute("user");
		Map<String, List<Student>> map = new HashMap<String, List<Student>>();
		if(user == null) {
			return map;
		}
		Student student = studentService.getByStuNumber(stuNumber);
		List<Student> list = new ArrayList<Student>();
		list.add(student);
		map.put("data", list);
		return map;
	}
	
	//通过姓名查询
	
	/**
	 * 学生具体信息页面
	 * @param session
	 * @param stuId - 学生主键
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{stuId}/detail", method=RequestMethod.GET)
	public String toStuDetailPage(HttpSession session, @PathVariable("stuId")Long stuId, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/user/index";
		}
		Student student = studentService.getById(stuId);
		model.addAttribute("student", student);
		List<Building> buildings = buildingService.queryAllBuilding();
		model.addAttribute("buildings", buildings);
		SiderbarUtil.setSidebar(user, model);
		
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "studentDetail";
		}
		return "student_detail";
	}
	
	/**
	 * 更新学生信息
	 * @param session
	 * @param stuId - 学生主键
	 * @param stuNumber - 学号
	 * @param name - 姓名
	 * @param phone - 手机号码
	 * @param sex - 性别 （0：男 1：女）
	 * @param major - 学院专业
	 * @param year - 入学年份
	 * @param classNum - 班级
	 * @param dormitoryId - 宿舍主键
	 * @return
	 */
	@RequestMapping(value="/update", method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String update(HttpSession session, Long stuId, Integer stuNumber, String name, String phone, Integer sex, String major,
			Integer year, Integer classNum, Integer dormitoryId) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有权限";
		}
		try {
			int count = studentService.updateStudent(stuId, stuNumber, name, phone, sex, major, year, classNum, dormitoryId);
			if(count > 0) {
				return "更新成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "更新失败";
	}
	
	/**
	 * 跳转到学生列表
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String toListPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		SiderbarUtil.setSidebar(user, model);
		List<Building> buildings = buildingService.queryAllBuilding();
		model.addAttribute("buildings", buildings);
		return "student_list";
	}
	
	/**
	 * 删除学生
	 * @param session
	 * @param stuId - 学生主键
	 * @return
	 */
	@RequestMapping(value="/delete", method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String delete(HttpSession session, Long stuId) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有权限";
		}
		try {
			int count = studentService.deleteStudent(stuId);
			if(count < 1) {
				return "删除失败";
			}
			return "删除成功";
		} catch (RuntimeException e) {
			return e.getMessage();
		}
	}
	
	/**
	 * 查询某栋宿舍楼的所有已入住学生
	 * @param session
	 * @param bId - 宿舍楼主键
	 * @return
	 */
	@RequestMapping(value="/queryByBuildingId", method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, List<Student>> queryByBuildingId(HttpSession session, Integer bId) {
		Map<String, List<Student>> map = new HashMap<String, List<Student>>();
		List<Student> list = new ArrayList<Student>();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			map.put("data", list);
			return map;
		}
		if(bId==null) {
			map.put("data", list);
			return map;
		}
		list = studentService.queryByBuildingId(bId);
		map.put("data", list);
		return map;
	}

}
