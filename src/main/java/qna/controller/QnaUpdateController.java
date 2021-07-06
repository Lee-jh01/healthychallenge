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
public class QnaUpdateController extends SuperClass{
	private final String command = "/update.qa" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/qnaList.qa" ;
	
	@ModelAttribute("qna")
	public Qna myqna() {
		return new Qna();
	}
	
	@Autowired
	@Qualifier("qdao")
	private QnaDao dao ;
	
	public QnaUpdateController() {
		super("qnaUpdate", "qnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "no", required = true) int no){
		
		// 여기서 xxx는 현재 수정하고자 하는 이전에 기입했던 게시물 1건을 의미합니다.
		Qna xxx = dao.SelectDataByPk(no);
		
		this.mav.addObject("bean", xxx);
				
		this.mav.setViewName(super.getpage);
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("qna") Qna qna){
System.out.println(qna);
			int cnt = -999999 ;
			cnt = dao.UpdateData(qna) ;
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);	
		
		return this.mav ;
	}
}