package com.rsv.domain;

public class AnsVO {
	private int ansNum;
	private int qnaNum;
	private String answer;
	private String date;
	
	public AnsVO() {}
	
	public AnsVO(int qnaNum, String answer) {
		this.qnaNum = qnaNum;
		this.answer = answer;
	}
	
	public AnsVO(int qnaNum, String answer, String date) {
		this.qnaNum = qnaNum;
		this.answer = answer;
		this.date = date;
	}

	public int getAnsNum() {
		return ansNum;
	}

	public void setAnsNum(int ansNum) {
		this.ansNum = ansNum;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
