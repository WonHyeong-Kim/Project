
package pack.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.product.model.ProductDaoInter;

@Controller
public class ProductInsertController {
	
	@Autowired
	private ProductDaoInter Inter;
	
	@RequestMapping(value="product_insert", method = RequestMethod.GET)
	public String insert() {
		return "insform";
	}
	
	@RequestMapping(value="product_insert", method = RequestMethod.POST)
	public String submit(ProductBean bean) {
		bean.setWrite_date();
		int newNum = Inter.product_currentNum() + 1; // 새로 작성된 글의 번호
		bean.setProduct_id(newNum);
		
		boolean b= Inter.productInsert(bean);
		if(b) {
			return "redirect:/product_list?page=1";
		}else {
			return "redirect:/error";
		}
	}
}
