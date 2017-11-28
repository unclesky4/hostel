package org.hostel.web;

import javax.servlet.http.HttpSession;

import org.hostel.entity.User;
import org.hostel.utils.SiderbarUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:23:11 PM
*
*/
@Controller
@RequestMapping(value="/dormitory")
public class DormitoryController {
	
	/**
	 * 跳转到添加宿舍功能界面
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
		SiderbarUtil.setSidebar(user, model);
		return "save_dormitory";
	}
	
	/**
	 * 跳转到宿舍列表界面
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
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "404";
		}
		SiderbarUtil.setSidebar(user, model);
		return "dormitory_list";
	}

}
