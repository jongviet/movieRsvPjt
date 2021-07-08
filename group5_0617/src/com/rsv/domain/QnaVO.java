package com.rsv.domain;

public class QnaVO {
	private int qnaNum;
	private int memberNum;
	private String email;
	private String askType;
	private String title;
	private String content;
	private String askStatus;
	private String imgfile;
	private String date;

	public QnaVO() {}

	// insert
	public QnaVO(int memberNum, String askType, String email, String title, String content, String imgfile) {
		this.memberNum = memberNum;
		this.askType = askType;
		this.email = email;
		this.title = title;
		this.content = content;
		this.imgfile = imgfile;
	}
	
	// list
	public QnaVO(int qnaNum, String askType, String title, String askStatus,String imgfile) {
		this.qnaNum = qnaNum;
		this.askType = askType;
		this.title = title;
		this.askStatus = askStatus;
		this.imgfile = imgfile;
	}
	
	// detail
	public QnaVO(int qnaNum, int memberNum, String email, String askType, String title, String content, String askStatus,
			String imgfile) {
		this.qnaNum = qnaNum;
		this.memberNum = memberNum;
		this.email = email;
		this.askType = askType;
		this.title = title;
		this.content = content;
		this.askStatus = askStatus;
		this.imgfile = imgfile;
	}

	
	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
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

	public String getAskType() {
		return askType;
	}

	public void setAskType(String askType) {
		this.askType = askType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAskStatus() {
		return askStatus;
	}

	public void setAskStatus(String askStatus) {
		this.askStatus = askStatus;
	}

	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "QnaVO [qnaNum=" + qnaNum + ", memberNum=" + memberNum + ", email=" + email + ", askType=" + askType
				+ ", title=" + title + ", content=" + content + ", askStatus=" + askStatus + ", imgfile=" + imgfile
				+ "]";
	}
	
}
