package member.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import dao.MemberDao;

@Controller
public class MyPageController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	
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
	

}
