package pack.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ChatAnnoInter {
	@Select("select chat_id, user_id, product_id, user_nickname from chat_room")
	public List<ChatRoomDto> select_all_chatRoom();
}
