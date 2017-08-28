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

import ust.esc.model.AccountBean;
import ust.esc.model.ItemBean;
import com.esc.utility.sql.SQLOperations;


@WebServlet("/account.html")
public class UsernameMaintenanceServlet extends HttpServlet {
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
				int idaccounts = Integer.parseInt(request.getParameter("id"));
				System.out.println(idaccounts);
				AccountBean ab = 
				  SQLOperations.searchAccount(idaccounts, connection);
				request.setAttribute("rs", ab);
				dispatcher = 
				 getServletContext().getRequestDispatcher("/changepw.jsp");
			} else if (request.getParameter("action").equals("delete")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				SQLOperations.deleteItem(id, connection);
				ResultSet rs = 
						  SQLOperations.getItems(connection);
				request.setAttribute("recordEmployees", rs);
				dispatcher = 
				 getServletContext().getRequestDispatcher("/listemployees.jsp");	
			}
			dispatcher.forward(request, response);		
		} catch (Exception e) {
			System.err.println("Exception e - " + e.getMessage());
			e.printStackTrace();
		} 
	}

}
