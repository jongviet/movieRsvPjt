package com.rsv.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.MemVO;
import com.rsv.orm.DBConnector;

public class MemDAOImpl implements MemDAO {
	private static Logger logger = LoggerFactory.getLogger(MemDAOImpl.class);
	private SqlSession SQL;
	private final String NS = "memMapper.";

	
	public MemDAOImpl() {
		new DBConnector();
		SQL = DBConnector.getFactory().openSession();
	}
	
	@Override
	public int insert(MemVO mvo) {
		int result = SQL.insert(NS+"join", mvo);
		if(result > 0) SQL.commit();
		return result;
	}

	@Override
	public MemVO selectOne(MemVO mvo) {
		return SQL.selectOne(NS+"login", mvo);
	}

	@Override
	public List<MemVO> selectList() {
		return SQL.selectList(NS+"list");
	}

	@Override
	public int selectOne(String email) {
		return SQL.selectOne(NS+"dupChk", email);
	}

	public int delete(int memberNum) {
		int isUp = SQL.delete(NS+"del", memberNum);
		if(isUp > 0) SQL.commit();
		return isUp;
	}
}
