package com.esc.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ust.esc.model.Announcement;

import com.esc.utility.BeanFactory;
import com.esc.utility.sql.SQLOperations;

@WebServlet("/addannouncement.html")
@MultipartConfig(maxFileSize = 16177215)  
public class AddAnnouncementServlet extends HttpServlet {
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
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		InputStream inputStream = null; 
		
		Part filePart = request.getPart("image");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            inputStream = filePart.getInputStream();
            
            Announcement announcement = BeanFactory.getAnnouncementBean(title, body, inputStream);
            
            if (connection != null) {
    			if (SQLOperations.addAnnouncement(announcement, connection)){
    				System.out.println("successful insert");
    				request.setAttribute("announcement", announcement);
    				getServletContext().getRequestDispatcher("/actionstatus3.jsp?success=true").forward(request, response);
    			} else {
    				System.out.println("failed insert");
    				getServletContext().getRequestDispatcher("/actionstatus3.jsp?success=false").forward(request, response);
    			}
    		} else {
    			System.out.println("invalid connection");
    		}
        }

	}

}
