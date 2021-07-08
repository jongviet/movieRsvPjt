package com.rsv.domain;

public class MemVO {
	private int memberNum;
	private String email;
	private String pwd;
	private int cfmNum;
	
	public MemVO() {
		
	}
	
	//회원가입, 로그인
	public MemVO(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}
	
	// list(관리자 모드)
	public MemVO(int memberNum, String email, String pwd) {
		this.memberNum = memberNum;
		this.email = email;
		this.pwd = pwd;
	}
	
	public MemVO(int memberNum, String email, int cfmNum) {
		this.memberNum = memberNum;
		this.email = email;
		this.cfmNum = cfmNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getCfmNum() {
		return cfmNum;
	}
	public void setCfmNum(int cfmNum) {
		this.cfmNum = cfmNum;
	}
	
	@Override
	public String toString() {
		return "MemVO [memberNum=" + memberNum + ", email=" + email + ", pwd=" + pwd + ", cfmNum=" + cfmNum + "]";
	}
}
