<html>
<head>
    <title>Login Page</title>

    <script src="js/script.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css">

    <head>
<body class="temp">
<div class="container">

    <div class="card card-container">
        <img id="profile-img" class="profile-img-card" src="images/propic.png" />
        <p id="profile-name" class="profile-name-card"></p>
        <form class="form-signin">
            <input type="text" name="username" class="form-control" placeholder="User Name" required autofocus>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <div class="radio">
                <label style="text-align: center; margin: auto">
                    <input type="radio" name="tag" value="secure"> Secure Flag </br>
                    <input type="radio" name="tag" value="httponly"> HTTPOnly Flag </br>
                    <input type="radio" name="tag" value="both"> Both </br>
                    <input type="radio" name="tag" value="none"> None </br>

                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block btn-signin" name ="submit" type="submit">Sign in</button>
        </form><!-- /form -->
        <a href="#" class="forgot-password">
            Forgot the password?
        </a>
    </div>

</div>
</body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("submit") != null)
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //String radio_btn = request.getParameter("");
        if ("admin".equals(username)&& "admin123".equals(password))
        {
            if ("secure".equals(request.getParameter("tag")))
            {
                response.setHeader("Refresh", "0");
                Cookie cookie = new Cookie("sss", "12%3A-e2vT69Lo7Ja-1NQ%3A2%3A1507227217%3A1881%3A4358");
                cookie.setSecure(true);
                cookie.setMaxAge(3600);
                cookie.setDomain("localhost");
                cookie.setPath("/");
                response.addCookie(cookie);
                response.sendRedirect("index.jsp");
            }
            else if ("both".equals(request.getParameter("tag")))
            {
                response.setHeader("Refresh", "0");
                Cookie cookie = new Cookie("sss", "12%3A-e2vT69Lo7Ja-1NQ%3A2%3A1507227217%3A1881%3A4358");
                cookie.setSecure(true);
                cookie.setHttpOnly(true);
                cookie.setMaxAge(3600);
                cookie.setDomain("localhost");
                cookie.setPath("/");
                response.addCookie(cookie);
                response.sendRedirect("index.jsp");
            }

            else if ("httponly".equals(request.getParameter("tag")))
            {
                response.setHeader("Refresh", "0");
                Cookie cookie = new Cookie("sss", "12%3A-e2vT69Lo7Ja-1NQ%3A2%3A1507227217%3A1881%3A4358");
                cookie.setSecure(false);
                cookie.setHttpOnly(true);
                cookie.setMaxAge(3600);
                cookie.setDomain("localhost");
                cookie.setPath("/");
                response.addCookie(cookie);
                response.sendRedirect("index.jsp");
            }
            else if ("none".equals(request.getParameter("tag")))
            {
                response.setHeader("Refresh", "0");
                Cookie cookie = new Cookie("sss", "12%3A-e2vT69Lo7Ja-1NQ%3A2%3A1507227217%3A1881%3A4358");
                cookie.setSecure(false);
                cookie.setHttpOnly(false);
                cookie.setMaxAge(3600);
                cookie.setDomain("localhost");
                cookie.setPath("/");
                response.addCookie(cookie);
                response.sendRedirect("index.jsp");
            }



        }
        else {
            //out.println("Wrong Details");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username or password incorrect');");
            out.println("location='index.jsp';");
            out.println("</script>");
        }

    }
// get the session, add argument `true` to create a session if one is not yet created.
    //HttpSession session = request.getSession(true);

    // session.setAttribute("Username", request.getParameter("Username"));
    //session.setAttribute("Password", request.getParameter("Password"));

// to get the username and password
    // String Username = (String) session.getAttribute("Username");
    // String Password = (String) session.getAttribute("Password");

%>
</html>