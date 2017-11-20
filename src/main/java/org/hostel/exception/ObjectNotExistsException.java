package org.hostel.exception;

/**
* 操作对象不存在异常
* @author unclesky4
* @date Nov 19, 2017 3:22:11 PM
*
*/

public class ObjectNotExistsException extends RuntimeException {
	
	private static final long serialVersionUID = 2758395414203237956L;

	public ObjectNotExistsException(String message, Throwable cause) {
		super(message, cause);
	}

	public ObjectNotExistsException(String message) {
		super(message);
	}

}
