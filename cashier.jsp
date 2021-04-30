<%@page import = "java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@include file = "Food.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">

</head>
<body>
    <%@include file="header.jsp" %>
    <%@include file="navbar.jsp" %> 
    <div class="container-cart">
      <h3 class="title-cart">Your Order Summary</h3>
      <ul class="list-group mb-3">
      <%
        String[] index = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"};
        int totalPrice = 0;
        for(int i=0; i<index.length; i++){
            String getIndex = request.getParameter("checkbox-"+index[i]);
            String getName = request.getParameter("food-name-"+index[i]);
            String getPrice = request.getParameter("food-price-"+index[i]);
            String getQty = request.getParameter("food-qty-"+index[i]);
            if(getPrice == ""|| getQty == ""){
              getPrice = "0";
              getQty = "0";
            }
            int totalPerItem = Integer.parseInt(getPrice)*Integer.parseInt(getQty);
            totalPrice = totalPrice + (Integer.parseInt(getPrice)*Integer.parseInt(getQty));

            if(getIndex != null){
                String file = application.getRealPath("/") + "order.txt";
                FileWriter filewriter = new FileWriter(file, true);
                filewriter.write("Food Name: " + getName + "\n");
                filewriter.write("Price: "+ getPrice+ "\n");
                filewriter.write("Qty: "+ getQty +"\n");
                filewriter.close(); %>

                <li class="list-group-item d-flex justify-content-between lh-sm">
                  <div class="item-buy">
                    <h6><%=getName%></h6>
                    <small class="text-muted">Quantity: <%=getQty%></small>
                  </div>
                  <span class="text-muted"><%=totalPerItem%></span>
                </li>
       <%    }
        } %>   
                <li class="list-group-item d-flex justify-content-between lh-sm">
                  <div class="item-buy">
                    <h6>Total Price</h6>
                  </div>
                  <span class="text-muted" id="total-price"><%=totalPrice%></span>
                </li>
      </ul>
    </div> 

    <div class="container-cashier">
            <form>
                <h3 class="title-cart">Payment</h3>
                <label for="inputMoney" class="col-sm-2 col-form-label">Your Money</label>
                <input type="number" class="form-control" name="input-money" id="inputMoney">
                <p class = "error-msg" id="errMoney">Error Message</p>
                <button type="button" class="money-submit-btn" id="money-submit-btn">Pay</button>
            </form>

            <h3 id="change"></h3>
    </div>

    <%@include file="footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/tools.js"></script>
</body>
</html>