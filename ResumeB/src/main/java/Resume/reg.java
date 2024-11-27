package Resume;

import jakarta.servlet.ServletException;
import java.io.*;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class reg
 */
public class reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reg() {
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
		String Name = request.getParameter("username");
		String Fname = request.getParameter("fullname");
		String Email = request.getParameter("email");
		int Age = Integer.parseInt(request.getParameter("age"));
		String Pass = request.getParameter("password");
		
		String query = "insert into userinfo(u_name, f_name,age,pass,email) values(?,?,?,?,?)";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyDB","root","Root@0923");
			
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,Name);
			pst.setString(2,Fname);
			pst.setInt(3,Age);
			pst.setString(4,Pass);
			pst.setString(5,Email);
			
			int Res = pst.executeUpdate();
			
			if(Res > 0)
			{
				response.sendRedirect("Log.jsp");
			}
			else
			{
				response.sendRedirect("Reg.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
