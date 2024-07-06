package com.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	private String categorytitle;
	private String categoryDescription;
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<>();
	
	public Category(String categorytitle, String categoryDescription, List<Product> products) {
		super();
		this.categorytitle = categorytitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}
	public Category(int categoryId, String categorytitle, String categoryDescription) {
		super();
		this.categoryId = categoryId;
		this.categorytitle = categorytitle;
		this.categoryDescription = categoryDescription;
	}
	public Category(String categorytitle, String categoryDescription) {
		super();
		this.categorytitle = categorytitle;
		this.categoryDescription = categoryDescription;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategorytitle() {
		return categorytitle;
	}
	public void setCategorytitle(String categorytitle) {
		this.categorytitle = categorytitle;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categorytitle=" + categorytitle + ", categoryDescription="
				+ categoryDescription + "]";
	}
	
}
