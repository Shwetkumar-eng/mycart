function add_to_cart(pid,pname,pprice){
    let cart=localStorage.getItem("cart");
    if(cart==null)
    {
        let products=[];
        let product={ productId:pid,productName:pname,productQuantity:1,productPrice:pprice}
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("product is addedd first time")
    }
    else{
        
       let pcart=JSON.parse(cart); 
        
        
        let oldproduct=pcart.find((item)=>item.productId==pid)
         console.log(oldproduct)
        if(oldproduct)
        {
            oldproduct.productQuantity=oldproduct.productQuantity+1
            pcart.map((item)=>{
                if(item.productId==oldproduct.productId){
                    
                    item.productQuantity=oldproduct.productQuantity;
                }
                
            })
             localStorage.setItem("cart",JSON.stringify(pcart));
             console.log("quantity is increased")
        }else{
            
        let product={ productId:pid,productName:pname,productQuantity:1,productPrice:pprice}
        pcart.push(product)
        localStorage.setItem("cart",JSON.stringify(pcart));
         console.log("product is added")
        
        }
        
    }
    updateCart();
}

//update cart
function updateCart(){
    let cartString=localStorage.getItem("cart");
   let cart= JSON.parse(cartString);
   if(cart==null || cart.length==0)
   {
       console.log("cart is empty")
       $(".cart-items").html("(0)");
       $(".cart-body").html("<h3> cart does not have any items</h3>");
       $(".checkout-btn").attr('disabled',true);
       console.log("removed")
   }else{
       console.log(cart)
        $(".cart-items").html(`(${cart.length})`);
        let table=`
<table class='table'>
      <thead class='thread-light'>
      <tr>
      <th>Item Name</th>
      <th>Price</th>
      <th>Quantity</th>  
      <th>Total Price</th>  
      <th>Action</th>
      
      </tr>
      </thead>
              `;
        let totalPrice=0;
        cart.map((item)=>{
            
            table+=`
             <tr>
            
            <td> ${item.productName}</td>
               <td> ${item.productPrice}</td>
            <td> ${item.productQuantity}</td>
            <td> ${item.productQuantity * item.productPrice}</td>
            <td><button onclick= 'DeleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'> Remove </button> </td>
            
            
                                  </tr>
           
`
          totalPrice+=item.productPrice * item.productQuantity;   
            
        })
        
        table=table + `
<tr><td colspan='5' style="text-right font-weight-bold"> Total Price: ${totalPrice}</td></tr>

</table>`
        $(".cart-body").html(table);
         $(".checkout-btn").attr('disabled',false); 
   }
   
}

function DeleteItemFromCart(pid)
{
   let cart= JSON.parse(localStorage.getItem('cart'));
    
  let newcart= cart.filter((item)=>item.productId!=pid) 
    localStorage.setItem('cart',JSON.stringify(newcart))
    updateCart();
}

$(document).ready(function (){
    
    updateCart()
})

function goToCheckout(){
    
    
    window.location="Checkout.jsp"
}



