package com.rsv.orm;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.MultipartResponse;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rsv.domain.QnaImgVO;
import com.rsv.domain.QnaVO;

public class FtpProccessor { 
	private static Logger logger = LoggerFactory.getLogger(FtpProccessor.class);
	private final String URL = "ljinam.dothome.co.kr";;
	private final String ID = "ljinam";;
	private final String PWD = "huao1590!";
	private final int PORT = 21;
	private FTPClient ftp; // commons-net-3.8.0.jar 라이브러리 안에 있음
	FileInputStream fis;
	ArrayList<String> uploadedFileNameList; // pvo에 던져야됨

	public FtpProccessor() {
		ftp = new FTPClient(); // FTP 사용객체 생성
		ftp.setControlEncoding("UTF-8"); // 문자 코드 및 명령어 인코딩 (UTF-8 => 대문자로)
	}

	public QnaVO saveFile(HttpServletRequest req, HttpServletResponse res) {
		int maxSize = 1024 * 1024; // 1 MB
		String realPath = req.getServletContext().getRealPath("/images/");
		File dir = new File(realPath);
		if (!dir.exists())
			dir.mkdirs(); // mkdir => make directory

		ArrayList<File> savedImages = new ArrayList<>();

		try {
			MultipartRequest multi = new MultipartRequest(req, realPath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames(); // 파일객체 순서화
			while (files.hasMoreElements()) {
				String item = (String) files.nextElement(); // 파일객체 정보 가져오기
				String fileName = multi.getFilesystemName(item); // 그 객체에서 파일이름 추출

				if (fileName != null) { // 파일이름 추출을 성공하면
					File file = new File(realPath + fileName); // 경로+파일이름으로 파일객체 생성
					if (file.exists()) { // 생성에 성공하면
						savedImages.add(file); // 파일객체를 리스트에 저장=>ftp로 업로드 예정
					}
				}
			} 
			int isUp = upload(savedImages, realPath);
			 
			return isUp > 0
					? new QnaVO(Integer.parseInt(multi.getParameter("memberNum")), multi.getParameter("askType"),
							multi.getParameter("email"), multi.getParameter("title"), multi.getParameter("content"),
							String.join(",", uploadedFileNameList)) //  isUp > 0
					: null; // isUp < 0
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private int upload(ArrayList<File> savedImages, String realPath) { // 중복 방지
		int result = 1;
		uploadedFileNameList = new ArrayList<>(); // 객체 생성
		try {
			ftp.connect(URL, PORT);
			ftp.login(ID, PWD);
			ftp.enterLocalPassiveMode(); // 명령어 체계로 진행
			ftp.changeWorkingDirectory("/html/qnaimg"); // 업로드 폴더 설정
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 파일깨짐방지

			try {
				for (File image : savedImages) {
					fis = new FileInputStream(image); // ftp 전송용 파일객체로 변환 (FileInuptStream)
					logger.info(">>> image name : " + image.getName());
					String uploadFileName = make_curr_time() + "_" + image.getName(); // 시간 + image name , 실제로 ftp로 올라간
																						// fileName
					result *= ftp.storeFile(uploadFileName, fis) ? 1 : 0; // storeFile return type => boolean
					uploadedFileNameList.add(uploadFileName);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				fis.close();
			}

		} catch (SocketException e) {
			logger.error("%%% jvm 네트워크 소켓 설정 오류");
			e.printStackTrace();
		} catch (IOException e) {
			logger.error("%%% 파일전송 FTP 객체 오류");
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
				return result;
			} catch (IOException e) {
				logger.error("%%% 파일전송 FTP 객체 오류");
				e.printStackTrace();
			}
		}
		return 0;
	}

	private String make_curr_time() {
		long curr_time = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date(curr_time));
	}

	public boolean delete(QnaImgVO imgfile) {
		int isDelete = 1;
		try {
			ftp.connect(URL, PORT);
			ftp.login(ID, PWD);
			ftp.enterLocalPassiveMode();
			ftp.changeWorkingDirectory("/html/qnaimg");
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			
				isDelete *= ftp.deleteFile(imgfile.getImgName()) ? 1 : 0;
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
	            ftp.disconnect();
	            return isDelete == 1 ? true : false;
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
		}
		return false;
	}

}