package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;

@Controller
public class DetailController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping("detail")
	public ModelAndView detailProcess(@RequestParam("num") String num,
			@RequestParam("page") String page) {
		
		// 조회수 증가 작업 선행
		boolean b = inter.updateReadcnt(num);
		
		// 상세보기 진행 후 jsp로 출력
		ModelAndView view = new ModelAndView("detail");
		view.addObject("data", inter.getDetail(num));
		view.addObject("page", page);
		return view;
		
	}
}
