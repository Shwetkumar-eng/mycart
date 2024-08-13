/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlet;

import com.learn.mycart.dao.CatagoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Catagory;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {


String op=request.getParameter("operation");
if(op.trim().equals("addcatagory"))
{

//fetching catagory data

String title=request.getParameter("catTitle");
String description=request.getParameter("catDescription");

Catagory catagory=new Catagory();
catagory.setCatagoryTitle(title);
catagory.setCatagoryDescription(description);

CatagoryDao catagorydao=new CatagoryDao(FactoryProvider.getFactory());
int catId=catagorydao.saveCatagory(catagory);
//out.println("catagory saved");=request.getSession();
HttpSession httpSession=request.getSession();
httpSession.setAttribute("message"," Category added successfully"+catId);

response.sendRedirect("admin.jsp");
return;
}else if(op.trim().equals("addproduct"))
{
String pname=request.getParameter("pName");
String pdesc=request.getParameter("pDescription");
int pprice=Integer.parseInt(request.getParameter("pPrice"));
int pdiscount=Integer.parseInt(request.getParameter("pDiscount"));
int pquantity=Integer.parseInt(request.getParameter("pQuantity"));
int catid=Integer.parseInt(request.getParameter("catId"));
    Part part=request.getPart("pPic");
    Part part1=request.getPart("plink");
    
    Product p=new Product();
    p.setpName(pname);
    p.setpDesc(pdesc);
    p.setpPrice(pprice);
    p.setpDiscount(pdiscount);
    p.setpQuantity(pquantity);
    p.setpPhoto(part.getSubmittedFileName());
    p.setpHyper(part1.getSubmittedFileName());
    
    
    //get catagory by id
    CatagoryDao cdao=new CatagoryDao(FactoryProvider.getFactory());
    Catagory catagory=cdao.getCatagoryById(catid);
    
    p.setCatagory(catagory);
    //product save
    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
    pdao.saveProduct(p);

//pic upload

String path=request.getContextPath();
    System.out.println("path");
   
    
HttpSession httpSession=request.getSession();
httpSession.setAttribute("message"," Product is added successfully");

response.sendRedirect("admin.jsp");
return;
    
    
}


        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
