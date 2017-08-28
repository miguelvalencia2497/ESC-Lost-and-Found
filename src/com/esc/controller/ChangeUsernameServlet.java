package com.esc.controller;

import java.io.IOException;

import java.sql.Connection;

import ust.esc.model.AccountBean;
import ust.esc.model.ItemBean;
import com.esc.utility.*;
import com.esc.utility.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeUsernameServlet
 */
@WebServlet("/updatepassword")
public class ChangeUsernameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUsernameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		RequestDispatcher dispatcher = null; 
		try {
			AccountBean ab = new AccountBean();
			ab.setUsername(request.getParameter("username"));
			ab.setPassword(request.getParameter("password"));
		
			
			
			int recordsAffected = 
				SQLOperations.updateAccount(ab, Integer.parseInt(request.getParameter("id")),connection);
			request.setAttribute("rs", ab);
			
			if (recordsAffected > 0) {
				dispatcher = 
			getServletContext().getRequestDispatcher(
					"/viewnewusername.jsp?success=true");
			} else {
				dispatcher = 
			getServletContext().getRequestDispatcher(
				"/viewnewusername.jsp?success=false");
			}
			dispatcher.forward(request, response);		
		} catch (Exception e) {
			e.printStackTrace();
		}}}
	


