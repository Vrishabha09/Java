<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
 <% 
 
 String uname = (String)session.getAttribute("UserName");
 String requestURI = request.getRequestURI();
 
 if ((uname == null || uname.isEmpty()) && !requestURI.endsWith("Log.jsp")) {
     response.sendRedirect("Log.jsp");
 }

	%> 
    <header>
        <div class="logo">
            <img src="logo1.png" alt="Resume Builder Logo">
        </div>
        <div class="signup-btn">
            <button onclick="location.href='Reg.jsp'">Sign Up</button>
        </div>
    </header>

    <div class="background">
        <div class="container">
            <h2>Login to Resume Builder</h2>
            <form action="login" method="post" id="loginForm" onsubmit="return validateForm()">
                <div class="form-group">
                    <input type="text" id="username" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="password" id="password" name="password" placeholder="Password">
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="log_script.js"></script>
</body>
</html>
