package Resume;

import jakarta.servlet.ServletException;
import java.io.*;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		
		String UName = request.getParameter("username");
		String Pass = request.getParameter("password");
		
		HttpSession session = request.getSession();
		session.setAttribute( "UserName",UName);
		
		String query = "select *from userinfo where u_name = ? and pass = ?";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyDB","root","Root@0923");
			
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,UName);
			pst.setString(2, Pass);
			
			ResultSet rs = null;
			rs = pst.executeQuery();
			if(rs.next())
			{
				response.sendRedirect("Index.jsp");
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
