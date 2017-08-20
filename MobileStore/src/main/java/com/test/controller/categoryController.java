package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.MobileDAO.CategoryDAO;
import com.test.MobileDAO.ProductDAO;
import com.test.MobileDAO.SellerDAO;
import com.test.MobileDTO.Category;

@Controller
public class categoryController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private SellerDAO sellerDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	
	@RequestMapping(value = "/Admin/add/category")
	public ModelAndView addCatgeory(@RequestParam("name") String name, @RequestParam("desc") String desc) {
		ModelAndView mv = new ModelAndView("Admin");
		Category c = new Category();
		c.setName(name);
		c.setDescription(desc);
		c.setActive(true);

		boolean val = categoryDAO.add(c);
		mv.addObject("dataStored", val);

		mv.addObject("seller", sellerDAO.listSeller());

		mv.addObject("category", categoryDAO.listCat());

		if (val == true) {
			mv.addObject("title", "Category Added Successfully");
		} else {
			mv.addObject("title", "Something Went Wrong ! May be Connection Failure");
		}
		return mv;
	}

	// Delete

	
	@RequestMapping(value = "/Admin/deleteCategory/{id}")
	public ModelAndView deleteCategory(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("Admin");
		boolean val = categoryDAO.deleteCategory(id);

		mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("category", categoryDAO.listCat());
		mv.addObject("dataStored", val);
		if (val == true) {
			mv.addObject("title", "Category Deleted Successfully");
		} else {
			mv.addObject("title", "Something Went Wrong ! May be Connection Failure");
		}

		return mv;
	}

	// category by Id

	
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProduct(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("item");
		Category cat = null;
		cat = categoryDAO.get(id);
		mv.addObject("title", cat.getName());
		mv.addObject("clickOnCategory", true);
		mv.addObject("idCat", id);
        
		mv.addObject("product", productDAO.listProduct());

		mv.addObject("category", categoryDAO.listCat());
		return mv;
	}

}
