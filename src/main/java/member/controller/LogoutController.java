package member.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import common.controller.SuperClass;
import dao.MemberDao;

@Controller
public class LogoutController extends SuperClass {
	private final String command = "/logout.me";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	public LogoutController() {
		super("meLogin", "저기");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(HttpSession session) {
		
		session.invalidate();
		
		this.mav.setViewName(super.getpage);
		return this.mav;
	}

}
