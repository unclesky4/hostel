package org.hostel.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hostel.entity.Building;
import org.hostel.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void queryAllBuilding(HttpServletRequest request) {
		List<Building> buildings = buildingService.queryAllBuilding();
		request.setAttribute("data", buildings);
	}

}
