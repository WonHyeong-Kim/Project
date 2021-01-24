package pack.user.model;

import pack.user.controller.UserBean;

public interface UserDaoInter {
	int check_id(String user_id);//중복아이디 검사
	boolean join_user(UserBean bean); // 가입하기 
	UserDto getLoginInfo(String user_id); //조인포인트 대상
}
