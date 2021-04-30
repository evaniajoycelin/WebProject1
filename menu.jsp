<%@page import = "java.util.ArrayList" %>
<%@page import="java.io.*" %>
<%@include file = "Food.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div id='page' class='main-container'>
    <%@include file="header.jsp" %>
    <%@include file="navbar.jsp" %>

    <% 
        ArrayList<Food> foods = new ArrayList<Food>();
        foods.add(new Food("0", "Green Onion Salad", 50000, "./asset/14.jpg"));
        foods.add(new Food("1", "Honey Chicken Breast", 55000, "./asset/12.jpg"));
        foods.add(new Food("2", "Tomato Pasta", 40000, "./asset/9.jpg"));
        foods.add(new Food("3", "Pancake Blueberry", 40000, "./asset/10.jpg"));
        foods.add(new Food("4", "Sashimi", 100000, "./asset/8.jpg"));
        foods.add(new Food("5", "Green Burger", 150000, "./asset/1.jpg"));
        foods.add(new Food("6", "Green Pizza", 50000, "./asset/13.jpg"));
        foods.add(new Food("7", "Ramen", 75000, "./asset/4.jpg"));
        foods.add(new Food("8", "Avocado Toast", 40000, "./asset/2.jpg"));
        foods.add(new Food("9", "Softie Bowl", 40000, "./asset/7.jpg"));
        foods.add(new Food("10", "Wagyu A5 Steak", 200000, "./asset/3.jpg"));
        foods.add(new Food("11", "Seafood Tacos", 60000, "./asset/6.jpg"));

    %>

    <form action="cashier.jsp" method="POST">
        <div class="container-menu">
            <div class="row row-cols-1 row-cols-md-3">
                <%  for (Food food : foods){ %>
                    <div class="col mb-4">
                        <div class="card">
                            <img src="<%=food.getImgSrc()%>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <input id="input-name" name="food-name-<%= food.getIndex() %>"  type="text" value="<%=food.getName()%>" readonly><br>
                            
                                <label for="input-price">IDR</label>
                                <input id="input-price" name="food-price-<%= food.getIndex() %>" type="number" value=<%=food.getPrice()%> readonly><br>
                                
                                <label for="input-qty">Quantity</label>
                                <input id ="input-qty" name="food-qty-<%= food.getIndex() %>" type="number"><br>
                                
                                <label for="checkbox">I want this!</label>
                                <input id="checkbox" name="checkbox-<%= food.getIndex() %>" value=<%= food.getIndex() %> type="checkbox">
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
            <button type="submit" class="menu-submit-btn" id="menu-submit-btn">Order</button><br>
        </div>
    </form>

    <%@include file="footer.jsp" %>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/tools.js"></script>
    
</body>
</html>