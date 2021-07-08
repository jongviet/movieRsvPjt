package com.rsv.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.MemVO;
import com.rsv.persist.MemDAOImpl;

public class MemSvcImpl implements MemSvc {
	private static Logger logger = LoggerFactory.getLogger(MemSvcImpl.class);
	private MemDAOImpl mdao;
	
	public MemSvcImpl() {
		mdao = new MemDAOImpl();
	}
	
	@Override
	public int memJoin(MemVO mvo) {
		return mdao.insert(mvo) > 0 ? 1 : 0;
	}

	@Override
	public MemVO memLogin(MemVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public List<MemVO> memList() {
		return mdao.selectList();
	}

	@Override
	public int dupChk(String email) {
		return mdao.selectOne(email); //존재하면 1, 아니면 0 리턴
	}

	@Override
	public void memRemove(List<Integer> checkedList) {
		for (int memberNum : checkedList)
			mdao.delete(memberNum);
	}

	public void memRemove(int memberNum) {
		mdao.delete(memberNum);
	}

	
	
}
