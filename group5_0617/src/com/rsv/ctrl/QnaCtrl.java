package com.rsv.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.QnaVO;
import com.rsv.orm.FtpProccessor;
import com.rsv.service.QnaSvc;
import com.rsv.service.QnaSvcImpl;

@WebServlet("/qc")
public class QnaCtrl extends HttpServlet { // Qna Controller
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(QnaCtrl.class);
	private QnaSvc qsv;

	public QnaCtrl() {
		qsv = new QnaSvcImpl();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");
		res.setContentType("text/html; charset=UTF-8");

		String nextSt = req.getParameter("nextSt");

		switch (nextSt) {
		case "qregist": // 문의 등록
			FtpProccessor fp = new FtpProccessor();
			boolean isUp = qsv.qnaRegist(fp.saveFile(req, res));
			logger.info(isUp ? ">>> 문의등록성공" : "%%% 문의등록실패");
			RequestDispatcher rdp = req.getRequestDispatcher("qc?nextSt=qList");
			rdp.forward(req, res);
			break;
		case "qList": // 문의 리스트
			List<QnaVO> qList = qsv.qnaList();
			logger.info(qList.size() > 0 ? ">>> 리스트 출력 성공" : "%%% 리스트가 비어 있음");
			req.setAttribute("qList", qList);
			RequestDispatcher rdp2 = req.getRequestDispatcher("main.jsp?view=qnaList");
			rdp2.forward(req, res);
			break;
		case "qDetail": // 문의 디테일
			int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
			QnaVO qvo = qsv.qnaDetail(qnaNum);
			logger.info(qvo == null ? "%%% 문의 내용 출력 실패!" : ">>> 문의 내용 출력 성공~");
			req.setAttribute("qvo", qvo);
			RequestDispatcher rdp3 = req.getRequestDispatcher("main.jsp?view=qnaDetail");
			rdp3.forward(req, res);
			break;
		case "qDelete": // 문의 삭제
			logger.info("qDelete");
			if (req.getMethod().equalsIgnoreCase("post")) {
				int qnaNum2 = Integer.parseInt(req.getParameter("qnaNum"));
				boolean isUp2 = qsv.qnaRemove(qnaNum2);
				logger.info(isUp2 ? ">>> 문의 삭제 성공" : "%%% 문의 삭제 실패");
				RequestDispatcher rdp4 = req.getRequestDispatcher("qc?nextSt=qList");
				rdp4.forward(req, res);
			}
			break;
		case "qAnsUpdate": // 문의 상태 업데이트 (답변완료)
			if (req.getMethod().equalsIgnoreCase("post")) {
				int qnaNum2 = Integer.parseInt(req.getParameter("qnaNum"));
				boolean isUp0 = qsv.ansUpdate(qnaNum2);
				logger.info(isUp0 ? "%%% 문의 상태 답변완료로 업데이트 성공!" : ">>> 문의 상태 답변완료로 업데이트 실패~");
				RequestDispatcher rdp4 = req.getRequestDispatcher("qc?nextSt=qDetail");
				rdp4.forward(req, res);
			}
			break;
		case "qUnansUpdate": // 문의 상태 업데이트 (미답변)
			if (req.getMethod().equalsIgnoreCase("post")) {
				int qnaNum3 = Integer.parseInt(req.getParameter("qnaNum"));
				boolean isUp2 = qsv.unansUpdate(qnaNum3);
				logger.info(isUp2 ? "%%% 문의 상태 미답변으로 업데이트 성공!" : ">>> 문의 상태 미답변으로 업데이트 실패~");
				RequestDispatcher rdp6 = req.getRequestDispatcher("qc?nextSt=qDetail");
				rdp6.forward(req, res);
			}
			break;
			
		case "mypage2":
			// 문의리스트
			HttpSession session = req.getSession();
			int memberNum = (int) session.getAttribute("Ses_memberNum");
			List<QnaVO> qnaList = qsv.myQnaList(memberNum);
			logger.info(qnaList.size() > 0 ? ">>> 나의 문의 리스트 출력 성공" : "%%% 나의 문의 리스트가 비어 있음");
			req.setAttribute("qnaList", qnaList);
			
			//view단 수정하기
			rdp = req.getRequestDispatcher("main.jsp?view=mypage");
			rdp.forward(req, res);
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
