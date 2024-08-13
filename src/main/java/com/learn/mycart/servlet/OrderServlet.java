/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Acer
 */
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

public class OrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            RazorpayClient razorpay = new RazorpayClient("rzp_test_uCCh8AWmDRBARS", "ypAlFeJcyEeTmMiIqOsLkYg6");

            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", 50000); // Amount in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_11");

            Order order = razorpay.orders.create(orderRequest);
           // System.out.println(orderRequest);

            String orderId = order.get("33333");
            request.setAttribute("orderId", orderId);
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
