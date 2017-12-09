package org.hostel.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hostel.dto.Result;
import org.hostel.entity.User;
import org.hostel.enums.RoleEnum;
import org.hostel.exception.ValueDuplicateException;
import org.hostel.service.RoleService;
import org.hostel.service.UserService;
import org.hostel.utils.DateUtil;
import org.hostel.utils.MD5Util;
import org.hostel.utils.SiderbarUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
*
* @author unclesky4
* @date Nov 19, 2017 2:25:43 PM
*
*/
@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 跳转到保存用户的界面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save")
	public String toSaveUserPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(!user.getRole().getSymbol().equals("root")) {
			return "404";
		}
		SiderbarUtil.setSidebar(user, model);
		model.addAttribute("roles", roleService.queryAllRole());
		return "save_user";
	}
	
	/**
	 * 保存用户
	 * @param session
	 * @param userName
	 * @param userPwd
	 * @param userSex
	 * @param userPhone
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/saveUser", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Result<String> saveUser(HttpSession session, String userName, String userPwd, Short userSex, String userPhone, Integer roleId) {
		User user = (User) session.getAttribute("user");
		try {
			Result<String> result = new Result<String>();
			//判度是否有用户登陆
			if(user == null) {
				result.setTime(DateUtil.getStringDate());
				result.setData("请登陆");
				return result;
			}
			if(!user.getRole().getSymbol().equals("root")) {
				result.setTime(DateUtil.getStringDate());
				result.setData("没有该权限");
				return result;
			}
			Integer count = userService.addUser(userName, userPwd, userSex, userPhone, roleId);
			if(count > 0) {
				result.setTime(DateUtil.getStringDate());
				result.setData("添加成功");
			}else{
				result.setTime(DateUtil.getStringDate());
				result.setData("添加失败");
			}
			return result;
		} catch (ValueDuplicateException e1) {
			return new Result<String>(DateUtil.getStringDate(), "用户名已存在");
		} catch (RuntimeException e2) {
			return new Result<String>(DateUtil.getStringDate(), "操作失败");
		}
	}
	
	/**
	 * 更新用户信息
	 * @param session
	 * @param userId - 用户主键，修改自己登陆的账号时不用传
	 * @param userPwd
	 * @param userSex - 0：男 1：女
	 * @param userPhone
	 * @param userState - 0：待审核， 1:审核通过  -1：审核不通过
	 * @param roleId - 角色主键
	 * @return
	 */
	@RequestMapping(value="/{userId}/update", method = RequestMethod.POST, produces = {"application/text;charset=UTF-8" })
	@ResponseBody
	public String updateUser(HttpSession session, @PathVariable("userId")Integer userId, String userPwd, Short userSex, String userPhone,
			Short userState, Integer roleId) {
		User tmp = (User) session.getAttribute("user");
		if(userId == null) {
			return "请登陆";
		}
		if(userSex != 0 && userSex != 1 && userSex != null) {
			return "存在非法的值";
		}
		Integer count = 0;
		//root角色可以修改其他用户的信息，包括密码，状态，角色
		if(tmp.getRole().getSymbol().equals("root") && userId != null) {
			if(userState != 0 && userState != 1 && userState != -1) {
				return "存在非法的值";
			}
			try {
				count = userService.updateUser(userId, null, userPwd, userSex, userPhone, userState, roleId);
				if(count > 0) {
					User user = userService.getUserById(userId);
					if(user != null) {
						session.setAttribute("user", user);
					}
					return "更新成功";
				}else{
					return "更新失败";
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return "操作失败"; 
			}
		}
		//如果不是root角色，取登陆用户的主键
		try {
			count = userService.updateUser(tmp.getUserId(), null, null, userSex, userPhone, null, null);
			if(count > 0) {
				User user = userService.getUserById(userId);
				if(user != null) {
					session.setAttribute("user", user);
				}
				return "更新成功";
			}else{
				return "更新失败";
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			return "操作失败"; 
		}
	}
	
	/**
	 * 跳转到修改密码界面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/password/update", method=RequestMethod.GET)
	public String toUpdatePwdPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		SiderbarUtil.setSidebar(user, model);
		return "update_password";
	}
	
	/**
	 * 更改登陆用户的密码
	 * @param session
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@RequestMapping(value="/updatePwd", method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String updatePwd(HttpSession session, String oldPwd, String newPwd) {
		User tmp = (User) session.getAttribute("user");
		if(tmp == null) {
			return "请登陆";
		}
		oldPwd = MD5Util.Encrypt(oldPwd);
		if(!oldPwd.equals(tmp.getUserPwd())) {
			return "旧密码不正确";
		}
		try {
			int count = userService.updateUser(tmp.getUserId(), null, newPwd, null, null, null, null);
			if(count > 0) {
				User user = userService.getUserById(tmp.getUserId());
				if(user != null) {
					session.setAttribute("user", user);
				}
				return "更新成功";
			}else{
				return "更新失败";
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			return "操作失败";
		}
	}
	
	/**
	 * 显示某个用户的信息
	 * @param request
	 * @param userId
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/{userId}/detail", method = RequestMethod.GET)
	public String getUserById(HttpServletRequest request, @PathVariable("userId")Integer userId, HttpSession session) {
		User user = null;
		if(userId == null) {
			user = (User) session.getAttribute("user");
		}else {
			user = userService.getUserById(userId);
		}
		if (user == null) {
			return "login";
		}
		request.setAttribute("userId", user.getUserId());
		request.setAttribute("userName", user.getUserName());
		request.setAttribute("userPhone", user.getUserPhone());
		request.setAttribute("userSex", user.getUserSex());
		request.setAttribute("userState", user.getUserState());
		request.setAttribute("createTime", user.getCreateTime());
		request.setAttribute("roleName", RoleEnum.getBySymbol(user.getRole().getSymbol()).getRoleName());
		return "user_detail";
	}
	
	/**
	 * 跳转到用户列表页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String toUserListPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(!user.getRole().getSymbol().equals("root")) {
			return "404";
		}
		SiderbarUtil.setSidebar(user, model);
		return "user_list";
	}
	
	/**
	 * 获取所有用户信息
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/getAll", method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, List<User>> getAllUser(HttpSession session) {
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		List<User> users = new ArrayList<User>();
		User user = (User) session.getAttribute("user");
		if(user == null || !user.getRole().getSymbol().equals("root")) {
			map.put("data", users);
			return map;
		}
		users = userService.getAllUser();
		map.put("data", users);
		return map;
	}
	
	/**
	 * 用户登陆 - ajax
	 * @param session
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value="/login", method = RequestMethod.POST, produces = {"application/text;charset=UTF-8" })
	@ResponseBody
	public String login(HttpSession session, String username, String pwd) {
		User user = userService.login(username, pwd);
		if(user == null) {
			return "no";
		}
		session.setMaxInactiveInterval(30*60);
		session.setAttribute("user", user);
		return "yes";
	}
	
	/**
	 * 注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	/**
	 * 跳转到登陆界面
	 * @return
	 */
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index() {
		return "login";
	}
	
	/**
	 * 查看登陆用户的个人信息
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String userInfo(HttpSession session, Model model) {
		User tmp = (User) session.getAttribute("user");
		if(tmp == null) {
			return "login";
		}
		User user = userService.getUserById(tmp.getUserId());
		model.addAttribute("userId", user.getUserId());
		model.addAttribute("userName", user.getUserName());
		model.addAttribute("userPhone", user.getUserPhone());
		model.addAttribute("userSex", user.getUserSex());
		model.addAttribute("userState", user.getUserState());
		model.addAttribute("createTime", user.getCreateTime());
		model.addAttribute("roleName", RoleEnum.getBySymbol(user.getRole().getSymbol()).getRoleName());
		SiderbarUtil.setSidebar(user, model);
		return "user_info";
	}

}
