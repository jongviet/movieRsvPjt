package com.rsv.domain;

public class TicketVO {
	private int cfmNum;
	private int scheduleNum;
	private int seatNum;
	private int moviNum;
	private String email;
	


	public TicketVO() {}
	
	//등록용
	public TicketVO(int cfmNum, int scheduleNum, int seatNum, int moviNum, String email) {
		this.cfmNum = cfmNum;
		this.scheduleNum = scheduleNum;
		this.seatNum = seatNum;
		this.moviNum = moviNum;
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
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
	public int getMoviNum() {
		return moviNum;
	}
	public void setMoviNum(int moviNum) {
		this.moviNum = moviNum;
	}
	
	
}
