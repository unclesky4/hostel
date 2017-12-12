package org.hostel.utils;

import org.hostel.entity.User;
import org.springframework.ui.Model;

/**
* 页面加载sidebar模版工具类
* @author unclesky4
* @date Nov 27, 2017 6:59:25 PM
*
*/

public class SiderbarUtil {
	
	public static Model setSidebar(User user, Model model) {
		//传用户名
		model.addAttribute("NAME", user.getUserName());
		
		if(user.getRole().getSymbol().equals("root")) {
			model.addAttribute("sidebar", "/base/sidebar_root.ftl");
			return model;
		}
		if(user.getRole().getSymbol().equals("administrator")) {
			model.addAttribute("sidebar", "/base/sidebar_administrator.ftl");
			return model;
		}
		model.addAttribute("sidebar", "/base/sidebar_guest.ftl");
		return model;
	}

}
