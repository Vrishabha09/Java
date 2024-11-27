package Resume;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class submit
 */
public class submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
		String Template = request.getParameter("template");
		String Name = request.getParameter("name");
		String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String linkedin = request.getParameter("linkedin");
	    String introduction = request.getParameter("introduction");

	    String[] qualifications = request.getParameterValues("qualification[]");
	    String[] schools = request.getParameterValues("school[]");
	    String[] years = request.getParameterValues("year[]");

	    String[] skills = request.getParameterValues("skill[]");
	    String[] levels = request.getParameterValues("level[]");

	    String experienceType = request.getParameter("E_Type");
	    String[] experienceCompanies = {"Demo"};
	    String[] experienceRoles = {"Demo"};
	    String[] experienceDurations = {"23"};
	    
	    if(experienceType.equals("experienced"))
	    {
	    	experienceCompanies = request.getParameterValues("experience_company[]");
		    experienceRoles = request.getParameterValues("experience_role[]");
		    experienceDurations = request.getParameterValues("experience_duration[]");
	    }

//	    String[] experienceCompanies = request.getParameterValues("experience_company[]");
//	    String[] experienceRoles = request.getParameterValues("experience_role[]");
//	    String[] experienceDurations = request.getParameterValues("experience_duration[]");

	    String[] achievements = request.getParameterValues("achievement[]");
	    String[] certifications = request.getParameterValues("certification[]");

	    String[] projectNames = request.getParameterValues("project_name[]");
	    String[] projectDescriptions = request.getParameterValues("project_description[]");

	    String[] activities = request.getParameterValues("activity[]");
		
		RequestDispatcher rd = null;
		
		System.out.println(""+Template);
		
		if(Template.equals("1"))
		{
			request.setAttribute("name", Name);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("linkedin", linkedin);
			request.setAttribute("introduction", introduction);
			
			request.setAttribute("qualification", qualifications);
			request.setAttribute("school", schools);
			request.setAttribute("year", years);
			request.setAttribute("skill", skills);
			request.setAttribute("level", levels);
			
			 if(experienceType.equals("experienced"))
			 {
				 request.setAttribute("experience_Type", "Experienced");
				 request.setAttribute("experience_company", experienceCompanies);
				 request.setAttribute("experience_role", experienceRoles);
				 request.setAttribute("experience_duration", experienceDurations);
			 }
			 else if(experienceType.equals("fresher"))
			 {
				 request.setAttribute("experience_Type", "Fresher");
			 }
			 
			 request.setAttribute("achievement", achievements);
			 request.setAttribute("certification", certifications);
			 request.setAttribute("project_name", projectNames);
			 request.setAttribute("project_description", projectDescriptions);
			 
			 request.setAttribute("activity", activities);
			 
			
			
			rd = request.getRequestDispatcher("Template.jsp");
			rd.forward(request, response);
		}
		if(Template.equals("2"))
		{
			request.setAttribute("name", Name);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("linkedin", linkedin);
			request.setAttribute("introduction", introduction);
			
			request.setAttribute("qualification", qualifications);
			request.setAttribute("school", schools);
			request.setAttribute("year", years);
			request.setAttribute("skill", skills);
			request.setAttribute("level", levels);
			
			 if(experienceType.equals("experienced"))
			 {
				 request.setAttribute("experience_Type", "Experienced");
				 request.setAttribute("experience_company", experienceCompanies);
				 request.setAttribute("experience_role", experienceRoles);
				 request.setAttribute("experience_duration", experienceDurations);
			 }
			 else if(experienceType.equals("fresher"))
			 {
				 request.setAttribute("experience_Type", "Fresher");
			 }
			 
			 request.setAttribute("achievement", achievements);
			 request.setAttribute("certification", certifications);
			 request.setAttribute("project_name", projectNames);
			 request.setAttribute("project_description", projectDescriptions);
			 
			 request.setAttribute("activity", activities);
			 
			
			
			rd = request.getRequestDispatcher("Template2.jsp");
			rd.forward(request, response);
		}
		if(Template.equals("3"))
		{
			request.setAttribute("name", Name);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("linkedin", linkedin);
			request.setAttribute("introduction", introduction);
			
			request.setAttribute("qualification", qualifications);
			request.setAttribute("school", schools);
			request.setAttribute("year", years);
			request.setAttribute("skill", skills);
			request.setAttribute("level", levels);
			
			 if(experienceType.equals("experienced"))
			 {
				 request.setAttribute("experience_Type", "Experienced");
				 request.setAttribute("experience_company", experienceCompanies);
				 request.setAttribute("experience_role", experienceRoles);
				 request.setAttribute("experience_duration", experienceDurations);
			 }
			 else if(experienceType.equals("fresher"))
			 {
				 request.setAttribute("experience_Type", "Fresher");
			 }
			 
			 request.setAttribute("achievement", achievements);
			 request.setAttribute("certification", certifications);
			 request.setAttribute("project_name", projectNames);
			 request.setAttribute("project_description", projectDescriptions);
			 
			 request.setAttribute("activity", activities);
			 
			
			
			rd = request.getRequestDispatcher("Template3.jsp");
			rd.forward(request, response);
		}
	}

}
