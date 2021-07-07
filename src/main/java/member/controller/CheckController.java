package member.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.controller.SuperClass;
import dao.MemberDao;

@Controller
public class CheckController extends SuperClass {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired
	private MemberMailSendService mailsender;
	

	@RequestMapping(value="emailCheck.me", method= RequestMethod.GET)
	public @ResponseBody String emailCheck(
			@RequestParam("email") String email) {
		String result = mdao.emailCheck(email)+"";
		return result;
	}
	
	@RequestMapping(value="alterStatus.me", method = RequestMethod.GET)
	public String alterStatus(
			@RequestParam("email") String email,
			@RequestParam("key") String key) {
		
		int cnt = mdao.AlterStatus(email, key);
		System.out.println("AlterStatus 성공 여부 : "+cnt);
		
		return "meInsertSuccess";
	}
	
	// 이메일 찾기
	@RequestMapping(value = "emailSearch.me", method = RequestMethod.POST)
	@ResponseBody
	public String emailSearch(
			@RequestParam("name") String name,
			@RequestParam("birth") String birth) {
		System.out.println("check mapping 들어옴");
		System.out.println("name : "+name);
		System.out.println("birth : "+birth);
		String result = mdao.searchEmail(name, birth);
		System.out.println("result : "+result);
		return result;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "passwordSearch.me", method = RequestMethod.GET)
	@ResponseBody
	public String passwordSearch(
			@RequestParam("email") String email,
			@RequestParam("birth") String birth,
			HttpServletRequest request) {
			System.out.println("여기 들어왔습니다!");
		int cnt = mailsender.mailSendWithPassword(email, birth, request);
		String result = cnt + "";
		System.out.println("메일 보내기 완료!");
		System.out.println(result);
		return result;
	}
	

}
