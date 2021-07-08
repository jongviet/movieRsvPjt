package com.rsv.persist;

import java.util.List;

import com.rsv.domain.MemVO;

public interface MemDAO {
	public int insert(MemVO mvo); //회원가입
	public MemVO selectOne(MemVO mvo); //로그인
	public List<MemVO> selectList(); //관리자모드 회원리스트
	public int selectOne(String email); //이메일 중복검사
}
