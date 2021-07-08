package com.rsv.domain;


public class SeatVO {
	private int seatNum;
	private boolean usable_seat;
	private int scheduleNum;
	
	public SeatVO() {}
	
	//좌석등록용
	public SeatVO(int seatNum, int scheduleNum) {
		this.seatNum = seatNum;
		this.scheduleNum = scheduleNum;
	}

	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public boolean isUsable_seat() {
		return usable_seat;
	}
	public void setUsable_seat(boolean usable_seat) {
		this.usable_seat = usable_seat;
	}
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
}
