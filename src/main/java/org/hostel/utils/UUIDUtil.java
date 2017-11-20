package org.hostel.utils;

import java.util.UUID;

/**
*
* @author unclesky4
* @date Oct 20, 2017 9:54:10 AM
*
*/

public class UUIDUtil {
	
	/**
	 * 获取UUID
	 * @return
	 */
	public String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}

}
