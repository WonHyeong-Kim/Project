
package pack.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.product.model.ProductDaoInter;
import pack.upload.FileValidator;
import pack.upload.UploadFile;

@Controller
public class ProductInsertController {
	
	@Autowired
	private ProductDaoInter Inter;
	
	@RequestMapping(value="productInsert", method = RequestMethod.GET)
	public String insert() {
		return "productInsform";
	}
	
	@RequestMapping(value="productInsert", method = RequestMethod.POST)
	public String submit(ProductBean bean) {
		System.out.println(bean.getUser_id());
		bean.setUser_id("aaa"); // test 코드
		bean.setWrite_date();
		int newNum = Inter.product_currentNum() + 1; // 새로 작성된 글의 번호
		bean.setProduct_id(newNum);
		System.out.println(newNum);
		boolean b= Inter.productInsert(bean);
		if(b) {
			return "redirect:/productList?page=1";
		}else {
			return "redirect:/error";
		}
	}
}
