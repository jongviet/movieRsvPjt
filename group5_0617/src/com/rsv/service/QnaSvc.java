package com.rsv.service;

import java.util.List;

import com.rsv.domain.QnaVO;

public interface QnaSvc {
	public boolean qnaRegist(QnaVO qvo);
	public List<QnaVO> qnaList();
	public QnaVO qnaDetail(int qnaNum);
	public boolean qnaRemove(int qnaNum);
	public boolean ansUpdate(int qnaNum);
	public boolean unansUpdate(int qnaNum);
	public List<QnaVO> myQnaList(int memberNum);
}
