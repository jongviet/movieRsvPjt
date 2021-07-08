package com.rsv.domain;

public class QnaImgVO {
	private int imgNum;
	private int qnaNum;
	private String imgName;
	private String imgType;
	private String imgDate;
	
	public QnaImgVO() {}

	public QnaImgVO(int qnaNum, String imgName, String imgType) {
		this.qnaNum = qnaNum;
		this.imgName = imgName;
		this.imgType = imgType;
	}

	public int getImgNum() {
		return imgNum;
	}

	public void setImgNum(int imgNum) {
		this.imgNum = imgNum;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgType() {
		return imgType;
	}

	public void setImgType(String imgType) {
		this.imgType = imgType;
	}

	public String getImgDate() {
		return imgDate;
	}

	public void setImgDate(String imgDate) {
		this.imgDate = imgDate;
	}

	@Override
	public String toString() {
		return "QnaImgVO [imgNum=" + imgNum + ", qnaNum=" + qnaNum + ", imgName=" + imgName + ", imgType=" + imgType
				+ ", imgDate=" + imgDate + "]";
	}
	
	
}
