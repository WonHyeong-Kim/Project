package pack.product.model;

import java.util.ArrayList;

import pack.product.controller.ProductBean;

public interface ProductDaoInter {
	ArrayList<ProductDto> getProductList();
	ArrayList<ProductDto> getProductSearch(ProductBean bean);
	boolean productInsert(ProductBean bean);
	ProductDto getProductDetail(int product_id);
	boolean productUpdate(ProductBean bean);
	boolean productDelete(int product_id);
	
	int product_currentNum();
	int product_totalCnt();
	boolean product_updateViews(int product_id);
}
