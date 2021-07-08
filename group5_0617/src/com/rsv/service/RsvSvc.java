package com.rsv.service;

import java.util.List;
import java.util.Map;

import com.rsv.domain.MemVO;
import com.rsv.domain.MoviRankVO;
import com.rsv.domain.RsvListVO;
import com.rsv.domain.ScheduleVO;
import com.rsv.domain.SeatVO;
import com.rsv.domain.TicketVO;

public interface RsvSvc {
    public int cfmNumCreator();
    public List<Map<String, Object>> seatStatus(ScheduleVO scd_vo);
    public int scd_insert(ScheduleVO scd_vo);
    public int seat_insert(SeatVO seat_vo);
    public int tk_insert(TicketVO tk_vo);
    public int mem_tk_update(MemVO mvo);
    public List<RsvListVO> rsvList(String email);
    public int scd_delete(int scd_num);
    public int seat_delete(int scd_num);
    public int tk_delete(int scd_num);
    public List<MoviRankVO> moviRank();
    public List<TicketVO> ticList(); // 예매율
}
