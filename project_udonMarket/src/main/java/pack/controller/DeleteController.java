package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.BoardDto;

@Controller
public class DeleteController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping("delete")
	public ModelAndView del(@RequestParam("num") String num,
			@RequestParam("page") String page,
			@RequestParam("pass") String pass) {
		BoardDto dto = inter.getDetail(num);
		ModelAndView view = new ModelAndView();
		System.out.println(pass);
		if(dto.getPass().equalsIgnoreCase(pass)) { // 사용자 비밀번호와 db의 비밀번호 비교
			boolean b = inter.delete(num);
			if(b) {
				view.setViewName("redirect:/list?page="+page);
			}else {
				view.setViewName("redirect:/error");
			}
		}else {
			view.setViewName("detail");
			view.addObject("data", dto);
			view.addObject("msg", "비밀번호 불일치");
			view.addObject("page", page);
		}
		return view;
	}
	
	/*
	@RequestMapping("delete")
	public ModelAndView del(@RequestParam("num") String num,
			@RequestParam("page") String page) {
		BoardDto dto = inter.getDetail(num);
		ModelAndView view = new ModelAndView();
		
		if(dto.getPass().equalsIgnoreCase(dto.pass)) { // 사용자 비밀번호와 db의 비밀번호 비교
			boolean b = inter.delete(num);
			if(b) {
				view.setViewName("redirect:/list?page="+page);
			}else {
				view.setViewName("redirect:/error");
			}
		}else {
			view.setViewName("list");
			view.addObject("msg", "비밀번호 불일치");
			view.addObject("page", page);
		}
		return view;
	}
	*/
}
