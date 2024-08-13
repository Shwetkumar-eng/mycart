<%-- 
    Document   : order
    Created on : 27-May-2024, 9:08:11 am
    Author     : Acer
--%>

<%@page import="com.learn.mycart.entities.Catagory"%>
<%@page import="com.learn.mycart.dao.CatagoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <%@include file="componentss/common_css_js.jsp" %>

    </head>
    <body>
           <%@include file="componentss/nabvar.jsp" %>
        
        
        <hr/>
        
      
      
        <div class="container text-center">
            
                 <h3>Your Product Successfully Ordered</h3>
            
        </div>
           <%@include file="componentss/comman modal.jsp"%>
    </body>
</html>
