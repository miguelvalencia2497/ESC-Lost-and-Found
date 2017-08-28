package com.esc.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import ust.esc.model.AccountBean;

import com.esc.controller.*;
import ust.esc.model.*;
import com.esc.utility.*;
import com.esc.utility.sql.*;

/**
 * Servlet implementation class ProcessServlet
 */
@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
private Connection connection;

public void init(ServletConfig config) throws ServletException {
	super.init(config);
	connection = SQLOperations.getConnection();
	
	if (connection != null) {
		getServletContext().setAttribute("dbConnection", connection);
		System.out.println("connection is READY.");
	} else {
		System.err.println("connection is NULL.");
	}
}

	public void init() throws ServletException {
		
		}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AccountBean ab = BeanFactory.getAccountBean(1, username, password, true);
		try
		{
			
			if (connection != null)
			{
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM accounts");
				System.out.println("Successful Connec"
						+ "tion.");
			
	
				while (rs.next())
				{
					
					
						if(username.equals(rs.getString("username"))&&password.equals(rs.getString("password")))
						{
							if(rs.getBoolean("admin")==true)
							{
								request.setAttribute("admin",username);
							HttpSession session=request.getSession();  
					        session.setAttribute("admin",username); 
							
							getServletContext().getRequestDispatcher("/Session.html")
							.forward(request, response);
							
							}else{
								request.setAttribute("staff", username);
								HttpSession session=request.getSession();  
						        session.setAttribute("staff",username); 
								
								getServletContext().getRequestDispatcher("/staff.jsp")
								.forward(request, response);
							}
						}
				}
								getServletContext().getRequestDispatcher("/error.jsp")
					.forward(request, response);
				
				stmt.close();
				connection.close();
				}
			
			else
			{
				System.err.println("Connection is Null.");
			}
	
		}
		catch (SQLException sqle)
		{
			System.out.println("SQLException occured - " + sqle.getMessage());
		}
		
		catch (Exception e)
		{
			
		}
	}

}
