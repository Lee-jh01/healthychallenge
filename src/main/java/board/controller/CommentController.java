package board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.Board;
import bean.CoComment;
import bean.Member;
import common.controller.SuperClass;
import common.utility.CommentPaging;
import common.utility.Paging;
import dao.BoardCommentDao;
import dao.MemberDao;

@Controller
public class CommentController extends SuperClass {
	@ModelAttribute("comment")
	public CoComment MyCoComment() {
		System.out.println("@ModelAttribute(\"comment\")");
		return new CoComment();
	}
	
	@Autowired
	@Qualifier("bcdao")
	private BoardCommentDao bcdao;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
		
	@RequestMapping(value="/readComment.bo", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyList(
			@RequestParam("co_seq") int co_seq,
			@RequestParam("pageNumber") String pageNumber,
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView("jsonView");
		
		int totalCount = bcdao.selectTotalCount(co_seq);
		
		CommentPaging pageInfo = new CommentPaging(pageNumber, "5", totalCount);
		
		List<CoComment> list = bcdao.selectDataList(
				pageInfo.getOffset(),
				pageInfo.getLimit(),
				co_seq);
				
		//System.out.println("list!:"+list);
		mav.addObject("list", list);
		
		//System.out.println(pageInfo.getPagingHtml());
		
		List<Member> mlist = new ArrayList<Member>();
		for(CoComment co : list) {
			Member member = mdao.SelectDataByPk(co.getEmail());
			mlist.add(member);
		}
		System.out.println(mlist);
		mav.addObject("mlist",mlist);
		
		mav.addObject("commentcount",totalCount);
		
		System.out.println("pageInfo : "+pageInfo);
		
		mav.addObject("pagingHtml",pageInfo.getPagingHtml());
		mav.addObject("pagingStatus", pageInfo.getPagingStatus());
		
		return mav;
	}
	
	@RequestMapping(value = "/insertComment.bo", method = RequestMethod.POST)
	@ResponseBody
	public void insert(
			@ModelAttribute("comment") CoComment comment
			) {
		int cnt = bcdao.insertComment(comment);
		System.out.println(cnt);
	}
	
	@RequestMapping(value = "/deleteComment.bo", method = RequestMethod.GET)
	@ResponseBody
	public void delete(
			@RequestParam("b_cnum") String b_cnum) {
		int cnt = bcdao.deleteComment(b_cnum);
		System.out.println(cnt);
	}
	
	@RequestMapping(value = "/selectComment.bo", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectComment(
			@RequestParam("b_cnum") int b_cnum) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		CoComment bean = bcdao.selectByPK(b_cnum);
		System.out.println(bean);
		mav.addObject("bean", bean);
		return mav;
	}
	
	@RequestMapping(value = "/updateComment.bo", method = RequestMethod.POST)
	@ResponseBody
	public void update(
			@RequestParam("b_cnum") String b_cnum,
			@RequestParam("content") String content
			) {
		System.out.println("b_cnum : "+b_cnum);
		System.out.println("content : "+content);
		int cnt = bcdao.updateComment(b_cnum, content);
		System.out.println(cnt);
	}
	
	

}
