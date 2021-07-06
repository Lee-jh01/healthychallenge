package qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Qna;
import common.controller.SuperClass;
import dao.QnaDao;

@Controller
public class QnaInsertController extends SuperClass{
	private final String command = "/qnaInsert.qa" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/qnaList.qa" ;
	
	@ModelAttribute("qna")
	public Qna MyQna() {
		System.out.println("@ModelAttribute(\"qna\")");
		return new Qna();
	}
	
	@Autowired
	@Qualifier("qdao")
	private QnaDao dao ;
	
	public QnaInsertController() {
		super("qnaInsert", "qnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(){		
		this.mav.setViewName(super.getpage);
		System.out.println("doGet 메소드");
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value="title")String title,
			@RequestParam(value="email")String email,
			@RequestParam(value="content")String content){
			
			int cnt = -99999 ; 	
			Qna qna = new Qna();
			qna.setTitle(title);
			qna.setEmail(email);
			qna.setContent(content);
			//Bean 객체를 이용하여 해당 게시물을 추가한다.
			cnt = dao.InsertData(qna) ;			
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);
				
		return this.mav ;
	}
}