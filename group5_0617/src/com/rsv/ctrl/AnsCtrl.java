package com.rsv.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rsv.domain.AnsVO;
import com.rsv.service.AnsSvc;
import com.rsv.service.AnsSvcImpl;

@WebServlet("/ac")
public class AnsCtrl extends HttpServlet { // Answer controller
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(QnaCtrl.class);
	private AnsSvc asv;

	public AnsCtrl() {
		asv = new AnsSvcImpl();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("utf-8");

		String nextSt = req.getParameter("nextSt");

		switch (nextSt) {
		case "addAns": // 답변 등록
			if (req.getMethod().equalsIgnoreCase("post")) {
				int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
				String answer = req.getParameter("answer");
				boolean isUp = asv.answerAddition(new AnsVO(qnaNum, answer));
				logger.info(isUp ? ">>> 답변 등록 성공" : "%%% 답변 등록 실패");
			}
			break;
		case "showAns": // 답변 보기
			int qnaNum2 = Integer.parseInt(req.getParameter("qnaNum"));
			List<AnsVO> list = asv.showAnswer(qnaNum2);

			JSONObject[] data = new JSONObject[list.size()];
			JSONArray data_list = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				int ansNum = list.get(i).getAnsNum();
				String answer2 = list.get(i).getAnswer();
				String date = list.get(i).getDate();

				data[i] = new JSONObject(); // Map => k:v
				data[i].put("ansNum", ansNum);
				data[i].put("answer", answer2);
				data[i].put("date", date);

				data_list.add(data[i]);
			}
			JSONObject anslist = new JSONObject(); // k:v
			anslist.put("anslist", data_list);
			String jsonData = anslist.toJSONString();

			PrintWriter out = res.getWriter();
			out.print(jsonData);
			break;
		case "deleteAns": // 답변 삭제
			if (req.getMethod().equalsIgnoreCase("post")) {
				int ansNum = Integer.parseInt(req.getParameter("ansNum"));
				boolean isUp5 = asv.answerRemove(ansNum);
				logger.info(isUp5 ? ">>> 답변 삭제 성공" : "%%% 답변 삭제 실패");
			}
			break;
		case "deleteAnsAll": // 답변 삭제
			System.out.println("deleteAnsAll");
			if (req.getMethod().equalsIgnoreCase("post")) {
				int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
				boolean isUp5 = asv.answerAllRemove(qnaNum);
				logger.info(isUp5 ? ">>> 답변 전체 삭제 성공" : "%%% 답변 전체 삭제 실패");
				RequestDispatcher rdp = req.getRequestDispatcher("qc?nextSt=qDetail");
				rdp.forward(req, res);
			}
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
