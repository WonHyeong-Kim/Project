package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;

@Controller
public class ReplyController {
	
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping(value="reply", method=RequestMethod.GET)
	public ModelAndView reply(@RequestParam("num") String num,
			@RequestParam("page") String page) {
		ModelAndView view = new ModelAndView("reply");
		view.addObject("data", inter.getDetail(num)); // 원글의 데이터
		return view;
	}
	
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String replySubmit(BoardBean bean,
			@RequestParam("page") String page) {
		// onum 갱신
		bean.setOnum(bean.getOnum() + 1);
		inter.updateOnum(bean); // 반환값 처리 필요.
		
		// 댓글 저장
		bean.setBdate(); // 작성일 set
		bean.setNum(inter.currentNum() + 1); // 새로운 글의 번호
		bean.setNested(bean.getNested() + 1); // 들여쓰기
		
		if(inter.insertReply(bean)) {
			return "redirect:list?page="+page; // 추가 후 글 목록 보기			
		}else {
			return "redirect:error";
		}
		
	}
}
