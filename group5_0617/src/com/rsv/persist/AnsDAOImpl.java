package com.rsv.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.AnsVO;
import com.rsv.orm.DBConnector;

public class AnsDAOImpl implements AnsDAO {
	private static Logger logger = LoggerFactory.getLogger(AnsDAOImpl.class);
	
	private SqlSession sql;
	private String ns = "ansMapper.";
	
	public AnsDAOImpl() {
		new DBConnector();
		sql = DBConnector.getFactory().openSession();
	}
	
	@Override
	public int insert(AnsVO avo) {
		int isUp = sql.insert(ns+"aAdd", avo);
		if(isUp>0) sql.commit();
		return isUp;
	}

	@Override
	public List<AnsVO> selectList(int qnaNum) {
		return sql.selectList(ns+"aList", qnaNum);
	}

	@Override
	public int delete(int ansNum) {
		int isUp = sql.delete(ns+"aDelete", ansNum);
		if(isUp>0) sql.commit();
		return isUp;
	}

	@Override
	public int allDelete(int qnaNum) {
		int isUp = sql.delete(ns+"aAllDelete", qnaNum);
		if(isUp>0) sql.commit();
		return isUp;
	}

}
