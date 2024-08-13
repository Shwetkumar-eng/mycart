<%-- 
    Document   : buy
    Created on : 22-May-2024, 7:52:37 am
    Author     : Acer
--%>


<%@page import="com.learn.mycart.entities.User"%>
<%
    
User user=(User)session.getAttribute("current-user");
if(user==null)
{
session.setAttribute("message", "you are not login that's why you are not access checkout page");
response.sendRedirect("login.jsp");
return;

} 



String name=request.getParameter("name");
String price=request.getParameter("price");

%>





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
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                          
                        <div class="container">
                            
                             
                            <form action="BuyServlet" method="post" > 
                                
                               <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="customer_email"  value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>  
                                
                                
                                 <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input name="customer_name"  value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
    
  </div>
    
        <div class="form-group">
    <label for="exampleInputEmail1">Product name</label>
    <input name="customer_product"  value="<%=name%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
    
  </div>
    
    
    
    
    
    <div>         
                                
               <label for="exampleFormControlTextarea1">Enter Your Shipping Address</label>
               <input name="customer_address"   textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" rows="3"></textarea>
  </div>                 
                                              
                        <div class="form-group">
    <label for="exampleInputEmail1">Phone number</label>
    <input name="customer_phone"  value="<%=user.getUserPhone()%>" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter phone number">
                        </div>
 
                            <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input name="customer_price"  value="<%=price%>" type="number" class="form-control" id="price" aria-describedby="emailHelp" placeholder="<%=price%>">
                        </div>
                        
                        
                            <div class="form-group">
    <label for="exampleInputEmail1">Quantity</label>
    <input name="customer_quantity"    value="" type="number" class="form-control" id="quantity" aria-describedby="emailHelp" placeholder="Quantity" onblur="getTotalPrice()">
                        </div>
                        
                        
                        
                            <div class="form-group">
    <label for="exampleInputEmail1">Total Amount</label>
    <input name="customer_amount"  value="total" type="text"  class="form-control" id="total" aria-describedby="emailHelp" placeholder="Total amount">
                        </div>
                        
                        
                          <div class="form-group">
    <label for="exampleInputEmail1">Pin Code</label>
    <input name="customer_pin"  value="" type="text"  class="form-control" id="pin" aria-describedby="emailHelp" placeholder="Enter Your Pin Code">
                        </div>
                        
                        
                        <div class="container text-center">
                              <button type="submit" class="btn btn-outline-success mt-1" > Order </button>
                            <a href="index.jsp"   <button class="btn btn-outline-primary mt-1" >Continue shopping</button>
                            </a>
                        </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            <%@include file="componentss/comman modal.jsp"%>
    </body>
</html>

<script>
    function getTotalPrice()
{
    console.log("sss");
   

 
 qty=parseInt(document.getElementById('quantity').value);
 
price=parseInt(document.getElementById('price').value);
   if(qty==0){
    alert("fill quantity");
}
else{
 total=qty*price;
 
 
 document.getElementById('total').value=total.toString();
}}
    </script>