package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ust.esc.model.Item;

import com.esc.utility.sql.*;

@WebServlet("/itemupdate.html")
public class UpdateItemServlet extends HttpServlet {
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
		RequestDispatcher dispatcher = null;
		try{
			Item item = new Item();
			item.setItem(request.getParameter("item"));
			item.setDescription(request.getParameter("description"));
			item.setDate(request.getParameter("date"));
			item.setFoundat(("foundat"));
			item.setFoundby(request.getParameter("foundby"));
			
			int recordsAffected = 
					SQLOperations.updateEmployee(item, 
							Integer.parseInt(request.getParameter("id")), 
							connection);
				request.setAttribute("item", item);
				
			if (recordsAffected > 0) {
				dispatcher = getServletContext().getRequestDispatcher("/viewitem.jsp?success=true");
			} else {
				dispatcher = getServletContext().getRequestDispatcher("/vieweitem.jsp?success=false");
			}
			
			dispatcher.forward(request, response);
		}	catch (Exception e) {
			e.printStackTrace();
		} 	
	}

}
