package org.hostel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* 
* @author unclesky4
* @date Dec 10, 2017 3:11:13 PM
*
*/
@Controller
@RequestMapping(value="/common")
public class CommonController {

	/**
	 * 跳转到404页面
	 * @return
	 */
	@RequestMapping(value="/404", method=RequestMethod.GET)
	public String to404Page() {
		return "404";
	}
}
