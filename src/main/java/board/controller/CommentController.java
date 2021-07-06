package board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.CoComment;
import bean.Member;
import common.controller.SuperClass;
import dao.BoardCommentDao;
import dao.MemberDao;

@Controller
public class CommentController extends SuperClass {

	
	@Autowired
	@Qualifier("bcdao")
	private BoardCommentDao bcdao;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
		
	@RequestMapping(value="/readComment.bo", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyList(
			@RequestParam("co_seq") int co_seq){
		ModelAndView mav = new ModelAndView("jsonView");
		List<CoComment> list = bcdao.readComment(co_seq);
		System.out.println(list);
		mav.addObject("list", list);
		
		List<Member> mlist = new ArrayList<Member>();
		for(CoComment co : list) {
			Member member = mdao.SelectDataByPk(co.getEmail());
			System.out.println(member.getPhoto());
			mlist.add(member);
		}
		System.out.println(mlist);
		mav.addObject("mlist",mlist);
		
		mav.addObject("commentcount",list.size());
		
		return mav;
	}

}
