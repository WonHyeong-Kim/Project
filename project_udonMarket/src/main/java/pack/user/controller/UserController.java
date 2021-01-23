package pack.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	
	@RequestMapping(value="userInsert", method = RequestMethod.GET)
	public String userInsert() {
		return "user_insert";
	}

}
