package pack.chat.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDao {
	
	@Autowired
	private ChatAnnoInter inter;
	
	public List<ChatRoomDto> select_all_chatRoom(){
		return inter.select_all_chatRoom();
	}
}