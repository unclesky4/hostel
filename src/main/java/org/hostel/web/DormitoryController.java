package org.hostel.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hostel.entity.Building;
import org.hostel.entity.Dormitory;
import org.hostel.entity.User;
import org.hostel.service.BuildingService;
import org.hostel.service.DormitoryService;
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
* @date Nov 19, 2017 2:23:11 PM
*
*/
@Controller
@RequestMapping(value="/dormitory")
public class DormitoryController {
	
	@Autowired
	private DormitoryService dormitoryService;
	
	@Autowired
	private BuildingService buildingService;
	
	/**
	 * 跳转到保存宿舍功能界面
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
		List<Building> buildings = buildingService.queryAllBuilding();
		model.addAttribute("buildings", buildings);
		return "save_dormitory";
	}
	/**
	 * 保存宿舍
	 * @param session
	 * @param dormitoryNumber - 宿舍门号
	 * @param buildingId - 宿舍楼主键
	 * @return
	 */
	@RequestMapping(value="/saveDormitory",method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String saveDormitory(HttpSession session, Integer dormitoryNumber, Integer buildingId) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有该权限";
		}
		if(dormitoryNumber == null || buildingId == null) {
			return "参数错误";
		}
		if(dormitoryService.findDormitoryNumber(buildingId,dormitoryNumber) > 0) {
			return "宿舍门号已存在";
		}
		int count = dormitoryService.saveDormitory(dormitoryNumber, buildingId);
		if(count > 0) {
			return "保存成功";
		}else {
			return "保存失败";
		}
	}
	
	/**
	 * 跳转到宿舍列表信息页面
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
		//根据角色跳转页面
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "dormitoryList";
		}
		return "dormitory_list";
	}
	
	/**
	 * 查询某栋宿舍楼的所有宿舍信息
	 * @param session
	 * @param bId - 宿舍楼主键
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getByBuildingId",method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, List<Dormitory>> getByBuildingId(HttpSession session, Integer bId, Model model) {
		Map<String, List<Dormitory>> map = new HashMap<String, List<Dormitory>>();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			map.put("data", new ArrayList<Dormitory>());
			return map;
		}
		if(bId == null) {
			map.put("data", new ArrayList<Dormitory>());
			return map;
		}
		Building building = buildingService.getById(bId);
		List<Dormitory> dormitories = building.getDormitories();
		//宿舍楼未查询到
		if(building == null || dormitories == null) {
			return map;
		}
		map.put("data", dormitories);
		return map;
	}
	
	/**
	 * 跳转到宿舍详情页
	 * @param session
	 * @param dId - 宿舍主键
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{dId}/detail", method=RequestMethod.GET)
	public String toDetailPage(HttpSession session, @PathVariable("dId")Integer dId, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/user/index";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "redirect:/common/404";
		}
		Dormitory dormitory = dormitoryService.getById(dId);
		model.addAttribute("data", dormitory);
		SiderbarUtil.setSidebar(user, model);
		return "dormitory_detail";
	}
	
	/**
	 * 某个宿舍的学生列表页面
	 * @param session
	 * @param dId - 宿舍主键
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{dId}/students", method=RequestMethod.GET)
	public String toListStu(HttpSession session, @PathVariable("dId")Integer dId, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/user/index";
		}
		Dormitory dormitory = dormitoryService.getById(dId);
		model.addAttribute("dormitory", dormitory);
		SiderbarUtil.setSidebar(user, model);
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "dormitoryStu";
		}
		return "dormitory_stu";
	}
	
	/**
	 * 更新宿舍信息
	 * @param session
	 * @param dId
	 * @param dNum
	 * @param totals
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String update(HttpSession session, Integer dId, Integer dNum, Integer totals) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有该权限";
		}
		if(dId == null || dNum == null || totals == null) {
			return "参数错误";
		}
		try {
			int count = dormitoryService.update(dId, dNum, totals);
			if (count < 1) {
				return "更新失败";
			}
			return "更新成功";
		} catch (RuntimeException e) {
			return e.getMessage();
		}
	}
	
	/**
	 * 删除宿舍
	 * @param session
	 * @param dId - 宿舍主键
	 * @return
	 */
	@RequestMapping(value="/{dId}/delete",method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String delete(HttpSession session, @PathVariable("dId")Integer dId) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有该权限";
		}
		if(dId == null) {
			return "参数错误";
		}
		try {
			int count = dormitoryService.deleteDormitory(dId);
			if(count < 1) {
				return "删除失败";
			}
			return "删除成功";
		} catch (RuntimeException e) {
			return e.getMessage();
		}
	}

}
