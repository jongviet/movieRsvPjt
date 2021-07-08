package com.rsv.persist;

import java.util.List;

import com.rsv.domain.QnaImgVO;
import com.rsv.domain.QnaVO;

public interface QnaDAO {
	public int insert(QnaVO qvo); // insert
	public List<QnaVO> selectList(); // list
	public QnaVO selectOne(int qnaNum); // detail
	public QnaImgVO imgSelectOne(int qnaNum); // detail
	public int delete(int qnaNum); // delete
	public int ansUpdate(int qnaNum); // askType update (미답변 / 답변완료)
	public int unansUpdate(int qnaNum);
	public int selectOne();
	public int insert(List<QnaImgVO> imgList);
	public List<QnaVO> selectMyQnaList(int memberNum);
}
