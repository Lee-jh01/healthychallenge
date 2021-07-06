package qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.controller.SuperClass;
import dao.QnaDao;


@Controller
public class QnaDeleteController extends SuperClass{
	private final String command = "/delete.qa" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/qnaList.qa" ;
	
	@Autowired
	@Qualifier("qdao")
	private QnaDao dao ;
	
	public QnaDeleteController() { 
		super("qnaList", "qnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "no", required = true) int no){
		int cnt = -999999 ;
		cnt = dao.DeleteData(no) ;
 		
		this.mav.setViewName(this.redirect);
		return this.mav ;
	}
}