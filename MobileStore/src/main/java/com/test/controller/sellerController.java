package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.MobileDAO.CategoryDAO;
import com.test.MobileDAO.SellerDAO;
import com.test.MobileDTO.Seller;

@Controller
public class sellerController {

	//@Autowired
	//private ProductDAO productDAO;
	
	
	
	@Autowired
	private SellerDAO sellerDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "/add/supplier")
	public ModelAndView addSupplier(@ModelAttribute("Seller") Seller seller) {
		ModelAndView mv = new ModelAndView("Admin");

		boolean val = sellerDAO.addSeller(seller);
		mv.addObject("dataStored", val);
		if (val == true) {
			mv.addObject("title", "Supplier Added Successfully");
		} else {
			mv.addObject("title", "Something Went Wrong ! May be Connection Failure");
		}
        mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("category", categoryDAO.listCat());
		return mv;

	}

}
