package pack.user.model;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.user.controller.UserBean;

@Repository
public class UserImpl extends SqlSessionDaoSupport implements UserDaoInter {

	@Autowired
	public UserImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	
	@Override
	public UserDto getLoginInfo(String user_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectLoginData", user_id);
	}


	@Override
	public int check_id(String user_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("check_id", user_id);
	}


	@Override
	public boolean join_user(UserBean bean) {
		int re=getSqlSession().insert("join_user", bean);
		if(re>0)
			return true;
		else
			return false;
	}
	


}
