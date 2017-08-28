package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.esc.utility.sql.*;

@WebServlet("/listaccounts.html")
public class ListAccountsServlet extends HttpServlet {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
			if (connection != null) {
				ResultSet rs = SQLOperations.getAccounts(connection); 			
				request.setAttribute("rs", rs);
				getServletContext().getRequestDispatcher("/changepw.jsp")
					.forward(request, response);
			} else {
				System.out.println("Invalid Connection resource");
			}
		 } catch (NullPointerException npe) {
				System.err.println("Invalid Connection resource - " + npe.getMessage());
		 } catch (Exception e) {
				System.err.println("Exception - " + e.getMessage());
		 } 
	}

}
