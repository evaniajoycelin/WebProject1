<%
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/")+1);
    String home = "";
    String menu = "" ;
    String testimoni = "";
    String contact = "";

    if (pageName.equals("index.jsp")){
        home = "active-link";
    }else if(pageName.equals("menu.jsp")){
        menu = "active-link";
    }else if(pageName.equals("testimoni.jsp")){
        testimoni = "active-link";
    }else if (pageName.equals("contact.jsp")){
        contact = "active-link";
    }
%>
    <nav class="navbar navbar-expand-lg bg-nav-custom">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto mr-auto">
                <li class="nav-item <%=home%>">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item <%=menu%>">
                    <a class="nav-link" href="menu.jsp">Menu</a>
                </li>
                <li class="nav-item <%=testimoni%>">
                    <a class="nav-link" href="testimoni.jsp">Testimoni</a>
                </li>
                <li class="nav-item <%=contact%>">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
    </nav>
