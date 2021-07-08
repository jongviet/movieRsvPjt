package com.rsv.service;

import java.util.List;

import com.rsv.domain.MemVO;

public interface MemSvc {
	public int memJoin(MemVO mvo);
	public MemVO memLogin(MemVO mvo);
	public List<MemVO> memList();
	public int dupChk(String email);
	public void memRemove(List<Integer> checkedList);
}
