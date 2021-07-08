package com.rsv.service;

import java.util.List;

import com.rsv.domain.AnsVO;

public interface AnsSvc {
	public boolean answerAddition(AnsVO avo);
	public List<AnsVO> showAnswer(int qnaNum);
	public boolean answerRemove(int ansNum);
	public boolean answerAllRemove(int qnaNum);
}
