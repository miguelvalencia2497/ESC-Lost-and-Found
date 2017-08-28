package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.esc.utility.BeanFactory;
import com.esc.utility.sql.SQLOperations;

import ust.esc.model.Item;


@WebServlet("/additem.html")
public class AddItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection connection;
	
	public void init() throws ServletException {
		connection = SQLOperations.getConnection();
		
		if (connection != null) {
			getServletContext().setAttribute("dbConnection", connection);
			System.out.println("connection is READY.");
		} else {
			System.err.println("connection is NULL.");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item = request.getParameter("item");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		String foundat = request.getParameter("foundat");
		String foundby = request.getParameter("foundby");
		
		Item itemBean = BeanFactory.getItemBean(item, description, date, foundat, foundby);
		
		if (connection != null) {
			if (SQLOperations.addEmployee(itemBean, connection)){
				System.out.println("successful insert");
				request.setAttribute("itemBean", itemBean);
				getServletContext().getRequestDispatcher("/actionstatus.jsp?success=true").forward(request, response);
			} else {
				System.out.println("failed insert");
				getServletContext().getRequestDispatcher("/actionstatus.jsp?success=false").forward(request, response);
			}
		} else {
			System.out.println("invalid connection");
		}
	}

}
