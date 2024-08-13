/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Acer
 */
@Entity
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10,name = "customer_id")
    private int customerId;
    @Column(length = 101,name = "customer_name")
    private String customerName;
    @Column(length = 101,name = "customer_email")
    private String customerEmail;
    @Column(length = 101,name = "customer_product")
    private String customerProduct;
    @Column(length = 13,name = "customer_phone")
    private String customerPhone;
    @Column(length = 1600,name = "customer_address")
    private String customerAddress;
    @Column(length = 1600,name ="customer_price")
    private String customerPrice;
    @Column(length = 16, name = "customer_quantity")
    private String customerQuantity;
   
   @Column(length = 161,name = "customer_amount")
    private String customerAmount;
   
     @Column(length = 161,name = "customer_pin")
    private String customerPin;
   
   

    public Customer(int customerId,String customerName, String customerEmail, String customerProduct, String customerPhone, String customerAddress, String customerPrice, String customerQuantity, String customerAmount,String customerPin) {
        this.customerId = customerId;
            
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerProduct = customerProduct;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.customerPrice = customerPrice;
        this.customerQuantity = customerQuantity;
        this.customerAmount = customerAmount;
        this.customerPin = customerPin;
    }

    public Customer(String customerName, String customerEmail, String customerProduct, String customerPhone, String customerAddress, String customerPrice, String customerQuantity, String customerAmount,String customerPin) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerProduct = customerProduct;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.customerPrice = customerPrice;
        this.customerQuantity = customerQuantity;
        this.customerAmount = customerAmount;
        this.customerPin = customerPin;
    }

      public int getCustomerId() {
        return  customerId;
    }

    public void setCustomerId(int  customerId) {
        this. customerId =  customerId;
    }

    
    public String getCustomerName() {
        return  customerName;
    }

    public void setCustomerName(String  customerName) {
        this. customerName =  customerName;
    }

    public String getCustomerEmail() {
        return  customerEmail;
    }

    public void setCustomerEmail(String  customerEmail) {
        this. customerEmail =  customerEmail;
    }

    public String getCustomerProduct() {
        return  customerProduct;
    }

    public void setCustomerProduct(String customerProduct) {
        this.customerProduct = customerProduct;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerPrice() {
        return customerPrice;
    }

    public void setCustomerPrice(String customerPrice) {
        this.customerPrice = customerPrice;
    }

    public String getCustomerQuantity() {
        return customerQuantity;
    }

    public void setCustomerQuantity(String customerQuantity) {
        this.customerQuantity = customerQuantity;
    }

    public String getCustomerAmount() {
        return customerAmount;
    }

    public void setCustomerAmount(String customerAmount) {
        this.customerAmount = customerAmount;
    }
    
    
      public String getCustomerPin() {
        return customerPin;
    }

    public void setCustomerPin(String customerPin) {
        this.customerPin = customerPin;
    }
    
    
    

    @Override
    public String toString() {
        return "Customer{"  + "  customerId=" + customerId + ",    customerPin=" + customerPin + ", customerName=" + customerName + ", customerEmail=" + customerEmail + ", customerProduct=" + customerProduct + ", customerPhone=" + customerPhone + ", customerAddress=" + customerAddress + ", customerPrice=" + customerPrice + ", customerQuantity=" + customerQuantity + ", customerAmount=" + customerAmount + '}';
    }

  

    
    
    
    
    
    
    
    }
    
    
    
    

