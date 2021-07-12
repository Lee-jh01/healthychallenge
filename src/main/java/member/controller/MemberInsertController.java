package member.controller;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import common.controller.SuperClass;
import dao.MemberDao;
import utility.MemberSha256;
import utility.Utility;

@Controller
public class MemberInsertController extends SuperClass {
	private final String command = "/insert.me";
	private ModelAndView mav = null;
	private final String redirect = "redirect:/insert.me";
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired 
	private MemberMailSendService mailsender;
	
	
	
	@ModelAttribute("member")
	public Member MyMember() {
		return new Member();
	}
	
	public MemberInsertController() {
		super("meInsertForm", "저기");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("member") Member member,
			BindingResult result,
			HttpServletRequest request) {
		
		if(result.hasErrors()) {
			System.out.println("바인딩 오류");
			mav.setViewName(super.getpage);
		}else {
			MultipartFile multi = member.getAbcd();
			String uploadPath = "/picture" ;
			
			//realPath :
			String realPath = request.getSession().getServletContext().getRealPath(uploadPath);
			System.out.println(realPath);
			
			try {
				if(multi.isEmpty()) {
					member.setPhoto("basicimage.png");
					System.out.println("여기에 들어왔습니다.");
				}else {
					// 업로드 폴더에 파일을 업로드 합니다.
					File destination = Utility.getUploadedFileInfo(multi, realPath);
					
					multi.transferTo(destination);
					// 원래 이미지에 날짜를 붙인 새 이미지 이름
					member.setPhoto(destination.getName());
					System.out.println(realPath);
					System.out.println("여기도!! : "+destination.getName());
				}
				
				// 암호화! - 암호 확인
				System.out.println("첫번째 "+member.getPassword());
				
				// 암호화! - 비밀번호 암호화(sha256)
				String encryPassword = MemberSha256.encrypt(member.getPassword());
				member.setPassword(encryPassword);
				System.out.println("두번째 "+member.getPassword());
				
				// 권한 상태 0 으로 바꿔주기
				member.setAuthstatus("0");
				
				// 몸무게, 키 넣어주기
				if(member.getGender() == 1) {
					//남자
					member.setHeight(175);
					member.setWeight(67.5);
				}else {
					//여자
					member.setHeight(162);
					member.setWeight(52.3);
				}
				// 회원가입!
				System.out.println(member);
				this.mdao.insertData(member);
				
				// 인증 메일 보내기 메서드
				mailsender.mailSendWithMemberKey(member.getEmail(), member.getName(), request);
				mav.setViewName("meInsertAlert");
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
				mav.setViewName("meInsertForm");
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName(this.redirect);
			}
		}
		return this.mav;
	}
}
