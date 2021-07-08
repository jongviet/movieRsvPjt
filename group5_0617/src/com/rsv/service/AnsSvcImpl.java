package com.rsv.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.AnsVO;
import com.rsv.persist.AnsDAO;
import com.rsv.persist.AnsDAOImpl;
import com.rsv.persist.QnaDAOImpl;

public class AnsSvcImpl implements AnsSvc {
	private static Logger logger = LoggerFactory.getLogger(AnsSvcImpl.class);
	private AnsDAO adao;
	
	public AnsSvcImpl() {
		adao = new AnsDAOImpl();
	}
	@Override
	public boolean answerAddition(AnsVO avo) {
		logger.info("AnsSvcImpl");
		return adao.insert(avo) > 0 ? true : false;
	}
	@Override
	public List<AnsVO> showAnswer(int qnaNum) {
		return adao.selectList(qnaNum);
	}
	@Override
	public boolean answerRemove(int ansNum) {
		return adao.delete(ansNum) > 0 ? true : false;
	}
	@Override
	public boolean answerAllRemove(int qnaNum) {
		return adao.allDelete(qnaNum) > 0 ? true : false;
	}

}
