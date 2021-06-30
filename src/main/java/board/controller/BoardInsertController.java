package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
			@RequestParam(value="subject")String subject,
			@RequestParam(value="email")String email,
			@RequestParam(value="category")String category,
			@RequestParam(value="content")String content){
			
			int cnt = -99999 ; 	
			Board board = new Board();
			board.setSubject(subject);
			board.setEmail(email);
			board.setCategory(category);
			board.setContent(content);
			//Bean 객체를 이용하여 해당 게시물을 추가한다.
			cnt = dao.InsertData(board) ;			
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);
				
		return this.mav ;
	}
}