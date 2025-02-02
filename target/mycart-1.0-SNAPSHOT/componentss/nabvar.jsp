
<%@page import="com.learn.mycart.entities.User"%>

<%
User user1=(User)session.getAttribute("current-user");


%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Sanjeevini Herbs</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Catagories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="index.jsp">Eye</a></li>
            <li><a class="dropdown-item" href="index.jsp">Kidney</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        
      </ul>
        <ul class="navbar-nav  ml-auto">

             <li class="nav-item active">
                 <a class="nav-link " href="" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 20px;"></i> <span class="ml-0 cart-items" >(0)</span></a>
        </li>
            
            
            <%
            if(user1==null)
            {
            %>
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
        </li>
            
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="register.jsp">Register</a>
        </li>
            
            
            <%
            }else
            {%>

            
              <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=user1.getUserName() %></a>
        </li>
            
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="LogoutServlet">Logout</a>
        </li>
            
        <%}            %>
            
            
            
        
        </ul>
    </div>
  </div>
    
</nav>