package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import common.controller.SuperClass;
import dao.MemberDao;
import utility.MemberSha256;

@Controller
public class MemberLoginController extends SuperClass{
	private final String command = "/meLogin.me" ; // 요청 커맨드
	private ModelAndView mav = null ;
	//private String redirect = "redirect:/list.bo" ;
	private final String redirect = "redirect:/main.co" ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao ;
	
	public MemberLoginController() {
		// getpage, postpage
		super("meLogin", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(){		
		this.mav.setViewName(super.getpage);
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "password", required = true) String password,
			HttpSession session){
		
		
		// 만일 유효성 검사에 문제가 있으면, false로 변경합니다.
		boolean isCheck = true ; // 기본 값은 true입니다.
		
		if (email.length() < 4 || email.length() > 30) {
			mav.addObject("erremail", "메일주소는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		
		if (password.length() < 4 || password.length() > 10) {			
			mav.addObject("errpwd", "비밀 번호는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}		
		System.out.println("ischeck!! : "+isCheck);
		
		
		if (isCheck == true) { // 유효성 검사에 문제가 없습니다.	
			// 비밀번호 암호화
			password = MemberSha256.encrypt(password);
			System.out.println("암호화 확인 : "+password);
			
			Member bean = this.dao.SelectData(email, password) ;
			System.out.println("bean : "+bean);
			
			if(bean == null) { // 로그인 실패
				System.out.println("로그인 실패");
				String message = "메일주소나 비번이 잘못되었습니다.";				
				mav.addObject("errmsg", message);
				mav.setViewName(super.getpage);
			}else{ // 로그인 성공
				System.out.println("아이디, 비밀번호 일치");
				// 로그인이 되었으므로 세션 영역에 로그인 정보를 바인딩합니다.
				// 이 바인딩 내용은 common.jsp 파일에서 참조하고 있습니다.
				
				// 메일 인증 여부 확인하기
				String result = dao.StatusCheck(email);
				
				if(result.equals("1")) {
					session.setAttribute("loginfo", bean);
					System.out.println("로그인 성공");
					//게시물 목록 보기 페이지
					mav.setViewName(redirect);
				}else {
					System.out.println("로그인 실패");
					String message = "메일 인증 후 로그인 진행하세요";				
					mav.addObject("errstatus", message);
					mav.setViewName(super.getpage);
				}
				
			}
		}else {
			mav.addObject("email", email); 
			mav.addObject("password", password);
			this.mav.setViewName(super.getpage);
		}
		
		return this.mav ;
	}
}
