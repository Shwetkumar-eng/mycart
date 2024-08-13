<%-- 
    Document   : index
    Created on : 12-Mar-2024, 11:00:44 pm
    Author     : Acer
--%>

<%@page import="com.learn.mycart.entities.Catagory"%>
<%@page import="com.learn.mycart.dao.CatagoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sanjeevini Herbs Website</title>
       <%@include file="componentss/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="componentss/nabvar.jsp" %>
        
        <div class="row mt-3 mx-2">
            
            
            <%
                String cat=request.getParameter("catagory");
//               out.println(cat);
            ProductDao dao=new ProductDao(FactoryProvider.getFactory()); 
            List<Product> list=null;
           
         if(cat==null || cat.trim().equals("all"))
          {   
        list =dao.getAllProducts(); 
        
          }else{
           int cid= Integer.parseInt(cat.trim());
          list= dao.getAllProductsById(cid);
            
            
            }
   
          
               
        
            CatagoryDao cdao=new CatagoryDao(FactoryProvider.getFactory());
            List<Catagory> clist=cdao.getCatagories();

            %>
            
            <div class="col-md-2">
               <div class="list-group">
                    
                   <a href="index.jsp?catagory=all" class="list-group-item list-group-item-action active">
    All Products
  </a>
                    
                    
               
                
                
                
              
                <%
                for(Catagory c:clist)
                {%>
                <a href="index.jsp?catagory=<%=c.getCatagoryId()%>" class="list-group-item list-group-item-action"><%= c.getCatagoryTitle()%></a>
                <%
                }
                %>
                </div> 
                
            </div>
            
            <div class="col-md-10">
                    
                
                <div class="row">
                    
                    <div class="col-md-12 ">
                        
                        <div class="row row-cols-1 row-cols-md-3 g-4 ">
                            
                            <%
                            for(Product p:list){
                            
                            
                            %>
                                         
                            <div class="card">
                                
                                <a   href="img/products/href/<%=p.getpHyper() %> " style="font-size: 14;"  >
                                    <img src="img/products/<%= p.getpPhoto()%>  " style="max-height: 280px; max-width:100%; width: auto; " class="card-img-top mx-5 mt-3 px-3">
                                    </a>
                                <div class="card-body text-center">
                                    
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text"><%=p.getpDesc()%></p>
                                    
                                        
                                   
                                    
                                    
                                </div>
                                
                                    <div class="card-footer">
                                          <div class="card-body text-center ">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%> ,'<%=p.getpName() %>',<%=p.getPriceAfterApplyingDiscount() %>)">Add to Cart</button>
                                        <a href="buy.jsp?name= <%= p.getpName()%>&price=<%=p.getPriceAfterApplyingDiscount()%>&photo= <%= p.getpPhoto()%>" >   <button class="btn custom-bg text-white "> Buy Now </button></a> 
                                       <button class="btn btn-outline-success text mt-1"-white >&#8377;<%=p.getPriceAfterApplyingDiscount()%> /- <span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%> /-<%=p.getpDiscount()%>%off</span></button>
                                       
                                          </div>
                                        
                                    </div>
                                
                            </div>
                            
                            
                            <%}%>
                        </div>
                        </div>
                    </div>
                    
                </div>    
            
                
            
            
           
              
            </div>
        
                
            
            
        
        </div>
        <%@include file="componentss/comman modal.jsp"%>
        
    </body>
</html>
