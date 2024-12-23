<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resume Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    .form {
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    .form label {
        display: block;
        margin-bottom: 5px;
    }
    .form input[type="text"],
    .form input[type="email"],
    .form textarea,
    .form select {
        width: 100%;
        margin-bottom: 10px;
        padding: 8px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .form button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .form button:hover {
        background-color: #45a049;
    }
    .dynamic-field {
        margin-bottom: 10px;
    }
    .dynamic-field input,
    .dynamic-field select {
        width: 45%;
        display: inline-block;
    }
    .add-field {
        background-color: #f0f0f0;
        color: #333;
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        cursor: pointer;
    }
    .hidden {
        display: none;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Resume Form</h1>
    <% 
    String uname = (String)session.getAttribute("UserName");
    String requestURI = request.getRequestURI();
    
    if ((uname == null || uname.isEmpty()) && !requestURI.endsWith("Log.jsp")) {
        response.sendRedirect("Log.jsp");
    }

	%>
    <div class="form">
        <form action="submit" method="post">
            <input type="hidden" name="template" value="<%= request.getParameter("template") %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone">
            <label for="linkedin">LinkedIn Profile:</label>
            <input type="text" id="linkedin" name="linkedin">
            <label for="introduction">Introduction:</label>
            <textarea id="introduction" name="introduction"></textarea>
            <label for="education">Education:</label>
            <div id="education-fields">
                <div class="dynamic-field">
                    <input type="text" name="qualification[]" placeholder="Qualification">
                    <input type="text" name="school[]" placeholder="School/College Name">
                    <input type="text" name="year[]" placeholder="Year">
                </div>
            </div>
            <button type="button" onclick="addEducationField()" class="add-field">Add Education</button>
            <label for="skills">Skills:</label>
            <div id="skills-fields">
                <div class="dynamic-field">
                    <input type="text" name="skill[]" placeholder="Skill">
                    <select name="level[]">
                        <option value="10%">10%</option>
                        <option value="20%">20%</option>
                        <option value="30%">30%</option>
                        <option value="40%">40%</option>
                        <option value="50%">50%</option>
                        <option value="60%">60%</option>
                        <option value="70%">70%</option>
                        <option value="80%">80%</option>
                        <option value="90%">90%</option>
                        <option value="100%">100%</option>
                    </select>
                </div>
            </div>
            <button type="button" onclick="addSkillField()" class="add-field">Add Skill</button>
            <label for="experience-type">Experience:</label>
            <select id="experience-type" name="E_Type" onchange="toggleExperienceFields()">
                <option value="experienced">Experienced</option>
                <option value="fresher">Fresher</option>
            </select>
            <div id="experience-fields" class="hidden">
                <div class="dynamic-field">
                    <input type="text" name="experience_company[]" placeholder="Company Name">
                    <input type="text" name="experience_role[]" placeholder="Role and Job Description">
                    <input type="text" name="experience_duration[]" placeholder="Duration">
                </div>
                <button type="button" onclick="addExperienceField()" class="add-field">Add Experience</button>
            </div>
            <label for="achievements">Achievements and Awards:</label>
            <div id="achievements-fields">
                <div class="dynamic-field">
                    <input type="text" name="achievement[]" placeholder="Achievement">
                </div>
            </div>
            <button type="button" onclick="addAchievementField()" class="add-field">Add Achievement</button>
            <label for="certifications">Certifications:</label>
            <div id="certifications-fields">
                <div class="dynamic-field">
                    <input type="text" name="certification[]" placeholder="Certification">
                </div>
            </div>
            <button type="button" onclick="addCertificationField()" class="add-field">Add Certification</button>
            <label for="projects">Projects:</label>
            <div id="projects-fields">
                <div class="dynamic-field">
                    <input type="text" name="project_name[]" placeholder="Project Name">
                    <textarea name="project_description[]" placeholder="Project Description"></textarea>
                </div>
            </div>
            <button type="button" onclick="addProjectField()" class="add-field">Add Project</button>
            <label for="extra-activities">Extra-curricular Activities:</label>
            <div id="activities-fields">
                <div class="dynamic-field">
                    <input type="text" name="activity[]" placeholder="Activity">
                </div>
            </div>
            <button type="button" onclick="addActivityField()" class="add-field">Add Activity</button><br><br>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>
<script>
    function addEducationField() {
        var educationFields = document.getElementById('education-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="qualification[]" placeholder="Qualification">' +
            '<input type="text" name="school[]" placeholder="School/College Name">' +
            '<input type="text" name="year[]" placeholder="Year">';
        educationFields.appendChild(newField);
    }

    function addSkillField() {
        var skillsFields = document.getElementById('skills-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="skill[]" placeholder="Skill">' +
            '<select name="level[]">' +
            '<option value="10%">10%</option>' +
            '<option value="20%">20%</option>' +
            '<option value="30%">30%</option>' +
            '<option value="40%">40%</option>' +
            '<option value="50%">50%</option>' +
            '<option value="60%">60%</option>' +
            '<option value="70%">70%</option>' +
            '<option value="80%">80%</option>' +
            '<option value="90%">90%</option>' +
            '<option value="100%">100%</option>' +
            '</select>';
        skillsFields.appendChild(newField);
    }

    function toggleExperienceFields() {
        var experienceType = document.getElementById('experience-type').value;
        var experienceFields = document.getElementById('experience-fields');
        if (experienceType === 'experienced') {
            experienceFields.classList.remove('hidden');
        } else {
            experienceFields.classList.add('hidden');
        }
    }

    function addExperienceField() {
        var experienceFields = document.getElementById('experience-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="experience_company[]" placeholder="Company Name">' +
            '<input type="text" name="experience_role[]" placeholder="Role">' +
            '<input type="text" name="experience_duration[]" placeholder="Duration">';
        experienceFields.appendChild(newField);
    }

    function addAchievementField() {
        var achievementsFields = document.getElementById('achievements-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="achievement[]" placeholder="Achievement">';
        achievementsFields.appendChild(newField);
    }

    function addCertificationField() {
        var certificationsFields = document.getElementById('certifications-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="certification[]" placeholder="Certification">';
        certificationsFields.appendChild(newField);
    }

    function addProjectField() {
        var projectsFields = document.getElementById('projects-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="project_name[]" placeholder="Project Name">' +
            '<textarea name="project_description[]" placeholder="Project Description"></textarea>';
        projectsFields.appendChild(newField);
    }

    function addActivityField() {
        var activitiesFields = document.getElementById('activities-fields');
        var newField = document.createElement('div');
        newField.className = 'dynamic-field';
        newField.innerHTML = '<input type="text" name="activity[]" placeholder="Activity">';
        activitiesFields.appendChild(newField);
    }
</script>
</body>
</html>
