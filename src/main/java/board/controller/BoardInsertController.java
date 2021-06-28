package board.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Board;
import common.controller.SuperClass;
import dao.BoardDao;
@Controller
public class BoardInsertController extends SuperClass{
	private final String command = "/boInsert.bo" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/boList.bo" ;
	
	@ModelAttribute("board")
	public Board MyCoBoard() {
		System.out.println("@ModelAttribute(\"board\")");
		return new Board();
	}
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	public BoardInsertController() {
		super("boInsert", "boList");
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
			@ModelAttribute("board") @Valid Board xxx,
			BindingResult asdf){
		
		if ( asdf.hasErrors() ) {
			System.out.println("유효성 검사에 문제 있슴");
			System.out.println( asdf );
			this.mav.addObject("bean", xxx);	
			this.mav.setViewName(super.getpage);
			
		} else {
			System.out.println("유효성 검사에 문제 없슴");
			int cnt = -99999 ; 			
			//Bean 객체를 이용하여 해당 게시물을 추가한다.
			cnt = dao.InsertData(xxx) ;			
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);
		}			
		return this.mav ;
	}
}