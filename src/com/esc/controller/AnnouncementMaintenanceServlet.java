package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.esc.utility.sql.SQLOperations;


@WebServlet("/announcementmaintenance.html")
public class AnnouncementMaintenanceServlet extends HttpServlet {
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
				int id = Integer.parseInt(request.getParameter("id"));
				
				SQLOperations.deleteAnnouncement(id, connection);
				ResultSet announcementslist = 
						  SQLOperations.getListAnnouncements(connection);
				request.setAttribute("announcementslist", announcementslist);
				getServletContext().getRequestDispatcher("/listannouncements.jsp")
				.forward(request, response);		
		} catch (Exception e) {
			System.err.println("Exception e - " + e.getMessage());
			e.printStackTrace();
		} 
	}

}
