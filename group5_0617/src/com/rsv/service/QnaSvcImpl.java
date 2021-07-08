package com.rsv.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.QnaImgVO;
import com.rsv.domain.QnaVO;
import com.rsv.orm.FtpProccessor;
import com.rsv.persist.QnaDAO;
import com.rsv.persist.QnaDAOImpl;

public class QnaSvcImpl implements QnaSvc {
	private static Logger logger = LoggerFactory.getLogger(QnaSvcImpl.class);
	private QnaDAO qdao;

	public QnaSvcImpl() {
		qdao = new QnaDAOImpl();
	}

	@Override
	public boolean qnaRegist(QnaVO qvo) {
		List<String> imageNames = new ArrayList<>();
		for (int i = 0; i < 1; i++) {
			imageNames.add(qvo.getImgfile().split(",")[i]);
		}
		qvo.setImgfile(imageNames.get(0));
		int isUp = qdao.insert(qvo);
		int qnaNum = 0;
		if (isUp > 0) {
			qnaNum = qdao.selectOne();
		}
		List<QnaImgVO> imgList = new ArrayList<>();
		for (int i = 0; i < imageNames.size(); i++) {
			String imgName = imageNames.get(i);
			imgList.add(new QnaImgVO(qnaNum, imgName, imgName.substring(imgName.lastIndexOf(".") + 1)));
		}
		return qdao.insert(imgList) > 0 ? true : false;
	}

	@Override
	public List<QnaVO> qnaList() {
		return qdao.selectList();
	}

	@Override
	public QnaVO qnaDetail(int qnaNum) {
		return qdao.selectOne(qnaNum);
	}

	@Override
	public boolean qnaRemove(int qnaNum) {
		QnaImgVO imgfile = qdao.imgSelectOne(qnaNum); 
		FtpProccessor fp = new FtpProccessor();
		boolean isDel = fp.delete(imgfile);
		if(isDel) {
			return qdao.delete(qnaNum) > 0 ? true : false; 
		} else {
			return qdao.delete(qnaNum) > 0 ? true : false;
		}
	}

	@Override
	public boolean ansUpdate(int qnaNum) {
		return qdao.ansUpdate(qnaNum) > 0 ? true : false;
	}

	@Override
	public boolean unansUpdate(int qnaNum) {
		return qdao.unansUpdate(qnaNum) > 0 ? true : false;
	}
	
	@Override
    public List<QnaVO> myQnaList(int memberNum) {
        return qdao.selectMyQnaList(memberNum);
    }
}
