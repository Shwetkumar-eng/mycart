package com.learn.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    
   private int pId;
   private String pName;
   @Column(length = 300)
   private String pDesc;   
      private String pPhoto;
      private String pHyper;
      private int pPrice;
         private int pDiscount;
         private int pQuantity;
         @ManyToOne
private Catagory catagory;
         
         
         
    public Product() {
    }

    public Product(String pName, String pDesc, String pPhoto, String pHyper, int pPrice, int pDiscount, int pQuantity,Catagory catagory) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pHyper = pHyper;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.catagory=catagory;
    }
    

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

      public String getpHyper() {
        return pHyper;
    }

    public void setpHyper(String pHyper) {
        this.pHyper = pHyper;
    }
    
    
    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Catagory getCatagory() {
        return catagory;
    }

    public void setCatagory(Catagory catagory) {
        this.catagory = catagory;
    }

    
    
    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pHyper=" + pHyper + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
         
         
         
public int getPriceAfterApplyingDiscount()         
{
int d=(int)((this.getpDiscount()/100.0)*this.getpPrice());
return this.getpPrice()-d;

}
         
         
         
         
}
