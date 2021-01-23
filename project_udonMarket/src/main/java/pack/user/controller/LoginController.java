package pack.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@RequestMapping(value="login", method= RequestMethod.GET)
	public String login(HttpSession session) {
		System.out.println("a");
		if(session.getAttribute("id") == null) {
			return "login";
		}else {
			return "login";
		}
	}
	@RequestMapping(value="login", method= RequestMethod.POST)
	public String loginSubmit(HttpSession session,
			@RequestParam("id") String id,
			@RequestParam("pwd") String pwd) {
		if(id.equals("aa") && pwd.equals("11")) {
			session.setAttribute("id", id); // 30분
			// 유지시간 설정 필요.
			System.out.println("a");
			
			return "redirect:/jikwonlist.jsp";
		}else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 현재 클라이언트가 가진 모든 session의 내용을 초기화
		//session.removeAttribute("id"); // 현재 클라이언트가 가진 session 중 id key session만 초기화
		return "redirect:/index.jsp";
	}
}
