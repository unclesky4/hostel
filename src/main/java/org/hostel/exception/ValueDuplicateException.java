package org.hostel.exception;

/**
* 保存数据时值重复异常
* @author unclesky4
* @date Nov 19, 2017 3:13:00 PM
*
*/

public class ValueDuplicateException extends RuntimeException {
	
	private static final long serialVersionUID = 2058190289858634572L;

	public ValueDuplicateException(String message, Throwable cause) {
		super(message, cause);
	}

	public ValueDuplicateException(String message) {
		super(message);
	}

}
