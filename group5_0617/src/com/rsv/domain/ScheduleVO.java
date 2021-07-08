package com.rsv.domain;


public class ScheduleVO {
	private int scheduleNum;
	private String viewDate;
	private String viewTime;
	private int moviNum;
	
	
	public ScheduleVO() {}
	
	//좌석 조회용
	public ScheduleVO(String viewDate, String viewTime, int moviNum) {
		this.viewDate = viewDate;
		this.viewTime = viewTime;
		this.moviNum = moviNum;
	}
	
	//예매용
	public ScheduleVO(int scheduleNum, String viewDate, String viewTime, int moviNum) {
		this(viewDate, viewTime, moviNum);
		this.scheduleNum = scheduleNum;
	}


	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
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
	public int getMoviNum() {
		return moviNum;
	}
	public void setMoviNum(int moviNum) {
		this.moviNum = moviNum;
	}
	
	
	

}
