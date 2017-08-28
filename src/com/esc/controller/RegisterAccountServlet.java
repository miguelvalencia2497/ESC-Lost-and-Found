package com.esc.controller;

import java.io.IOException;

import java.sql.Connection;

import ust.esc.model.*;
import com.esc.utility.*;
import com.esc.utility.sql.SQLOperations;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterAccountServlet
 */
@WebServlet("/RegisterAccountServlet")
public class RegisterAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPass = request.getParameter("confirmPass");
		boolean admin = false;
		if(request.getParameter("admin") != null){
			admin = true;
		}
		
		
		
		AccountBean ab = BeanFactory.getAccountBean(1, username, password, admin);
		System.out.println(request.getParameter("admin"));
		
		if(SQLOperations.hanapUsername(username, connection) ==0)
		{
		if(password.equals(confirmPass)){
			if(connection!=null){
				if (SQLOperations.addAccount(ab, connection)){
					System.out.println("successful insert");
					request.setAttribute("ab", ab);
					getServletContext().getRequestDispatcher("/actionstatusAcc.jsp?success=true").forward(request, response);
				} else {
					System.out.println("failed insert");
					getServletContext().getRequestDispatcher("/actionstatusAcc.jsp?success=false").forward(request, response);
				}
			}
			else{
				System.out.println("invalid connection");
			}
		}else{
			System.out.println("failed insert");
			getServletContext().getRequestDispatcher("/actionstatusAcc.jsp?success=false").forward(request, response);
		}
	}
	else if(SQLOperations.hanapUsername(username, connection)!=0){System.out.println("THERE IS AN EXISITING USERNAME");
	getServletContext().getRequestDispatcher("/actionstatusAcc.jsp?success=false").forward(request, response);}
}}
	



