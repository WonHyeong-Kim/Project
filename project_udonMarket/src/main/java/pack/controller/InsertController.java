
package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;

@Controller
public class InsertController {
	
	@Autowired
	private BoardDaoInter boardInter;
	
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public String insert() {
		return "insform";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String submit(BoardBean bean) {
		bean.setBdate();
		int newNum = boardInter.currentNum() + 1; // 새로 작성된 글의 번호
		bean.setNum(newNum);
		bean.setGnum(newNum);
		
		boolean b= boardInter.insert(bean);
		if(b) {
			return "redirect:/list?page=1";
		}else {
			return "redirect:/error";
		}
	}
}
