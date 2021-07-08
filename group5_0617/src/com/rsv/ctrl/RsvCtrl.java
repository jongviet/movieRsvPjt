package com.rsv.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.MoviRankVO;
import com.rsv.domain.RsvListVO;
import com.rsv.domain.ScheduleVO;
import com.rsv.domain.SeatVO;
import com.rsv.domain.TicketVO;
import com.rsv.service.QnaSvcImpl;
import com.rsv.service.RsvSvcImpl;

@WebServlet("/rc")
public class RsvCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(RsvCtrl.class);
	private RsvSvcImpl rsv;
	private QnaSvcImpl qsv;
	HttpSession session;
	RequestDispatcher rdp;
	int result;

	public RsvCtrl() {
		rsv = new RsvSvcImpl();
		qsv = new QnaSvcImpl();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("UTF-8");
		res.setContentType("text/html); charset=UTF-8"); // alert창 인코딩용

		String nextSt = req.getParameter("nextSt");
		switch (nextSt) {
		case "cfmNumCre":
			result = rsv.cfmNumCreator();
			logger.info("신규 예약 번호 : " + result);
			PrintWriter out = res.getWriter();
			out.print(result);
			break;
		case "seatStatus":
			List<Map<String, Object>> list = rsv.seatStatus(new ScheduleVO(req.getParameter("viewDate"),
					req.getParameter("viewTime"), Integer.parseInt(req.getParameter("moviNum"))));
			logger.info(list != null ? "좌석 정보 접수 성공" : "좌석 정보 접수 실패");
			PrintWriter out2 = res.getWriter();
			out2.print(list);
			break;
		case "tkCfm":
			int scd_result = rsv.scd_insert(
					new ScheduleVO(Integer.parseInt(req.getParameter("scheduleNum")), req.getParameter("viewDate"),
							req.getParameter("viewTime"), Integer.parseInt(req.getParameter("moviNum"))));
			logger.info(scd_result > 0 ? "스케쥴 테이블 입력 성공" : "스케쥴 테이블 입력 실패");

			int seat_result = rsv.seat_insert(new SeatVO(Integer.parseInt(req.getParameter("seatNum")),
					Integer.parseInt(req.getParameter("scheduleNum"))));
			logger.info(seat_result > 0 ? "좌석 테이블 입력 성공" : "좌석 테이블 입력 실패");

			int tk_result = rsv.tk_insert(new TicketVO(Integer.parseInt(req.getParameter("cfmNum")),
					Integer.parseInt(req.getParameter("scheduleNum")), Integer.parseInt(req.getParameter("seatNum")),
					Integer.parseInt(req.getParameter("moviNum")), req.getParameter("email")));
			logger.info(tk_result > 0 ? "티켓 테이블 입력 성공" : "티켓 테이블 입력 실패");
			break;
		// 마이페이지 예약리스트 + 문의리스트
		case "mypage":
			// 예약리스트
			session = req.getSession();
			String email = (String) session.getAttribute("Ses_email");
			List<RsvListVO> rsvList = rsv.rsvList(email);
			logger.info(rsvList != null ? "예약 리스트 출력 성공" : "예약 리스트 출력 실패");
			req.setAttribute("rsvList", rsvList);
			rdp = req.getRequestDispatcher("qc?nextSt=mypage2");
			rdp.forward(req, res);
			break;
		case "cancel":
			// ticket, schedule, seat 테이블 삭제
			int scd_num = Integer.parseInt(req.getParameter("scheduleNum"));
			int result_1 = rsv.scd_delete(scd_num);
			logger.info(result_1 > 0 ? "스케쥴 테이블 삭제 성공" : "스케쥴 테이블 삭제 실패");

			int result_2 = rsv.seat_delete(scd_num);
			logger.info(result_2 > 0 ? "좌석 테이블 삭제 성공" : "좌석 테이블 삭제 실패");

			int result_3 = rsv.tk_delete(scd_num);
			logger.info(result_3 > 0 ? "티켓 테이블 삭제 성공" : "티켓 테이블 삭제 실패");

			rdp = req.getRequestDispatcher("rc?nextSt=mypage");
			rdp.forward(req, res);
			break;
		case "moviRank":
			List<MoviRankVO> mrvo = rsv.moviRank();
			req.setAttribute("mrvo", mrvo);
			rdp = req.getRequestDispatcher("main.jsp");
			rdp.forward(req, res);
			break;
		case "moviResRate":
					List<TicketVO> ticList = rsv.ticList();
					req.setAttribute("ticListSize", ticList.size());
					RequestDispatcher rdp2 = req.getRequestDispatcher("rc?nextSt=moviRank");
					rdp2.forward(req, res);
					break;
		default:
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}
