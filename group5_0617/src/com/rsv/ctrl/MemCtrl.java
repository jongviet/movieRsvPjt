package com.rsv.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.rsv.domain.MemVO;
import com.rsv.service.MemSvcImpl;

@WebServlet("/mc")
public class MemCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(MemCtrl.class);
	private MemSvcImpl msv;
	RequestDispatcher rdp;
	int result;

    public MemCtrl() {
    	msv = new MemSvcImpl();
    }

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		String nextSt = req.getParameter("nextSt");
		switch (nextSt) {
		
		case "join":
			result = msv.memJoin(new MemVO(
					req.getParameter("email"), 
					req.getParameter("pwd")));
			logger.info(result > 0 ? "회원가입성공" : "회원가입실패");
			res.sendRedirect("index.jsp");
			break;
		case "login":
			MemVO mvo = msv.memLogin(new MemVO(
					req.getParameter("email"), 
					req.getParameter("pwd")));
			if(mvo != null) {
				logger.info("로그인 성공");
				HttpSession session = req.getSession();
				session.setAttribute("Ses_email", mvo.getEmail());
				session.setAttribute("Ses_memberNum", mvo.getMemberNum()); // QnA memberNum 
				session.setMaxInactiveInterval(60 * 15);
				res.sendRedirect("index.jsp");
			} else {
				logger.info("로그인 실패");
				PrintWriter script = res.getWriter();
				script.println("<script>");
				script.println("alert('아이디 혹은 비밀번호를 확인해주세요!')");
				script.println("history.back()");
				script.println("</script>");
			}
			break;
		case "dupChk":
			result = (msv.dupChk(req.getParameter("email")));
			logger.info(result > 0 ? "중복 이메일" : "가입 가능");
			PrintWriter out = res.getWriter();
			out.print(result);
			break;
		case "list": // 회원관리 회원 목록 출력
			List<MemVO> memberList = msv.memList();
			logger.info(memberList == null ? "list 없음" : "list 있음");
			logger.info(memberList.size() > 0 ? ">>> 리스트 출력 성공":"%%% 리스트가 비어 있음");
			req.setAttribute("memberList", memberList);
			rdp = req.getRequestDispatcher("main.jsp?view=memberList");
			rdp.forward(req, res);
			break;
		case "delete": // 회원관리 관리자 회원삭제
			Gson gson = new Gson();			
			List<Integer> checkedList = gson.fromJson(req.getParameter("checkedList"), new TypeToken<ArrayList<Integer>>() {}.getType());		
			msv.memRemove(checkedList);			
			rdp = req.getRequestDispatcher("mc?nextSt=list");
			rdp.forward(req, res);
			break;
		case "quit": // 일반회원 탈퇴
			HttpSession sess = req.getSession();
			int memberNum = Integer.parseInt(sess.getAttribute("Ses_memberNum").toString());
			System.out.println("탈퇴요청 memeberNum: "  + memberNum);
			msv.memRemove(memberNum);
			
			break;
		default:
			
			break;			
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
