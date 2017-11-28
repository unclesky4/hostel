package org.hostel.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hostel.entity.Role;
import org.hostel.entity.User;
import org.hostel.service.RoleService;
import org.hostel.utils.SiderbarUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:23:49 PM
*
*/
@Controller
@RequestMapping(value="/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 跳转到角色列表界面
	 * @param session
	 * @Model model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String toListPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(!user.getRole().getSymbol().equals("root")) {
			return "404";
		}
		List<Role> roles = roleService.queryAllRole();
		model.addAttribute("data", roles);
		SiderbarUtil.setSidebar(user, model);
		return "role_list";
	}

}
