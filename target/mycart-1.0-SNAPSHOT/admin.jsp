
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Catagory"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CatagoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user=(User)session.getAttribute("current-user");
if(user==null)
{
session.setAttribute("message", "you are not login ");
response.sendRedirect("login.jsp");
return;

}else
{
if(user.getUserType().equals("normal"))
{
session.setAttribute("message", "you are not admin ");
response.sendRedirect("login.jsp");

return;
}

}

Product product=(Product)session.getAttribute("current-product");
if(user==null)
{
session.setAttribute("message", "you are not login ");
response.sendRedirect("login.jsp");
return;
}

%>

  <%
              CatagoryDao cdao=new CatagoryDao(FactoryProvider.getFactory());
              List <Catagory> list=cdao.getCatagories();
              
              Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
              %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        
        <%@include file="componentss/common_css_js.jsp" %>
    </head>
    <body>
     <%@include file="componentss/nabvar.jsp" %>
            
        
     <div class="container admin">
         
         <div class="container-fluid mt-3">
             <%@include file="componentss/message.jsp" %>
             
         </div>
         
         <div class="row mt-3">
             <div class="col-md-4">
                 <div class="card">
                     <div class="card-body text-center">
                         <div class="container">
                             <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/man.png">
                             
                         </div> 
                         <h1><%=m.get("userCount")%></h1>
                         <h1>Users</h1>
                         
                     </div>
                     
                     
                 </div>    
                 
                 
             </div>
         
             <div class="col-md-4">
                 
                   <div class="card">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/list.png">
                             
                         </div> 
                         <h1><%=list.size()%></h1>
                         
                         <h1>Catagories</h1>
                         
                     </div>
                     
                     
                 </div>    
                 
             </div>
         
             <div class="col-md-4">
                 
                   <div class="card">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/package.png">
                             
                         </div> 
                         <h1><%=m.get("productCount")%></h1>
                         
                         <h1>Products</h1>
                         
                     </div>
                     
                     
                 </div>    
                 
             </div>
         
             
             
         </div>
         <div class="row mt-3">
             <div class="col-md-6">
                 
                   <div class="card" data-toggle="modal" data-target="#Add-Catagory-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/package.png">
                             
                         </div> 
                         <h1></h1>
                         
                         <h1>Add Catagories</h1>
                         
                     </div>
                     
                     
                 
                 
                 
             </div>
             </div>
             <div class="col-md-6">
                 
                 
                   <div class="card" data-toggle="modal" data-target="#Add-Product-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/package.png">
                             
                         </div> 
                         <h1></h1>
                         
                         <h1>Add Products</h1>
                         
                     </div>
                     
                     
                 
                 
             </div>
             
             
         </div>
         
         
         
     </div>
       

<!-- Modal -->
<div class="modal fade" id="Add-Catagory-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Catagory Detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" >
              <input type="hidden" name="operation" value="addcatagory">
              
              <div class="form-group">   
              
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter catagory title"required/>
              
              
              </div>   
              <div class="form-group">   
                  <textarea style="height: 300px;" class="form-control" placeholder="Enter catagory description" name="catDescription" required=""></textarea>
              
              </div>
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Catagory</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
              </div> 
              
          </form>
      </div>
    </div>
  </div>
</div>





<!-- Modal add products -->
<div class="modal fade" id="Add-Product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Catagory Detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >
              <input type="hidden" name="operation" value="addproduct">           
              <div class="form-group">   
              
                  <input type="text" class="form-control" name="pName" placeholder="Enter product name"required/>
              
              
              </div>   
              <div class="form-group">   
                  <textarea style="height: 300px;" class="form-control" placeholder="Enter product description" name="pDescription" required=""></textarea>
              
              </div>
              
              <div class="form-group">   
                  <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required=""></textarea>
              
              </div>
              
           <div class="form-group">   
                  <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required=""></textarea>
              
              </div>   
              
              <div class="form-group">   
                  <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required=""></textarea>
              
              </div>
            
              <div class="form-group">   
                  <select name="catId" class="form-control" id="">
                      
                      <%
                      for(Catagory c:list){
                      
                      %>
                      
                      
                      <option value="<%= c.getCatagoryId()%>"><%=c.getCatagoryTitle()%></option>
                          
                          
                      <%}%>
                  </select>
                          
              </div>
              
   <div class="form-group">   
       <label for="pPic">Select picture</label>
       <input type="file" id="pPic" name="pPic" required="">           
              </div>
              
              <div class="form-group">   
       <label for="pHyper">Select hyper</label>
       <input type="file" id="plink" name="plink" required="">           
              </div>
              
              
              
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Product</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
              </div> 
              
          </form>
      </div>
    </div>
  </div>
</div>


                      <%@include file="componentss/comman modal.jsp" %>
    </body>
</html>
