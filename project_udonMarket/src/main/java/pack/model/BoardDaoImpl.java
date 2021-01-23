package pack.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.BoardBean;

@Repository
public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDaoInter {
	
	@Autowired
	public BoardDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public ArrayList<BoardDto> getList() {
		return (ArrayList)getSqlSession().selectList("selectList");
	}

	@Override
	public ArrayList<BoardDto> getSearch(BoardBean bean) {
		return (ArrayList)getSqlSession().selectList("searchList", bean);
	}

	@Override
	public boolean insert(BoardBean bean) {
		int result = getSqlSession().insert("insertData",bean);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public BoardDto getDetail(String num) {
		// 글 내용보기, 글 수정 시 데이터 받아오기
		return getSqlSession().selectOne("selectOne",num);
	}

	@Override
	public boolean update(BoardBean bean) {
		try {
			int result = getSqlSession().update("updateData", bean);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("update err"+e);
			return false;
		}
	}

	@Override
	public boolean delete(String num) {
		try {
			int result = getSqlSession().delete("deleteData", num);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("delete err"+e);
			return false;
		}
	}

	@Override
	public int currentNum() {
		//insert시 번호 자동 증가를 위해 현재 레코드 중 가장 큰 번호 얻기.
		if(getSqlSession().selectOne("currentNum") == null) {
			return 0;
		}else {
			return getSqlSession().selectOne("currentNum");
		}
	}

	@Override
	public int totalCnt() {
		return getSqlSession().selectOne("totalCnt");
	}

	@Override
	public boolean updateReadcnt(String num) {
		//상세보기 전 조회수 증가
		int result = getSqlSession().update("updateReadcnt",num);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public String selectPass(String num) { // 수정용 : 비밀 번호 비교
		return getSqlSession().selectOne("selectPass", num);
	}
	
	@Override
	public boolean updateOnum(BoardBean bean) {
		//댓글에서 onum 갱신
		int result = getSqlSession().update("updateOnum", bean);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean insertReply(BoardBean bean) {
		try {
			int result = getSqlSession().insert("insertReData", bean);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("insertReply err"+e);
			return false;
		}
	}

}
