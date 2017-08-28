package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.esc.utility.sql.SQLOperations;


@WebServlet("/lostitemmaintenance.html")
public class LostItemMaintenanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection connection;
	
	public void init() throws ServletException {
		connection = (Connection) 
			getServletContext().getAttribute("dbConnection");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			RequestDispatcher dispatcher = null; 
			int id = Integer.parseInt(request.getParameter("id"));
			
			SQLOperations.deleteLostItem(id, connection);
			ResultSet lostitems = 
					  SQLOperations.getLostItems(connection);
			request.setAttribute("lostitems", lostitems);
			dispatcher = 
			getServletContext().getRequestDispatcher("/listlostitems.jsp");
			dispatcher.forward(request, response);		
		} catch (Exception e) {
			System.err.println("Exception e - " + e.getMessage());
			e.printStackTrace();
		} 
	}

}
