package org.hostel.web;

import javax.servlet.http.HttpSession;

import org.hostel.entity.Student;
import org.hostel.entity.User;
import org.hostel.service.StudentService;
import org.hostel.utils.SiderbarUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		SiderbarUtil.setSidebar(user, model);
		return "save_student";
	}
	
	/**
	 * 角色列表
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
		return "student_list";
	}
	
	@RequestMapping(value="/{stuId}/info")
	public String studentInfo(HttpSession session, @PathVariable("stuId")Integer stuId, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		Student student = studentService.getById(stuId);
		model.addAttribute("data", student);
		if(user.getRole().getSymbol().equals("guest")) {
			return "student_info";
		}
		SiderbarUtil.setSidebar(user, model);
		return "student_detail";
	}

}
