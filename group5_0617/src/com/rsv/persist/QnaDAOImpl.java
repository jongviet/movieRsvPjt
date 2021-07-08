package com.rsv.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.QnaImgVO;
import com.rsv.domain.QnaVO;
import com.rsv.orm.DBConnector;

public class QnaDAOImpl implements QnaDAO {
	private static Logger logger = LoggerFactory.getLogger(QnaDAOImpl.class);
	private SqlSession sql;
	private static String ns = "qnaMapper.";
	
	public QnaDAOImpl() {
		new DBConnector();
		sql = DBConnector.getFactory().openSession();
	}
	@Override
	public int insert(QnaVO qvo) {
		int isUp = sql.insert(ns+"qAdd", qvo);
		if(isUp > 0) sql.commit();
		return isUp;
	}
	@Override
	public List<QnaVO> selectList() {
		return sql.selectList(ns+"qList");
	}
	@Override
	public QnaVO selectOne(int qnaNum) {
		return sql.selectOne(ns+"qDetail", qnaNum);
	}
	@Override
	public int delete(int qnaNum) {
		int isUp = sql.delete(ns+"qDelete", qnaNum);
		isUp = sql.delete(ns+"imgDelete", qnaNum);
		if(isUp>0) sql.commit();
		return isUp;
	}
	@Override
	public int ansUpdate(int qnaNum) {
		int isUp = sql.update(ns+"qAnsStatusUp", qnaNum);
		if(isUp>0) sql.commit();
		return isUp;
	}
	@Override
	public int unansUpdate(int qnaNum) {
		int isUp = sql.update(ns+"qUnansStatusUp", qnaNum);
		if(isUp>0) sql.commit();
		return isUp;
	}
	@Override
	public int selectOne() {
		return sql.selectOne(ns+"lastQnaNum");
	}
	@Override
	public int insert(List<QnaImgVO> imgList) {
		  int isUp = sql.insert(ns+"imgAdd", imgList);
	      if(isUp > 0) sql.commit();
	      return isUp;
	}
	@Override
	public QnaImgVO imgSelectOne(int qnaNum) {
		return sql.selectOne(ns+"imgSelect", qnaNum);
	}
	
	@Override
    public List<QnaVO> selectMyQnaList(int memberNum) {
        return sql.selectList(ns+"myQnaList", memberNum);
    }

}
