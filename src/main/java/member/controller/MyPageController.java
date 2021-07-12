package member.controller;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import dao.MemberDao;
import utility.MemberSha256;
import utility.Utility;

@Controller
public class MyPageController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@ModelAttribute("member")
	public Member mymember() {
		return new Member();
	}
	
	
	@GetMapping("/mypage.me")
	public ModelAndView doGet(
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginfo");
		
		ModelAndView mav = new ModelAndView();
		
		Member newmember = mdao.SelectDataByPk(member.getEmail());
		mav.addObject("newmember",newmember);
		mav.setViewName("mypage");
		return mav;
	}
	
	@RequestMapping(value = "/updateModal.me", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateModal(
			@RequestParam("height") double height,
			@RequestParam("weight") double weight,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginfo");
		int cnt = mdao.updateStatus(height, weight, member.getEmail());
		System.out.println("update 결과 : "+cnt);
		return mav;
	}
	
	@RequestMapping(value = "/deleteMember.me", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView deleteMember(
			@RequestParam ("email") String email) {
		ModelAndView mav = new ModelAndView("jsonView");
		int cnt = 0;
		// set null 처리 아직 안함 ( remark 컬럼 추가해야 함! )
		cnt = mdao.deleteMember(email);
		System.out.println("delete 성공!");
		return mav;
	}
	
	@RequestMapping(value = "/	passwordCheck.me", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView passwordCheck(
			@RequestParam ("email") String email,
			@RequestParam ("Input") String password) {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("여기들어옴");
		// 암호화! - 비밀번호 암호화(sha256)
		String encryPassword = MemberSha256.encrypt(password);
		
		int cnt = 0;
		Member member = (Member) mdao.passwordCheck(email,encryPassword);
		if(member != null) {
			cnt = 1;
		}else {
			cnt = 0;
		}
		mav.addObject("cnt",cnt);
		System.out.println("check 성공!");
		return mav;
	}

	
	@GetMapping("/update.me")
	public ModelAndView updateMember(
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginfo");
		
		ModelAndView mav = new ModelAndView();
		
		member.setBirth(member.getBirth().substring(0,10));
		System.out.println(member);
		mav.addObject("member",member);
		mav.setViewName("meUpdateForm");
		return mav;
	}
	
	@PostMapping("/update.me")
	public ModelAndView updateMemberP(
			@ModelAttribute("member") Member member,
			BindingResult result,
			HttpServletRequest request) {
		System.out.println(member);
		ModelAndView mav = new ModelAndView();
		
		
		if(result.hasErrors()) {
			System.out.println("바인딩 오류");
			mav.setViewName("meUpdateForm");
		}else {
			MultipartFile multi = member.getAbcd();
			String uploadPath = "/picture" ;
			
			//realPath :
			String realPath = request.getSession().getServletContext().getRealPath(uploadPath);
			System.out.println(realPath);
			
			try {
				if(multi.isEmpty()) {
					
				}else {
					// 업로드 폴더에 파일을 업로드 합니다.
					File destination = Utility.getUploadedFileInfo(multi, realPath);
					
					multi.transferTo(destination);
					// 원래 이미지에 날짜를 붙인 새 이미지 이름
					member.setPhoto(destination.getName());
					System.out.println(realPath);
				}
				
				// 암호화! - 비밀번호 암호화(sha256)
				String encryPassword = MemberSha256.encrypt(member.getPassword());
				member.setPassword(encryPassword);
				System.out.println("두번째 "+member.getPassword());
				
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
				
				
				int cnt = mdao.updateMember(member);
				System.out.println("update 결과 :"+cnt);
				
				mav.setViewName("redirect:/mypage.me");
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
				mav.setViewName("meUpdateForm");
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("meUpdateForm");
			}
		}	
		
		return mav;
	}

}
