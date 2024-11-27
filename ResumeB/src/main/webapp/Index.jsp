<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resume Templates</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('Bg.webp');
        background-size: cover;
        background-position: center;
    }
    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 1200px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background-color: rgba(255, 255, 255, 0.7);
        z-index: 1000; 
    }
    .navbar img {
        height: 40px;
    }
    .buttons {
        display: flex;
        gap: 10px;
    }
    .button {
        padding: 8px 16px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .button:hover {
        background-color: #0056b3;
    }
    .container {
        padding-top: 80px; 
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
        margin: 0 auto;
        max-width: 1200px;
    }
    .template {
        width: calc(33.33% - 20px);
        cursor: pointer;
        transition: transform 0.3s;
    }
    .template:hover {
        transform: scale(1.05);
    }
    .template img {
        width: 100%;
        border-radius: 5px;
    }
</style>
</head>
<body>
<div class="navbar">
    <img src="logo1.png" alt="Logo">
    <div class="buttons">
        <a href="Reg.jsp" class="button">Sign Up</a>
        <a href="Log.jsp" class="button">Login</a>
         <a href="Logout.jsp" class="button">Logout</a>
    </div>
</div>
<div class="container">
    <div class="template" onclick="redirectToForm(1)">
        <img src="Template1.png" alt="Template 1">
    </div>
    <div class="template" onclick="redirectToForm(2)">
        <img src="Template2.png" alt="Template 2">
    </div>
    <div class="template" onclick="redirectToForm(3)">
        <img src="Template3.png" alt="Template 3">
    </div>
    
</div>
<script>
    function redirectToForm(templateNumber) {
        window.location.href = 'ResForm.jsp?template=' + templateNumber;
    }
</script>
<!-- <form action = "download" method = "post">
<button type="submit">Download</button>
</form> -->
</body>
</html>

