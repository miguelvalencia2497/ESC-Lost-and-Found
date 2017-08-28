package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import ust.esc.model.LostItem;

import com.esc.utility.BeanFactory;
import com.esc.utility.sql.SQLOperations;

@WebServlet("/reportitem.html")
public class ReportItemServlet extends HttpServlet {
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item = request.getParameter("item");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		String lostat = request.getParameter("lostat");
		String studnum = request.getParameter("studnum");
		String contact = request.getParameter("contact");
		
		LostItem lostitem = BeanFactory.getLostItemBean(item, description, date, lostat, studnum, contact);
		
		if (connection != null) {
			if (SQLOperations.addLostItem(lostitem, connection)){
				System.out.println("successful insert");
				request.setAttribute("lostitem", lostitem);
				RequestDispatcher dispatcher = request.getRequestDispatcher("actionstatus2.jsp?success=true");
				dispatcher.forward(request, response);
			} else {
				System.out.println("failed insert");
				request.setAttribute("lostitem", lostitem);
				RequestDispatcher dispatcher = request.getRequestDispatcher("actionstatus2.jsp?success=false");
				dispatcher.forward(request, response);
			}
		} else {
			System.out.println("invalid connection");
		}
	}

}
