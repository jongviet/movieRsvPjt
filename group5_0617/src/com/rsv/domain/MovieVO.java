package com.rsv.domain;


public class MovieVO {
	private int moviNum;
	private boolean viewable_seat;
	private String moviName;
	private String moviRate;
	private String moviGenre;
	private String moviDesc;

	public MovieVO() {
		
	}
	
	public int getMoviNum() {
		return moviNum;
	}


	public void setMoviNum(int moviNum) {
		this.moviNum = moviNum;
	}


	public boolean isViewable_seat() {
		return viewable_seat;
	}


	public void setViewable_seat(boolean viewable_seat) {
		this.viewable_seat = viewable_seat;
	}


	public String getMoviName() {
		return moviName;
	}


	public void setMoviName(String moviName) {
		this.moviName = moviName;
	}


	public String getMoviRate() {
		return moviRate;
	}


	public void setMoviRate(String moviRate) {
		this.moviRate = moviRate;
	}


	public String getMoviGenre() {
		return moviGenre;
	}


	public void setMoviGenre(String moviGenre) {
		this.moviGenre = moviGenre;
	}


	public String getMoviDesc() {
		return moviDesc;
	}


	public void setMoviDesc(String moviDesc) {
		this.moviDesc = moviDesc;
	}
	
	
	
}
