package qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Qna;
import common.controller.SuperClass;
import common.utility.FlowParameters;
import common.utility.Paging;
import dao.QnaDao;

@Controller
  public class QnaListController extends SuperClass{ 
	  private final String command = "/qnaList.qa"; 
	  private ModelAndView mav = null; 
	  private String redirect = "redirect:/qnaList.qa";
  
  @Autowired
  @Qualifier("qdao") private QnaDao dao;
  
  public QnaListController() { // getpage, postpage 
	  super("qnaList", "qnaList"); 
	  this.mav = new ModelAndView(); 
	  }
  
  @RequestMapping(value=command, method ={RequestMethod.POST,RequestMethod.GET}) 
  public ModelAndView doGet(HttpServletRequest request,
	  @RequestParam(value = "pageNumber", required = false) String pageNumber,
	  @RequestParam(value = "pageSize", required = false) String pageSize,
	  @RequestParam(value = "mode", required = false) String mode,
	  @RequestParam(value = "keyword", required = false) String keyword){

	  // 페이징과 필드 검색을 위한 파라미터를 우선 챙깁니다. 
	  FlowParameters parameters = new FlowParameters(pageNumber, pageSize, mode, keyword);
	  // 파라미터 확인을 위한 출력 System.out.println(this.getClass() + " : " +
	  parameters.toString();
	  
	  int totalCount = dao.SelectTotalCount( 
			  parameters.getMode(),
			  parameters.getKeyword());
	  
	  String contextpath = request.getContextPath() + "/" ; String myurl =
	  contextpath + this.command ;
	  
	  Paging pageInfo = new Paging( parameters.getPageNumber(),
	  parameters.getPageSize(), totalCount, myurl, parameters.getMode(),
	  parameters.getKeyword());
	  
	  List<Qna> lists = dao.SelectDataList( 
			  pageInfo.getOffset(),
			  pageInfo.getLimit(), 
			  parameters.getMode(), 
			  parameters.getKeyword()) ; // "% 문자열은 like 연산자 때문에 넣었습니다.
	  
	 // 바인딩해야 할 목록들 
	  mav.addObject("lists", lists); // 게시물 목록
	  
	  // 페이징 관련 항목들
	  mav.addObject("pagingHtml", pageInfo.getPagingHtml());
	  mav.addObject("pagingStatus", pageInfo.getPagingStatus());
	  System.out.println("pageingHtml : "+pageInfo.getPagingHtml()); // 검색 필드의 상태 값
	 // 저장을 위한 항목들 
	  mav.addObject("mode", parameters.getMode());
	  mav.addObject("keyword", parameters.getKeyword());
	  
	  // 상세 보기, 수정, 삭제, 답글 등의 링크에 사용될 parameter list 문자열
	  mav.addObject("parameters", parameters.toString());
	  
	  this.mav.setViewName(super.postpage); 
	  return this.mav ; 
	  }
	  
  }
  
 