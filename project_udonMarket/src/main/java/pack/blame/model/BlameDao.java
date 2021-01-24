package pack.blame.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BlameDao extends SqlSessionDaoSupport{
	public BlameDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	public List<BlameDto> getBlameList(){
		List<BlameDto> list = getSqlSession().selectList("selectListBlame");
		return list;
	}
	public BlameDto blameOne(String blame_id) {
		BlameDto dto = getSqlSession().selectOne("selectoneBlame", blame_id);
		return dto;
	}
	public boolean insertBlame(BlameBean bean) {
		int result = getSqlSession().insert("insertBlame", bean);
		
		if(result!=0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean updateBlame(BlameBean bean) {
		int result = getSqlSession().update("updateBlame", bean);
		if(result!=0) {
			return true;
		}else {
			return false;
		}
	}
}
