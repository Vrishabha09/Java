<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.js" integrity="sha512-vNrhFyg0jANLJzCuvgtlfTuPR21gf5Uq1uuSs/EcBfVOz6oAHmjqfyPoB5rc9iWGSnVE41iuQU4jmpXMyhBrsw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<title>Template 2</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
    }
    .header {
        text-align: center;
        margin-bottom: 20px;
    }
    .section {
        margin-bottom: 20px;
    }
    .skills {
        display: flex;
        justify-content: space-around;
    }
    .skill-bar {
        width: 100px;
        background-color: #f1f1f1;
        border-radius: 5px;
        overflow: hidden;
    }
    .skill-bar-inner {
        height: 20px;
        background-color: #007bff;
        text-align: right;
        line-height: 20px;
        color: white;
        padding-right: 10px;
    }
</style>
</head>
<body>
<div id="resume" class="container">
    <div class="header">
        <h1><%= request.getAttribute("name")%></h1>
        <p>Email: <%= request.getAttribute("email")%></p>
        <p>Phone: <%= request.getAttribute("phone")%></p>
        <p><a href="<%= request.getAttribute("linkedin")%>">LinkedIn</a></p>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Introduction</h2>
        <p><%= request.getAttribute("introduction")%></p>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Education</h2>
        <% 
        	String[] qualification = (String[]) request.getAttribute("qualification");
        	String[] school = (String[]) request.getAttribute("school");
        	String[] year = (String[]) request.getAttribute("year");
        	
        	for(int i = 0; i < school.length; i++)
        	{
        		%><p><%= qualification[i]%>, <%= school[i]%>, <%= year[i]%></p>
        		<%
        	}
        %>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Skills</h2>
        <div class="skills">
         <% 
        String[] skills = (String[]) request.getAttribute("skill");
        String[] levels = (String[]) request.getAttribute("level");

        for(int i = 0; i < skills.length; i++)
        {
        %>
            <div>
                <span><%= skills[i]%></span>
                <div class="skill-bar">
                    <div class="skill-bar-inner" style="width:<%= levels[i]%>;"><%= levels[i]%></div>
                </div>
            </div><% 
            
        }%>
    	</div>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Experience</h2>
        <% 
         	String e_type = (String)request.getAttribute("experience_Type");
         	if(e_type.equals("Experienced"))
         	{
         		String[] experience_company = (String[]) request.getAttribute("experience_company");
            	String[] experience_role = (String[]) request.getAttribute("experience_role");
            	String[] experience_duration = (String[]) request.getAttribute("experience_duration"); 
            	
            	for(int i = 0; i < experience_company.length; i++)
            	{
            		%><p><b><%= experience_company[i]%></b> <br><%= experience_role[i]%>, <br><b>Duration : </b><%= experience_duration[i]%></p>
            		<%
            	}
         	}
         	else if(e_type.equals("Fresher"))
         	{
         		%><p><%= e_type%></p>
         		<%
         	}
        %>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Achievements and Awards</h2>
        <% 
        	String[] achv = (String[]) request.getAttribute("achievement");
        	%>
        	<ul>
        		<% 
        		for(String ach : achv)
        		{
        			%><li><%= ach%></li><%
        		}
        		%>
           		
        	</ul><%
        %>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Certifications</h2>
        <% 
        	String[] cert = (String[]) request.getAttribute("certification");
        	%>
        	<ul>
        		<% 
        		for(String c : cert)
        		{
        			%><li><%= c%></li><%
        		}
        		%>
           		
        	</ul><%
        %>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Projects</h2>
        <%
        	String[] Pro = (String[]) request.getAttribute("project_name");
        	String[] Des = (String[]) request.getAttribute("project_description");
        	
        	for(int i = 0; i < Pro.length; i++)
        	{
        		%>
            	<ul>
                	<li><b><%= Pro[i]%></b>: <%= Des[i]%></li>
            	</ul><%
        	}
        %>
    </div>
    <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">
    <div class="section">
        <h2>Extra-curricular Activities</h2>
        <%
        	String[] ex = (String[]) request.getAttribute("activity");
        
        	for(String act : ex)
        	{
        		%>
        		<ul>
            		<li><%= act%></li>
        		</ul><%
        	}
        %>
    </div>
</div>
<button id="download">Download</button>
<script src="pdf.js"></script>
</body>
</html>
