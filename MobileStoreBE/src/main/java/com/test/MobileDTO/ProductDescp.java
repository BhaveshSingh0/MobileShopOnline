package com.test.MobileDTO;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class ProductDescp {
	
	private String frontCamera ;
	private String backCamera;
	private String color ;
	
	private String SimType ;
	private int warranty ;
	private int ram;
	private String display ;
	private int rom ;
	
	
	
	
	@Id
	private String productId;
	
	private int memory;
	public int getMemory() {
		return memory;
	}
	public void setMemory(int memory) {
		this.memory = memory;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getFrontCamera() {
		return frontCamera;
	}
	public void setFrontCamera(String frontCamera) {
		this.frontCamera = frontCamera;
	}
	public String getBackCamera() {
		return backCamera;
	}
	public void setBackCamera(String backCamera) {
		this.backCamera = backCamera;
	}
	public int getWarranty() {
		return warranty;
	}
	public void setWarranty(int warranty) {
		this.warranty = warranty;
	}
	public int getRam() {
		return ram;
	}
	public void setRam(int ram) {
		this.ram = ram;
	}
	public int getRom() {
		return rom;
	}
	public void setRom(int rom) {
		this.rom = rom;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSimType() {
		return SimType;
	}
	public void setSimType(String simType) {
		SimType = simType;
	}
	
	
	

}
