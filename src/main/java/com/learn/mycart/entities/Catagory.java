
package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Catagory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int catagoryId;
    private String catagoryTitle;
     private String catagoryDescription;
     @OneToMany(mappedBy = "catagory")
     private List<Product> products=new ArrayList<>();
     
     

    public Catagory(int catagoryId, String catagoryTitle, String catagoryDescription) {
        this.catagoryId = catagoryId;
        this.catagoryTitle = catagoryTitle;
        this.catagoryDescription = catagoryDescription;
        
        
        
    }

    public Catagory() {
    }

    public Catagory(String catagoryTitle, String catagoryDescription,List<Product>products) {
        this.catagoryTitle = catagoryTitle;
        this.catagoryDescription = catagoryDescription;
        this.products=products;
    }

    public int getCatagoryId() {
        return catagoryId;
    }

    public void setCatagoryId(int catagoryId) {
        this.catagoryId = catagoryId;
    }

    public String getCatagoryTitle() {
        return catagoryTitle;
    }

    public void setCatagoryTitle(String catagoryTitle) {
        this.catagoryTitle = catagoryTitle;
    }

    public String getCatagoryDescription() {
        return catagoryDescription;
    }

    public void setCatagoryDescription(String catagoryDescription) {
        this.catagoryDescription = catagoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    
    @Override
    public String toString() {
        return "Catagory{" + "catagoryId=" + catagoryId + ", catagoryTitle=" + catagoryTitle + ", catagoryDescription=" + catagoryDescription + '}';
    }
     
     
     
}
