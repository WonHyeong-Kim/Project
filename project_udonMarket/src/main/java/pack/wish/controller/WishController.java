package pack.wish.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WishController {
	
	@RequestMapping(value="wish", method=RequestMethod.GET)
	public String wishController() {
		return "wishlist";
	}
	
	@RequestMapping(value="wishAdd", method=RequestMethod.GET)
	public String wishAdd(@RequestParam("product_id") String product_id,
			@RequestParam("user_id") String user_id) {
		
		
		return "wishlist";
	}
}
