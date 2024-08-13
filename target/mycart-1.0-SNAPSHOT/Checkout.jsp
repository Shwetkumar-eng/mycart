<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%
User user=(User)session.getAttribute("current-user");
if(user==null)
{
session.setAttribute("message", "you are not login that's why you are not access checkout page");
response.sendRedirect("login.jsp");
return;

} 






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
        <div class="container">
            <div class="row mt-5">   
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Items</h3>
                            <div class="cart-body"></div>
                            
                        </div>
                        
                        
                    </div> 
                    
                    
                </div>
            
                
                
                 <div class="col-md-6">
                <!--form details-->
                    
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Detail For Order</h3>
                            <form action="BuyServlet" method="post"> 
                                
                               <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="customer_eamil" value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>  
                                
                                
                                 <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input name="customer_name"  value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
    
  </div>
                                
                                
               <label for="exampleFormControlTextarea1">Enter Your Shipping Address</label>
               <input  textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" rows="3"></textarea>
  </div>                 
                                              
                        <div class="form-group">
    <label for="exampleInputEmail1">Phone number</label>
    <input  value="<%=user.getUserPhone()%>" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter phone number">
    
        <div class="form-group">
    <label for="exampleInputEmail1">Pin Code</label>
    <input name="customer_pin"  value="" type="text"  class="form-control" id="pin" aria-describedby="emailHelp" placeholder="Enter Your Pin Code">
                        </div>
    
 
                        <div class="container text-center">
                               <button  class="btn btn-outline-success mt-1" >Order</button> 
                            <a href="index.jsp"  <button class="btn btn-outline-primary mt-1" >Continue shopping</button>
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
