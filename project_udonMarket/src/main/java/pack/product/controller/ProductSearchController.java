package pack.product.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;

@Controller
public class ProductSearchController {
	
	@Autowired
	private ProductDaoInter inter;
	
	@RequestMapping("productSearch")
	public ModelAndView productSearch(ProductBean bean) {
		// 상품 검색 후 리스트 리턴.
		
		return new ModelAndView("productList"); // key-value 추가 필요.
	}
}
