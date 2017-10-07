<%--
  Created by IntelliJ IDEA.
  User: vithu
  Date: 9/12/17
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function show_cookie(){
        alert(document.cookie);
    }
</script>

<button onclick="show_cookie()">Click me</button>
<head>
    <title>Title</title>
</head>
<body>
<style>
    body {
        background-color: lightblue;
    }

    h1 {
        color: darkblue;
        text-align: center;
    }
</style>



<h1> Welcome</h1>

<div>
    <%

        Cookie cookie = null;
        Cookie[] cookies = null;

        // Get an array of Cookies associated with the this domain
        cookies = request.getCookies();






        boolean check = false;

        if( cookies != null ) {

            out.println("<h2> Cookie Details </h2>");

            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if(cookie.getName().equals("sss"))
                {
                    check = true;

                    out.print("<table>"+
                            "<tr>"+
                            "<td>"+"Name : \t" + "</td>"+ "<td>"+ cookie.getName( ) + "</td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td>"+"Value : \t" + "</td>"+ "<td>"+ cookie.getValue( ) + "</td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td>"+"Max Age : \t" + "</td>"+ "<td>"+ cookie.getMaxAge( ) + "</td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td>"+"Path : \t" + "</td>"+ "<td>"+ cookie.getPath( ) + "</td>" +
                            "</tr>"+
                            "</table>"


                    );


                }

            }
        }
        else
        {
            out.println("<h2>No cookies founds</h2>");
        }

        if(!check)
            response.sendRedirect("login.jsp");

        if(request.getParameter("Logout") != null)
        {
            if(cookies !=null)
            {
                session.invalidate();
                for(Cookie cookie1 : cookies)
                {
                    if (cookie1.getName().equals("sss"))
                    {
                        cookie1.setMaxAge(0);
                        cookie1.setValue(null);
                        cookie1.setPath("/");
                        response.addCookie(cookie1);
                    }


                }
            }
            response.sendRedirect("login.jsp");

        }
    %>
</div>

<form name="form-login" method="post" action="index.jsp">
    <input type="submit" name ="Logout" value="Logout">

</form>

</body>
</html>
