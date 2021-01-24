package pack.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.chat.model.ChatRoomDao;
import pack.chat.model.ChatRoomDto;

@Controller
public class ChatController {
	
	@Autowired
	private ChatRoomDao chatRoomDao; 
	
	@RequestMapping("chat")
	public ModelAndView chatControl() {
		System.out.println("chat");
		List<ChatRoomDto> list = chatRoomDao.select_all_chatRoom(); 
		return new ModelAndView("chat","list",list);
	}
}
