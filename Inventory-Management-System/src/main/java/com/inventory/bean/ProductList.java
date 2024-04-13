package com.inventory.bean;

public class ProductList {

	private int product_id;
	private String product_name;
	private int purchased_qty;
	private int buy_price;
	private int price_per_qty;
	private int sell_price;
	private int alert;
	public ProductList(int product_id, String product_name, int purchased_qty, int buy_price, int price_per_qty,
			int sell_price, int alert) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.purchased_qty = purchased_qty;
		this.buy_price = buy_price;
		this.price_per_qty = price_per_qty;
		this.sell_price = sell_price;
		this.alert = alert;
	}
	public ProductList(String product_name, int purchased_qty, int buy_price, int price_per_qty, int sell_price,
			int alert) {
		super();
		this.product_name = product_name;
		this.purchased_qty = purchased_qty;
		this.buy_price = buy_price;
		this.price_per_qty = price_per_qty;
		this.sell_price = sell_price;
		this.alert = alert;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPurchased_qty() {
		return purchased_qty;
	}
	public void setPurchased_qty(int purchased_qty) {
		this.purchased_qty = purchased_qty;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public int getPrice_per_qty() {
		return price_per_qty;
	}
	public void setPrice_per_qty(int price_per_qty) {
		this.price_per_qty = price_per_qty;
	}
	public int getSell_price() {
		return sell_price;
	}
	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}
	public int getAlert() {
		return alert;
	}
	public void setAlert(int alert) {
		this.alert = alert;
	}
	
	
	
	
}
