package pack.user.controller;

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
				session.setAttribute("password", rePassword);
				//성공적으로 로그인하였다는 메시지 모달창 발생 필요. 메인 페이지로 접속.
				return "redirect:/index.jsp";
			}else {
				//비밀번호가 틀렸다는 메시지 모달창 발생 필요. 다시 로그인 창으로 접속.
				return "redirect:/login.jsp";
			}
		}else {
			//아이디가 없다는 메시지 모달창 발생 필요. 다시 로그인 창으로 접속.
			return "redirect:/login.jsp"; 
		}
		
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 현재 클라이언트가 가진 모든 session의 내용을 초기화
		//session.removeAttribute("id"); // 현재 클라이언트가 가진 session 중 id key session만 초기화
		return "redirect:/index.jsp";
	}
}
