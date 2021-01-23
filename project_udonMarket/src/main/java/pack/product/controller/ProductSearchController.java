package pack.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductSearchController {
	
	@RequestMapping("productSearch")
	public ModelAndView productSearch() {
		// 상품 검색 후 리스트 리턴.
		
		return new ModelAndView("productList"); // key-value 추가 필요.
	}
}
