<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.learn.mycart.entities.User"%>

<html>
<head>
    <title>Razorpay Payment Integration</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
              <%@include file="componentss/common_css_js.jsp" %>

</head>
<body>
      <%@include file="componentss/nabvar.jsp" %>
    <h2>Order Details</h2>
    <!-- Display order details -->
    <form id="razorpay-form" action="success.jsp" method="POST">
        <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
        <input type="hidden" name="razorpay_order_id" id="razorpay_order_id">
        <input type="hidden" name="razorpay_signature" id="razorpay_signature">
    </form>

    <button id="pay-button">Pay</button>

    <script>
       // var amounr=parseInt(document.getElementById("total").value);
        var options = {
            "key": "rzp_test_uCCh8AWmDRBARS", // Enter the Key ID generated from the Dashboard
          "amount": "4900", // Amount is in currency subunits. 50000 refers to 50000 paise or INR 500.
            "currency": "INR",
            "name": "Shwet kumar",
            "description": "Test Transaction",
            "image": "https://your-logo-url.com", // Optional
            //"order_id": "<%= 33333 %>", // Pass the order ID generated on the server side
            "handler": function (response){
                document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                document.getElementById('razorpay_signature').value = response.razorpay_signature;
                document.getElementById('razorpay-form').submit();
            },
            "prefill": {
                "name": "",
                "email": "",
                "contact": "",
               //   "amount": "3000"

            },
            "theme": {
                "color": "#F37254"
            }
        };

        var rzp = new Razorpay(options);
       document.getElementById('pay-button').onclick = function(e){
            rzp.open();
            e.preventDefault();
        }
    </script>
         <%@include file="componentss/comman modal.jsp"%>
</body>
</html>