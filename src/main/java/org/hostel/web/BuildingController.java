package org.hostel.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hostel.entity.Building;
import org.hostel.entity.User;
import org.hostel.service.BuildingService;
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
* @date Nov 19, 2017 2:22:23 PM
*
*/
@Controller
@RequestMapping(value="/building")
public class BuildingController {
	
	@Autowired
	private BuildingService buildingService;
	
	/**
	 * 跳转到添加宿舍楼界面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save", method=RequestMethod.GET)
	public String toSaveBuildingPage(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "404";
		}
		SiderbarUtil.setSidebar(user, model);
		return "save_building";
	}
	
	/**
	 * 保存宿舍楼
	 * @param session
	 * @param name - 宿舍楼名称 String
	 * @param floors - 多少层 Integer
	 * @param rooms - 每层多少间 Integer
	 * @param lives - 每间住多少人 Integer
	 * @return
	 */
	@RequestMapping(value="/saveBuilding", method=RequestMethod.POST, produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String save(HttpSession session, String name, Integer floors, Integer rooms, Integer lives) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "请登陆";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "没有权限";
		}
		if(name==null || floors == null || rooms == null || lives == null) {
			return "参数不匹配";
		}
		int count = buildingService.saveBuilding(name, floors, rooms, lives);
		if(count > 0) {
			return "保存成功";
		}
		return "保存失败";
	}
	
	/**
	 * 跳转到宿舍楼列表页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String queryAllBuilding(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(!user.getRole().getSymbol().equals("root") && !user.getRole().getSymbol().equals("administrator")) {
			return "404";
		}
		SiderbarUtil.setSidebar(user, model);
		return "building_list";
	}
	
	/**
	 * 查询所有宿舍楼信息
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/getAll", method=RequestMethod.GET, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<Object, Object> getAllBuilding(HttpSession session) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			map.put("data", new ArrayList<>());
			return map;
		}
	    List<Building> buildings = buildingService.queryAllBuilding();
	    map.put("data", buildings);
	    return map;
	}
	
	/**
	 * 访问宿舍楼详细信息页面
	 * @param session
	 * @param buildingId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{buildingId}/detail",method=RequestMethod.GET)
	public String queryById(HttpSession session, @PathVariable("buildingId")Integer buildingId, Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		Building building = buildingService.getById(buildingId);
		model.addAttribute("data",building);
		//根据角色的不同返回不同的页面
		if(user.getRole().getSymbol().equals("root") || user.getRole().getSymbol().equals("administrator")) {
			return "building_detail";
		}
		return "404";
	}

}
