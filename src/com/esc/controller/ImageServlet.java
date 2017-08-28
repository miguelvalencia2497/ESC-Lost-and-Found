package com.esc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.esc.utility.sql.SQLOperations;

import ust.esc.model.Image;


@WebServlet("/imageservlet.html")
public class ImageServlet extends HttpServlet {
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
		 String imageId = request.getParameter("id");
		 
		 if (imageId == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND);
	            return;
	     }
		 
		 Image image = SQLOperations.getImage(imageId, connection);

		 if (image == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND);
	            return;
	     }
		 response.reset();
	     response.setContentLength(image.getContent().length);
	     response.getOutputStream().write(image.getContent());


	}

}
