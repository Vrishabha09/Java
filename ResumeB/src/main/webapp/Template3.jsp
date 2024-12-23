<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.js" integrity="sha512-vNrhFyg0jANLJzCuvgtlfTuPR21gf5Uq1uuSs/EcBfVOz6oAHmjqfyPoB5rc9iWGSnVE41iuQU4jmpXMyhBrsw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<title>Template 3</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px auto;
        max-width: 800px;
    }

    .navbar {
        background-color: #333;
        color: white;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .left,
    .right {
        display: flex;
        flex-direction: column;
    }

    .left h1 {
        margin: 0;
    }

    .right p {
        margin: 0;
    }

    .right a {
        color: white; /* Text color for links */
        text-decoration: none; /* Remove underline from links */
    }
    .container {
        display: flex;
        justify-content: space-between;
    }
    
    .skill-bar {
    	height: 4px;
    	width: 100%;
    	background-color: darkgray;
    	border-radius: 5px;
    	overflow: hidden;
	}

	.skill-bar-inner {
    	height: 100%;
    	background-color: #007bff;
    	text-align: right;
    	color: white;
    	padding-right: 10px;
    	line-height: 4px;
	}

    .left-side {
        flex: 1;
        padding-right: 20px;
    }

    .right-side {
        flex: 1;
        padding-left: 20px;
    }

    .section {
        margin-bottom: 20px;
    }

    hr {
        margin: 20px 0;
        border: none;
        border-top: 1px solid #ccc;
    }

    ul {
        padding-left: 20px;
    }
</style>
</head>
<body>
<div id="resume">
    <div class="navbar">
        <div class="left">
            <h1><%= request.getAttribute("name")%></h1>
            <p><%= request.getAttribute("introduction")%></p>
        </div>
        <div class="right">
            <p><i class="fas fa-envelope"></i> <%= request.getAttribute("email")%></p>
            <p><i class="fas fa-phone"></i> <%= request.getAttribute("phone")%></p>
            <p><a href="<%= request.getAttribute("linkedin")%>">LinkedIn</a></p>
        </div>
    </div>
    <hr>
    <div class="container">
        <div class="left-side">
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
            <div class="section">
                <h2>Skills</h2>
                <% 
        			String[] skills = (String[]) request.getAttribute("skill");
        			String[] levels = (String[]) request.getAttribute("level");

        			for(int i = 0; i < skills.length; i++)
        			{
        			%>
                		<ul>
                    		<li><%= skills[i]%>
                    			<div class="skill-bar">
                           			<div class="skill-bar-inner" style="width: <%= levels[i]%>;"></div>
                        		</div>
                    		</li>
                		</ul><% 
                		
        			}%>
            </div>
        </div>
        <div class="right-side">
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
    </div>
</div>
    <button id="download">Download</button>
    <script src="pdf.js"></script>
</body>
</html>
