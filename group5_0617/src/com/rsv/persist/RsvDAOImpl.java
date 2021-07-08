package com.rsv.persist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.MemVO;
import com.rsv.domain.MoviRankVO;
import com.rsv.domain.RsvListVO;
import com.rsv.domain.ScheduleVO;
import com.rsv.domain.SeatVO;
import com.rsv.domain.TicketVO;
import com.rsv.orm.DBConnector;

public class RsvDAOImpl implements RsvDAO {
	 private static Logger logger = LoggerFactory.getLogger(RsvDAOImpl.class);
	    private SqlSession SQL;
	    private final String NS = "rsvMapper.";
	    int result = 0;
	    
	    public RsvDAOImpl() {
	        new DBConnector();
	        SQL = DBConnector.getFactory().openSession();
	    }
	    
	    @Override
	    public int selectOne() {
	        result = SQL.selectOne(NS+"cfmNum"); //새로 생성될 예약번호
	        return result;
	    }

	    @Override
	    public List<Map<String, Object>> selectList(ScheduleVO scd_vo) {
	        return SQL.selectList(NS+"seatStatus", scd_vo); //map List 형태로 리턴
	    }

	    @Override
	    public int insert(ScheduleVO scd_vo) {
	        result = SQL.insert(NS+"sch_vo_insert", scd_vo);
	        if(result > 0) SQL.commit();
	        return result;
	    }

	    @Override
	    public int insert(SeatVO seat_vo) {
	        result = SQL.insert(NS+"seat_vo_insert", seat_vo);
	        if(result > 0) SQL.commit();
	        return result;
	    }

	    @Override
	    public int insert(TicketVO tk_vo) {
	        result = SQL.insert(NS+"tk_vo_insert", tk_vo);
	        if(result > 0) SQL.commit();
	        return result;
	    }

	    @Override
	    public int update(MemVO mvo) {
	        result = SQL.update(NS+"mvo_update", mvo);
	        if(result > 0) SQL.commit();
	        return result;
	    }
	    
	    @Override
	    public List<RsvListVO> selectList(String email) {
	        return SQL.selectList(NS+"rsvList", email);
	    }

	    @Override
	    public int scd_delete(int scd_num) {
	        result = SQL.delete(NS+"scd_delete", scd_num);
	        if(result > 0) SQL.commit();
	        return result;
	    }

	    @Override
	    public int seat_delete(int scd_num) {
	        result = SQL.delete(NS+"seat_delete", scd_num);
	        if(result > 0) SQL.commit();
	        return result;

	    }

	    @Override
	    public int tk_delete(int scd_num) {
	        result = SQL.delete(NS+"tk_delete", scd_num);
	        if(result > 0) SQL.commit();
	        return result;
	    }
	    
	    // 영화 순위
	    @Override
	    public List<MoviRankVO> selectOneRank() {
	        return SQL.selectList(NS+"mrvo_rank");
	    }

		@Override
		public List<TicketVO> selectList() {
			return SQL.selectList(NS + "tk_list");
		}
}
