package pack.blame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.blame.model.BlameBean;
import pack.blame.model.BlameDao;
import pack.blame.model.BlameDto;

@Controller
public class BlameController {
	
	@Autowired
	private BlameDao dao;
	
	@RequestMapping(value = "blame", method = RequestMethod.GET)//신고 입력 페이지로
	public String blameinput() {
		return "blame";
	}
	@RequestMapping(value = "blame", method = RequestMethod.POST)// 신고 입력 처리
	public String blameInsert(BlameBean bean) {
		boolean success = dao.insertBlame(bean);
		
		if(success) {
			return "redirect:/blamelist";
		}else {
			return "blame";
		}
	}///////
	@RequestMapping("blamelist")
	public ModelAndView blameList() {// 신고 리스트 보기
		List<BlameDto> list = dao.getBlameList();
		ModelAndView view = new ModelAndView();
		view.addObject("list", list);
		view.setViewName("blamelist");
		
		return view;
	}
	
	@RequestMapping("detail")
	public ModelAndView blameDetail(@RequestParam("blame_id") String blame_id) {//신고 정보 보기
		BlameDto dto = dao.blameOne(blame_id);
		ModelAndView view = new ModelAndView();
		view.setViewName("blameDetail");
		view.addObject("data", dto);
		return view;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView blameUpdate(@RequestParam("blame_id") String blame_id) {
		BlameDto dto = dao.blameOne(blame_id);
		ModelAndView view = new ModelAndView();
		view.addObject("data", dto);
		view.setViewName("updateform");
		return view;
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String blameUpdateResult(BlameBean bean) {
		boolean success = dao.updateBlame(bean);
		
		if(success) {
			return "redirect:/blamelist";
		}else {
			return "updateform";
		}
	}
}
