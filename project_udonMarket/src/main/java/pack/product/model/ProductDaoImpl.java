package pack.product.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.product.controller.ProductBean;


@Repository
public class ProductDaoImpl extends SqlSessionDaoSupport implements ProductDaoInter {
	
	@Autowired
	public ProductDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public ArrayList<ProductDto> getProductList() {
		return (ArrayList)getSqlSession().selectList("selectProductList");
	}

	@Override
	public ArrayList<ProductDto> getProductSearch(ProductBean bean) {
		return (ArrayList)getSqlSession().selectList("searchProductList", bean);
	}

	@Override
	public boolean productInsert(ProductBean bean) {
		int result = getSqlSession().insert("insertProductData",bean);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public ProductDto getProductDetail(int product_id) {
		// 글 내용보기, 글 수정 시 데이터 받아오기
		return getSqlSession().selectOne("selectOneProduct",product_id);
	}

	@Override
	public boolean productUpdate(ProductBean bean) {
		try {
			int result = getSqlSession().update("updateProductData", bean);
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
	public boolean productDelete(int product_id) {
		try {
			int result = getSqlSession().delete("deleteProductData", product_id);
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
	public int product_currentNum() {
		//insert시 번호 자동 증가를 위해 현재 레코드 중 가장 큰 번호 얻기.
		if(getSqlSession().selectOne("currentProductNum") == null) {
			return 0;
		}else {
			return getSqlSession().selectOne("currentProductNum");
		}
	}

	@Override
	public int product_totalCnt() {
		return getSqlSession().selectOne("totalCnt");
	}

	@Override
	public boolean product_updateViews(int product_id) {
		//상세보기 전 조회수 증가
		int result = getSqlSession().update("updateViews",product_id);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

}
