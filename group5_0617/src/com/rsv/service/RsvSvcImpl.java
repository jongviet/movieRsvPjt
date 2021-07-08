package com.rsv.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.MemVO;
import com.rsv.domain.MoviRankVO;
import com.rsv.domain.RsvListVO;
import com.rsv.domain.ScheduleVO;
import com.rsv.domain.SeatVO;
import com.rsv.domain.TicketVO;
import com.rsv.persist.RsvDAOImpl;

public class RsvSvcImpl implements RsvSvc {
	private static Logger logger = LoggerFactory.getLogger(RsvSvcImpl.class);
	private RsvDAOImpl rdao;
	
	public RsvSvcImpl() {
		rdao = new RsvDAOImpl();
	}
	
	@Override
	public int cfmNumCreator() {
		return rdao.selectOne(); //예약번호 접수
	}

	@Override
	public List<Map<String, Object>> seatStatus(ScheduleVO scd_vo) {
		logger.info("RsvSvc 단 실행");
		return rdao.selectList(scd_vo);
	}

	@Override
	public int scd_insert(ScheduleVO scd_vo) {
		return rdao.insert(scd_vo);
	}

	@Override
	public int seat_insert(SeatVO seat_vo) {
		return rdao.insert(seat_vo);
	}

	@Override
	public int tk_insert(TicketVO tk_vo) {
		return rdao.insert(tk_vo);
	}

	@Override
	public int mem_tk_update(MemVO mvo) {
		return rdao.update(mvo);
	}
	
	@Override
    public List<RsvListVO> rsvList(String email) {
        return rdao.selectList(email);
    }

	@Override
	public int scd_delete(int scd_num) {
		return rdao.scd_delete(scd_num);
	}

	@Override
	public int seat_delete(int scd_num) {
		return rdao.seat_delete(scd_num);
	}

	@Override
	public int tk_delete(int scd_num) {
		return rdao.tk_delete(scd_num);
	}

	//영화순위
	@Override
	public List<MoviRankVO> moviRank() {
		return rdao.selectOneRank(); 
	}

	@Override
	public List<TicketVO> ticList() {
		return rdao.selectList();
	}

}
