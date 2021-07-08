package com.rsv.persist;

import java.util.List;

import com.rsv.domain.AnsVO;

public interface AnsDAO {
	public int insert(AnsVO avo);
	public List<AnsVO> selectList(int qnaNum);
	public int delete(int ansNum);
	public int allDelete(int qnaNum);
}
