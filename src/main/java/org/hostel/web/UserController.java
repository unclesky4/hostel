package org.hostel.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hostel.dto.Result;
import org.hostel.entity.User;
import org.hostel.enums.RoleEnum;
import org.hostel.exception.ValueDuplicateException;
import org.hostel.service.UserService;
import org.hostel.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	/**
	 * 保存用户
	 * @param userName
	 * @param userPwd
	 * @param userSex
	 * @param userPhone
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/save", method = RequestMethod.POST, produces = {"application/text;charset=UTF-8" })
	@ResponseBody
	public Result<String> saveUser(String userName, String userPwd, Short userSex, String userPhone, Integer roleId) {
	
		try {
			Result<String> result = new Result<String>();
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
	 * @param userId
	 * @param userPwd
	 * @param userSex
	 * @param userPhone
	 * @param userState
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/{userId}/update", method = RequestMethod.POST, produces = {"application/text;charset=UTF-8" })
	@ResponseBody
	public String updateUser(@PathVariable("userId")Integer userId, String userPwd, Short userSex, String userPhone,
			Short userState, Integer roleId) {
		try {
			Integer count = userService.updateUser(userId, null, null, userSex, userPhone, null, null);
			if(count > 0) {
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
	 * @return
	 */
	@RequestMapping(value="/{userId}/detail", method = RequestMethod.GET)
	public String getUserById(HttpServletRequest request, @PathVariable("userId")Integer userId) {
		User user = userService.getUserById(userId);
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
	 * 查询所有用户信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String getAllUser(HttpServletRequest request) {
		List<User> users = userService.getAllUser();
		request.setAttribute("data", users);
		return "user_list";
	}
	
	/**
	 * 用户登陆
	 * @param session
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value="/login", method = RequestMethod.GET, produces = {"application/text;charset=UTF-8" })
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
	
	/*=================================================================================================*/
	
	/*测试返回json数据*/
	@RequestMapping(value="/test", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8" })
	@ResponseBody
	public Result<String> test() {
		return new Result<String>(DateUtil.getStringDate(), ",jgldg");
	}
	
	/*测试freemarker*/
	@RequestMapping(value="/test_1", method = RequestMethod.GET)
	public String test_1(HttpServletRequest request) {
		request.setAttribute("name", "黄志标");
		request.setAttribute("phone", "18814383363");
		return "test";
	}

}
