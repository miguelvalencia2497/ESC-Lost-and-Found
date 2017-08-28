package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.esc.utility.sql.SQLOperations;

/**
 * Servlet implementation class ListFindServlet
 */
@WebServlet("/listfind.html")
public class ListFindServlet extends HttpServlet {
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
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String choice = request.getParameter("choice");
		String find = request.getParameter("find");
		String find2 = request.getParameter("find2");
		System.out.print(find2);
		try {	
			if (connection != null) {
				ResultSet list;
				if(!(find2.equals(""))){
					list = SQLOperations.getListFind(connection, choice, find2); 							
				}
				else{
					list = SQLOperations.getListFind(connection, choice, find); 			
				}
				request.setAttribute("list", list);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/list.jsp");
				dispatcher.forward(request, response);
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
