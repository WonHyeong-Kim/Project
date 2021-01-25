package pack.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.product.model.ProductDaoInter;

@Controller
public class ProductDetailController {
	@Autowired
	private ProductDaoInter inter;
	
	@RequestMapping("product_detail")
	public ModelAndView detailProcess(@RequestParam("product_id") String product_id,
			@RequestParam("page") String page) {
		
		// 조회수 증가 작업 선행
		boolean b = inter.product_updateViews(Integer.parseInt(product_id));
		
		// 상세보기 진행 후 jsp로 출력
		ModelAndView view = new ModelAndView("product_detail");
		view.addObject("data", inter.getProductDetail(Integer.parseInt(product_id)));
		view.addObject("page", page);
		return view;
	}
}
