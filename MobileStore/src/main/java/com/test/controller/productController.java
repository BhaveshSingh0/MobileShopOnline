package com.test.controller;


import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.MobileDAO.CategoryDAO;
import com.test.MobileDAO.ProductDAO;
import com.test.MobileDAO.SellerDAO;
import com.test.MobileDTO.Product;
import com.test.MobileDTO.ProductDescp;
import com.test.utilityx.FileUploadTest;

@Controller
public class productController {
	

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private SellerDAO sellerDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	
	
	@RequestMapping(value="/update/product")
	public ModelAndView update(	@RequestParam("mobilename") String name){
		ModelAndView mv =  new ModelAndView("item");
		mv.addObject("clickOnAllProducts", true);
		mv.addObject("category", categoryDAO.listCat());
		mv.addObject("product", productDAO.getByName(name));
        return mv;
        
	}
	@RequestMapping(value="/show/product")
	public ModelAndView getall(	@RequestParam("mobilename") String name){
		ModelAndView mv =  new ModelAndView("item");
		mv.addObject("clickOnAllProducts", true);
		mv.addObject("category", categoryDAO.listCat());
		mv.addObject("product", productDAO.getByName(name));
        return mv;
        
	}
	
	 @RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("item");

		mv.addObject("clickOnAllProducts", true);
		mv.addObject("category", categoryDAO.listCat());

		mv.addObject("product", productDAO.listProduct());

		return mv;
	} 

	 
	@RequestMapping(value = "/productSave")
	public ModelAndView productSaveDescription(
			@RequestParam("productId") String id ,
			@RequestParam("SimType") String ST ,
			@RequestParam("warranty") int war ,
			@RequestParam("ram") int ram ,
			@RequestParam("rom") int  rom ,
			@RequestParam("color") String color ,
			@RequestParam("display") String disp ,
			@RequestParam("memory") int mem ,
			@RequestParam("frontCamera") String fc ,
			@RequestParam("backCamera") String  bc ) {
		
		ModelAndView mv = new ModelAndView("Admin");
		ProductDescp p = new ProductDescp();
		p.setBackCamera(bc);
		p.setColor(color);
		p.setDisplay(disp);
		p.setFrontCamera(fc);
		p.setRam(ram);
		p.setRom(rom);
		p.setProductId(id);
		p.setSimType(ST);
		p.setWarranty(war);
		p.setMemory(mem);
		
		
	   
        mv.addObject("seller", sellerDAO.listSeller());
		mv.addObject("category", categoryDAO.listCat());
		boolean val = productDAO.addPdescription(p);
		if (val == true) {
			mv.addObject("dataStored", true);
			mv.addObject("title", color);
		} else {

			
			mv.addObject("dataStored", false);
			mv.addObject("title", "Error !!");
		}
		return mv;
	}
  
	
	
	
	@RequestMapping(value="/{id}/{image}/deleteProduct")
	public ModelAndView  deletePro(@PathVariable("id") int id,@PathVariable("image") String id1){
      boolean val2 =false ;

      ModelAndView mv = new ModelAndView("AdminProduct");
  	
		boolean val = productDAO.deleteProduct(id);
		if(val == true){
		  val2 = productDAO.DeletePdescription(id1);
		}
		else{
		mv.addObject("dataStored", val);
		if (val == true  && val2 == true ) {
			mv.addObject("title", "Product Deleted Successfully");
		} else {
			mv.addObject("title", "Something Went Wrong ! May be Connection Failure");
		}
		}
		mv.addObject("category", categoryDAO.listCat());

		mv.addObject("product", productDAO.listProduct());
	  
		return mv;
	}
	
	
	
	@RequestMapping(value="/updateProduct1")
	public ModelAndView  update( @RequestParam("productName") String pn, @RequestParam("imagePath") String imagePath,
			@RequestParam("categoryId") int catId, @RequestParam("sellerId") int sId, @RequestParam("price") int price,
			@RequestParam("productCount") int pcount,
			@RequestParam("productId") int id ,
			@RequestParam("warranty") int war ,
			@RequestParam("ram") int ram ,
			@RequestParam("rom") int  rom ,
			@RequestParam("color") String color ,
			@RequestParam("display") String disp ,
			@RequestParam("memory") int mem ,
			@RequestParam("frontCamera") String fc ,
			@RequestParam("backCamera") String  bc) {
		
		 
		Product p1 = new Product();
		p1.setProductId(id);
		p1.setCategoryId(catId);
		p1.setProductName(pn);
		p1.setSellerId(sId);
        p1.setImagePath(imagePath);
        p1.setPrice(price);
		p1.setProductCount(pcount);
        p1.setActive(true);
        p1.setRating(2);
        
        boolean val = productDAO.updateProduct(p1);
        
        
		ProductDescp p = new ProductDescp();
		p.setBackCamera(bc);
		p.setColor(color);
		p.setDisplay(disp);
		p.setFrontCamera(fc);
		p.setRam(ram);
		p.setRom(rom);
		p.setProductId(imagePath);
		p.setSimType(null);
		p.setWarranty(war);
		p.setMemory(mem);
		ModelAndView mv = new ModelAndView("AdminProduct");
		mv.addObject("category", categoryDAO.listCat());

		mv.addObject("product", productDAO.listProduct());
	  
		if(val == true){
        	boolean  val2  = productDAO.updatePdescription(p);
        	if(val2 ==  true){
        		mv.addObject("title", "Product Updated Successfully");
        			
        	}
        	else{
        		
        		mv.addObject("title", "Error in Updating");
        		
        	}
        }
		
		
		
	return mv;
}
	@RequestMapping(value="/{id}/{image}/updateProduct")
	public ModelAndView  updatePro(@PathVariable("id") String id,@PathVariable("image") String i ) {
  
		ModelAndView mv = new ModelAndView("updateProduct");
		mv.addObject("product", productDAO.getByName(id));
		ProductDescp val = productDAO.viewproduct(i);
		mv.addObject("d", val);

		return mv;
	}
	
	
	
	
	
	@RequestMapping(value="/view/{id}/{name}/{image}")
	public ModelAndView viewProduct(@PathVariable("id") int id ,@PathVariable("image") String image , @PathVariable("name") String name){
		
		ProductDescp val = productDAO.viewproduct(image);
		if(val== null){
		ModelAndView mv = new ModelAndView("item");
		mv.addObject("clickOnAllProducts", true);
		mv.addObject("category", categoryDAO.listCat());

		mv.addObject("product", productDAO.listProduct());

		return mv;
		}
		else{
			ModelAndView mv = new ModelAndView("viewproduct");
			mv.addObject("singleP", val);
			mv.addObject("name", name);
			mv.addObject("id", id);	
			return mv;
		}
		
	}
	
	@RequestMapping(value = "/add/product", method = RequestMethod.POST)
	public ModelAndView addDetailProducts(@RequestParam("productName") String pn, @RequestParam("file") MultipartFile file,
			@RequestParam("categoryId") int catId, @RequestParam("sellerId") int sId, @RequestParam("price") int price,
			@RequestParam("productCount") int pcount, HttpServletRequest request) {

		
		String name = "";
		Product p = new Product();
		p.setCategoryId(catId);
		p.setProductName(pn);
		p.setSellerId(sId);
		p.setFile(file);
		p.setPrice(price);
		p.setProductCount(pcount);
		if (p.getFile() == null) {
			p.setImagePath("no");
		} else {
			name = pn + UUID.randomUUID().toString().substring(20).toUpperCase();
			p.setImagePath(name);
		}
		boolean val = productDAO.addProduct(p);
		FileUploadTest.uploadFile(request, p.getFile(), name);

		if (val == true) {
			ModelAndView mv = new ModelAndView("ProductDes");
			mv.addObject("pid",name );
			return mv;
		} else {

			ModelAndView mv = new ModelAndView("Admin");
			mv.addObject("seller", sellerDAO.listSeller());
			mv.addObject("category", categoryDAO.listCat());
			mv.addObject("title", "Something Went Wrong ! ");
			

			return mv;
		}

	}
}
