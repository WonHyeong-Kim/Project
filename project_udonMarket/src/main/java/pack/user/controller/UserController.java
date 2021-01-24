package pack.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.user.model.UserDaoInter;

@Controller
public class UserController {
	@Autowired
	private UserDaoInter inter;
	
	@RequestMapping(value = "userInsert", method = RequestMethod.GET)
	public String userJoin() {
		return "user_insert";
	}
	
	@RequestMapping(value = "userInsert", method = RequestMethod.POST)
	public String writeSubmit(UserBean bean) {
		
		boolean b = inter.join_user(bean);
		if(b) {
			return "redirect:/login";
		}else {
			return "redirect:/index.jsp";
		}

	}
	
	@RequestMapping(value="idChk", method = RequestMethod.GET)
	@ResponseBody
	public int idChk(@RequestParam("user_id") String user_id) {
		
		return inter.check_id(user_id);
	}
	
	
}
