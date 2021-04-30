<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testimoni</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <%@include file="header.jsp" %>
    <%@include file="navbar.jsp" %>
    <input%@include file="navbar.jsp" %>
    <div class="container-testimoni">
        <form action="testimoni.jsp" method="POST">
            <div class="form-group row">
                <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input name="email" type="text" class="form-control" id="inputEmail">
                    <p class = "error-msg" id="errEmail">Error Message</p>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputTestimoni" class="col-sm-2 col-form-label">Testimoni</label>
                <div class="col-sm-10">
                    <textarea name="testimoni" type="text" class="form-control" id="inputTestimoni"></textarea>
                    <p class = "error-msg" id="errTestimoni">Error Message</p>
                </div>
            </div>

            <button type="submit" class="testi-submit-btn" id="testi-submit-btn">Submit</button>
        </form>
    </div>

    <%
          String email = request.getParameter("email");
          String testi = request.getParameter("testimoni");
          String file = application.getRealPath("/") + "testimoni.txt";
          if(email != null || testi != null){
            FileWriter filewriter = new FileWriter(file, true);
            filewriter.write("Email: "+email+'\n');
            filewriter.write("Testimoni: "+testi+'\n');
            filewriter.close(); 

            String file_read = application.getRealPath("/") + "testimoni.txt";
            BufferedReader reader = new BufferedReader(new FileReader(file_read));
            StringBuilder sb = new StringBuilder();
            String line;
            while((line = reader.readLine())!= null){ %>
            <div class="result-testi">
                <p class="testi"><%=line%></p>
            </div>
            <% } 
          }else{ %>
              <h3 id="testi-empty">No Testi</h3>
          <% } %>
    
    <%@include file="footer.jsp" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/tools.js"></script>

</body>

</html>