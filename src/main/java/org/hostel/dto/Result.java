package org.hostel.dto;

/**
* 封装操作结果
* @author unclesky4
* @date Nov 19, 2017 3:27:45 PM
*
*/

public class Result<T> {

	//操作时间
	private String time;
	
	//结果
	private T data;
	
	public Result(){
		
	}

	public Result(String time, T data) {
		this.time = time;
		this.data = data;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
