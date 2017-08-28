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

import ust.esc.model.Item;
import com.esc.utility.sql.SQLOperations;


@WebServlet("/itemmaintenance.html")
public class ItemMaintenanceServlet extends HttpServlet {
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
			if (request.getParameter("action").equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				Item item = 
				  SQLOperations.searchItem(id, connection);
				request.setAttribute("item", item);
				dispatcher = 
				 getServletContext().getRequestDispatcher("/edititem.jsp");
			} else if (request.getParameter("action").equals("delete")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				SQLOperations.deleteItem(id, connection);
				ResultSet items = 
						  SQLOperations.getItems(connection);
				request.setAttribute("items", items);
				dispatcher = 
				 getServletContext().getRequestDispatcher("/listitems.jsp");	
			}
			dispatcher.forward(request, response);		
		} catch (Exception e) {
			System.err.println("Exception e - " + e.getMessage());
			e.printStackTrace();
		} 
	}

}
