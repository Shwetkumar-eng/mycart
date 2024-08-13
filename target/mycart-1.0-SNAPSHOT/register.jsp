

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
         <div class="container-fluid">
         <div class="row mt-5">
             <div class="col-md-4 offset-md-4">
                 
                 
                 <div class="card">
                     <%@include file="componentss/message.jsp" %>
                     
                     <div class="card-body">
                         <h3 class=" text-center my-3">Sign Up Here</h3>
                 
                         <form action="RegisterServlet" method="post">
                     
                     
  <div class="mb-3">
    <label for="name" class="form-label">User name</label>
    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">
    </div>
                         
                         <div class="mb-3">
    <label for="email" class="form-label">User email</label>
    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">
    </div>
                         
                         
  <div class="mb-3">
    <label for="password" class="form-label">User password</label>
    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
    </div>
                         
                         <div class="mb-3">
    <label for="phone" class="form-label">User phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
    </div>
                         
                         <div class="mb-3">
    <label for="name" class="form-label">User address</label>
    <textarea name="user_address" style="height:200px;" class="form-control" placeholder="Enter your address"> </textarea>
    </div>
                         <div class="container text-center ">                  
                         
    <button type="submit" class="btn btn-outline-success">Register</button>
    <button type="submit" class="btn btn-outline-warning">Reset</button>
                         </div>
</form>
                     
                
                     </div>
                 </div>
                 
                 
             </div>
             
         </div>
         </div>
    </body>
</html>
