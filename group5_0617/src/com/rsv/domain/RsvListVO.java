package com.rsv.domain;

public class RsvListVO {
	private int cfmNum;
	private int scheduleNum;
	private int seatNum;
	private String moviName;
	private String viewDate;
	private String viewTime;
	private String email;
	
	
	public RsvListVO() {}
	
	//RsvList 출력용
	public RsvListVO(int cfmNum, int scheduleNum, int seatNum, String moviName, String viewDate, String viewTime,
			String email) {
		this.cfmNum = cfmNum;
		this.scheduleNum = scheduleNum;
		this.seatNum = seatNum;
		this.moviName = moviName;
		this.viewDate = viewDate;
		this.viewTime = viewTime;
		this.email = email;
	}
	
	public int getCfmNum() {
		return cfmNum;
	}

	public void setCfmNum(int cfmNum) {
		this.cfmNum = cfmNum;
	}
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public String getMoviName() {
		return moviName;
	}
	public void setMoviName(String moviName) {
		this.moviName = moviName;
	}
	public String getViewDate() {
		return viewDate;
	}
	public void setViewDate(String viewDate) {
		this.viewDate = viewDate;
	}
	public String getViewTime() {
		return viewTime;
	}
	public void setViewTime(String viewTime) {
		this.viewTime = viewTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
