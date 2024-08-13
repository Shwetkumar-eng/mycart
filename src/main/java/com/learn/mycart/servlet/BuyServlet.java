/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlet;


import com.learn.mycart.entities.Customer;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
         

/**
 *
 * @author Acer
 */
public class BuyServlet extends HttpServlet {

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
        
            
            
            /* TODO output your page here. You may use following sample code. */
            try{
               
          
          String customerEmail= request.getParameter("customer_email");
           String customerName= request.getParameter("customer_name");
            String customerAddress= request.getParameter("customer_address");
            String customerProduct= request.getParameter("customer_product");
            String customerPhone=request.getParameter("customer_phone");
              String customerPrice=request.getParameter("customer_price");
              String customerQuantity=request.getParameter("customer_quantity");
              String customerAmount=request.getParameter("customer_amount");
              String customerPin=request.getParameter("customer_pin");
               
                    if(customerName.isEmpty()){
                     out.println("customer is blank");
                     return;
                     }
                
                 Customer customer=new  Customer (customerEmail,customerName,customerProduct,customerPhone,customerAddress,customerPrice,customerQuantity,customerAmount,customerPin);
                Session hibernateSession=FactoryProvider.getFactory().openSession();
                 Transaction tx=hibernateSession.beginTransaction();
                     
         int customerId= (int) hibernateSession.save(customer);
                 
                tx.commit();
                hibernateSession.close();
              
                HttpSession httpSession=request.getSession();
               
                     httpSession.setAttribute("message", "Registrarion Successful ||");
                response.sendRedirect("order.jsp");
                return;
                
               
               
               
            }
            catch(Exception e) {
                          e.printStackTrace();

        
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
