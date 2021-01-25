package pack.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.user.model.UserDaoInter;
import pack.user.model.UserDto;

@Controller
public class LoginController {
	@Autowired
	private UserDaoInter userDaoInterinter;
	
	@RequestMapping(value="login", method= RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("id") == null) {
			return "login";
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value= "login", method=RequestMethod.POST)
	public String submitLogin(HttpSession session,
			@RequestParam("user_id") String user_id,
			@RequestParam("password") String password) { 
		//세션만들기
		UserDto userDto = userDaoInterinter.getLoginInfo(user_id);
		
		if(userDto != null) {
			String rePassword = userDto.getPassword();
			if(rePassword.equals(password)) { 
				session.setAttribute("userDto", userDto);
				return "redirect:/index.jsp";
			}else {
				//아이디 또는 비밀번호가 틀렸다는 메시지 모달창 발생 필요. 다시 로그인 창으로 접속.
				return "redirect:/login";
			}
		}else {
			//아이디가 없다는 메시지 모달창 발생 필요. 다시 로그인 창으로 접속.
			return "redirect:/login"; 
		}
		
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();; 
		return "redirect:/index.jsp";
	}
}
