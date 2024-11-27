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

 <style>
 	/* Custom CSS to remove default margins and paddings */
body {
    margin: 0;
    padding: 0;
}

.container {
    margin-top: 0;
    margin-bottom: 0;
    padding-top: 0;
    padding-bottom: 0;
}
 	
 </style>
<title>Template 1</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 20px;">
<div id="resume" class="container" style="max-width: 800px; margin: 0 auto;">
    <div class="header" style="text-align: center; margin-bottom: 20px;">
        <h1><%= request.getAttribute("name") %></h1>
        <p>Email: <%= request.getAttribute("email")%></p>
        <p>Phone: <%= request.getAttribute("phone")%></p>
        <p><a href="<%= request.getAttribute("linkedin") %>">LinkedIn</a></p>
    </div>
    <div class="section" style="margin-bottom: 20px;">
        <h2>Introduction</h2>
        <p><%= request.getAttribute("introduction")%></p>
    </div>
    <div class="section" style="margin-bottom: 20px;">
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
    <div class="section" style="margin-bottom: 20px;">
    <h2>Skills</h2>
    <div class="skills" style="display: flex; justify-content: space-around; flex-wrap: wrap;">
        <% 
        String[] skills = (String[]) request.getAttribute("skill");
        String[] levels = (String[]) request.getAttribute("level");

        for(int i = 0; i < skills.length; i++)
        {
        %>
        <div style="margin-bottom: 10px;">
            <span><%= skills[i]%></span>
            <div class="circle" style="width: 100px; height: 100px; border-radius: 50%; border: 2px solid #333; display: flex; justify-content: center; align-items: center; font-weight: bold; font-size: 1.5em; color: #4CAF50;"><%= levels[i]%></div>
        </div>
        <%
        }
        %>
    </div>
</div>
    <div class="section" style="margin-bottom: 20px;">
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
    <div class="section" style="margin-bottom: 20px;">
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
    <div class="section" style="margin-bottom: 20px;">
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
    <div class="section" style="margin-bottom: 20px;">
        <h2>Projects</h2>
        <%
        	String[] Pro = (String[]) request.getAttribute("project_name");
        	String[] Des = (String[]) request.getAttribute("project_description");
        	
        	for(int i = 0; i < Pro.length; i++)
        	{
        		%>
            	<ul>
                	<li><%= Pro[i]%>: <%= Des[i]%></li>
            	</ul><%
        	}
        %>
        
    </div>
    <div class="section" style="margin-bottom: 20px;">
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
<input type="hidden" name="template" value="template1">
<button id="download">Download</button>

<script src="pdf.js"></script>
</body>
</html>
