package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.MobileDAO.CategoryDAO;
import com.test.MobileDAO.ProductDAO;
import com.test.MobileDAO.SellerDAO;



@Controller
public class PageController {

	
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private SellerDAO sellerDAO;
 
	@Autowired
	private HttpSession session;
	
	
	@Autowired
	private CategoryDAO categoryDAO;

	

	@RequestMapping(value = "/signin")
	public ModelAndView signup(){
		ModelAndView mv = new ModelAndView("login");
		return  mv ;
	}
	
	
	@RequestMapping(value = "/login")
	public ModelAndView login() {		
		ModelAndView mv = new ModelAndView("login");
		// add the user model
				
		
		    //  GlobalController c = new GlobalController();
	    	//c.getUserModel();
	        mv.addObject("title","Login");
            return mv;				
	}	

	
	
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		
		// destroys all the session object
		session.invalidate();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth!=null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
				
		return "redirect:/login?logout";
	}
	
	

	@RequestMapping(value = "/signup")
	public ModelAndView singUp() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}

	@RequestMapping(value = { "/", "index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index");
        session.setAttribute("pro", productDAO.listProduct());
		mv.addObject("category", categoryDAO.listCat());
      
     	
		return mv;
	}
	
	
	

	@RequestMapping(value = "/Admin")
	public ModelAndView admin() {
		ModelAndView mv = new ModelAndView("Admin");

		mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("category", categoryDAO.listCat());

		return mv;
	}

	
	@RequestMapping(value = "/Admin/Product")
	public ModelAndView adminp() {
		ModelAndView mv = new ModelAndView("AdminProduct");
		// mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("product", productDAO.listProduct());

		return mv;
	}

	
	@RequestMapping(value = "/Admin/Seller")
	public ModelAndView adminS() {
		ModelAndView mv = new ModelAndView("AdminSeller");

		mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("category", categoryDAO.listCat());

		return mv;
	}

	@RequestMapping(value = "/Admin/Category")
	public ModelAndView adminC() {
		ModelAndView mv = new ModelAndView("AdminCategory");

		mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("category", categoryDAO.listCat());

		return mv;
	}

	@RequestMapping(value = "/About")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("about");
		mv.addObject("category4", "");
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("contact");
		mv.addObject("category3", "");
		return mv;
	}

	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "403 - Access Denied");
		mv.addObject("errorTitle", "Aha! Caught You.");
		mv.addObject("errorDescription", "You are not authorized to view this page!");
		return mv;
	}

}