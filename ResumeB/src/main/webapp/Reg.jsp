<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="styles.css">
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
        <div class="login-btn">
            <button onclick="location.href='Log.jsp'">Login</button>
        </div>
    </header>
    <div class="background">
        <div class="container">
            <h2>Register for Resume Builder</h2>
            <form action="reg" method="post" id="registrationForm" onsubmit="return validateForm()">
                <div class="form-group">
                    <input type="text" id="username" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="text" id="fullname" name="fullname" placeholder="Full Name">
                </div>
                <div class="form-group">
                    <input type="email" id="email" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <input type="number" id="age" name="age" placeholder="Age">
                </div>
                <div class="form-group">
                    <input type="password" id="password" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password">
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="script.js"></script>
</body>
</html>