package com.rsv.persist;

import java.util.List;
import java.util.Map;

import com.rsv.domain.MemVO;
import com.rsv.domain.MoviRankVO;
import com.rsv.domain.RsvListVO;
import com.rsv.domain.ScheduleVO;
import com.rsv.domain.SeatVO;
import com.rsv.domain.TicketVO;

public interface RsvDAO {
    public int selectOne(); //cfmNum 생성용
    public List<Map<String, Object>> selectList(ScheduleVO scd_vo); //좌석 조회용
    public int insert(ScheduleVO scd_vo);
    public int insert(SeatVO seat_vo);
    public int insert(TicketVO tk_vo);
    public int update(MemVO mvo); //멤버테이블 예약번호 연결
    public List<RsvListVO> selectList(String email);
    public int scd_delete(int scd_num);
    public int seat_delete(int scd_num);
    public int tk_delete(int scd_num);
    public List<MoviRankVO> selectOneRank(); // 영화 순위
    public List<TicketVO> selectList(); // 예매율
}
