package board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.controller.SuperClass;

@Controller
public class UploadController extends SuperClass {
	/**ck에디터 파일업로드 이벤트 발생 시 처리
	 * @param model
	 * @param fileload
	 * @return
	 */
	@ResponseBody 
	@RequestMapping(value = "/upload.bo", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/text; charset=UTF-8")
	public String fileUpload(Model model,  
	        @RequestParam(value="upload", required = false) MultipartFile upload,
	        HttpServletRequest req, HttpServletResponse res) {
		System.out.println("여기로 들어 왔나요?");

		HttpSession session = req.getSession();
		String uploadpath = session.getServletContext().getRealPath("/upload");
		System.out.println("realPath :"+uploadpath);
		
	    String originalname = upload.getOriginalFilename();
	    System.out.println("filename :"+originalname);
	    
	    String pattern = "yyyyMMddhhmmss" ;
		SimpleDateFormat sdf = new SimpleDateFormat(pattern) ;
		String now = sdf.format(new Date());
		
		int dot = originalname.indexOf(".") ;
		String filename = originalname.substring(0, dot) ;
		
		String fileext = originalname.substring(dot) ;
		
		String newfile = filename + now + fileext ;
		
		String myfile = uploadpath + File.separator + newfile ;
		
		File destination = new File(myfile) ;
		
		try {
			upload.transferTo(destination);
			return "{\"filename\":\""+filename+"\",\"uploaded\" : 1, \"url\":\""+"http://localhost:8086"+req.getContextPath()+"/upload/" + newfile + "\" }";
		} catch (Exception e) {
			return "{ \"uploaded\" : 0, \"error\": { \"message\": \"업로드 중 에러가 발생했습니다. 다시 시도해 주세요.\" }";
		}
	   
	}
}
