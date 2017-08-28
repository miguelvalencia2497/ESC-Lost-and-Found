package com.esc.utility.sql;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

import ust.esc.model.ItemBean;
import ust.esc.model.AccountBean;
import ust.esc.model.Announcement;
import ust.esc.model.Image;
import ust.esc.model.Item;
import ust.esc.model.LostItem;

import java.sql.*;

public class SQLOperations implements SQLCommands {

	private static Connection connection;
	
	private static Connection getDBConnection() {
		try {
		    InitialContext context = new InitialContext();
		    DataSource dataSource = (DataSource) 
		     context.lookup("java:comp/env/jdbc/UST-ESC-DS");
		    
		    if (dataSource != null) {
		    	connection = dataSource.getConnection();
		    }
		} catch (NamingException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return connection;
	 }
	
	public static Connection getConnection() {
		return (connection!=null)?connection:getDBConnection();
	}

	public static int updateAccount(AccountBean ab, 
			int idaccounts, Connection connection) {
			int updated = 0;
			try {
				connection.setAutoCommit(false);
		        PreparedStatement pstmt = 
		        	connection.prepareStatement(UPDATE_USERNAME);
		        pstmt.setString(1, ab.getUsername()); 
		        pstmt.setString(2, ab.getPassword());
		        pstmt.setInt(3, idaccounts); 
		        
		        
		        
		        updated = pstmt.executeUpdate();   
		        connection.commit();
			} catch (SQLException sqle) {
				System.out.println("SQLException - updateEmployee: " 
					+ sqle.getMessage());
				
				try {
					connection.rollback();
				} catch (SQLException sql) {
					System.err.println("Error on Update Connection Rollback - " 
						+ sql.getMessage());
				}
				return updated; 
			}	
			return updated;
		}
		

	public static int updateEmployee(ItemBean item, 
			int id, Connection connection) {
			int updated = 0;
			try {
				connection.setAutoCommit(false);
		        PreparedStatement pstmt = 
		        	connection.prepareStatement(UPDATE_ITEM);
		        pstmt.setString(1, item.getItem()); 
		        pstmt.setString(2, item.getDescription());
		        pstmt.setString(3, item.getDate());
		        pstmt.setString(4, item.getFoundat());
		        pstmt.setString(5, item.getFoundby()); 
		        pstmt.setInt(6, id); 
		        updated = pstmt.executeUpdate();   
		        connection.commit();
			} catch (SQLException sqle) {
				System.out.println("SQLException - updateEmployee: " 
					+ sqle.getMessage());
				
				try {
					connection.rollback();
				} catch (SQLException sql) {
					System.err.println("Error on Update Connection Rollback - " 
						+ sql.getMessage());
				}
				return updated; 
			}	
			return updated;
		}
	
	public static AccountBean searchAccount(int idaccounts, 
			Connection connection) {
			AccountBean ab = new AccountBean(); 
			try {
		        PreparedStatement pstmt = 
		        	connection.prepareStatement(SEARCH_ACCOUNT);
		        pstmt.setInt(1, idaccounts);             
		        ResultSet rs  = pstmt.executeQuery();
		        
		        while (rs.next()) { 
		        	
		        	ab.setIdaccounts(rs.getInt("idaccounts"));
		        	ab.setUsername(rs.getString("username"));
		        	ab.setPassword(rs.getString("password"));
		        	}
			} catch (SQLException sqle) {
				System.out.println("SQLException - searchItems: " 
						+ sqle.getMessage());
				return ab; 
			}	
			return ab;
		}
	
	public static boolean addAccount(AccountBean ab, Connection connection){
		try{
			PreparedStatement pstmt = connection.prepareStatement(INSERT_ACCOUNT);
			pstmt.setString(1, ab.getUsername());
			pstmt.setString(2, ab.getPassword());
			pstmt.setBoolean(3, ab.isAdmin());
			pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQLException -- addAccount: " + sqle.getMessage());
			return false;
		}
		return true;
	}
	public static int hanapUsername(String username, Connection connection){
		int counter = 0;
		
		try{
			String usernames = "";
			PreparedStatement pstmt = connection.prepareStatement(CHECK_USERNAME);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				usernames = rs.getString(1);
				counter = rs.getInt(1);
			}
			System.out.println("counter "+ counter);
			System.out.println("usernames "+ usernames);
			
			System.out.println("now"+counter);
			return counter;
			
		}catch(SQLException sqle){
			System.out.println("SQLException: "+ sqle.getMessage());
			return counter;
		}
		
		
	}
	public static boolean addEmployee(Item itemBean, Connection connection){
		try {
	        PreparedStatement pstmt = connection.prepareStatement(INSERT_ITEM);
	        pstmt.setString(1, itemBean.getItem()); 
	        pstmt.setString(2, itemBean.getDescription());
	        pstmt.setString(3, itemBean.getDate());
	        pstmt.setString(4, itemBean.getFoundat());
	        pstmt.setString(5, itemBean.getFoundby());
	        
	        pstmt.executeUpdate(); // execute insert statement  
		} catch (SQLException sqle) {
			System.out.println("SQLException - addEmployee: " + sqle.getMessage());
			return false; 
		}	
		return true;
	}
	
	public static boolean addLostItem(LostItem lostitem, Connection connection){
		try {
	        PreparedStatement pstmt = connection.prepareStatement(INSERT_LOST_ITEM);
	        pstmt.setString(1, lostitem.getItem()); 
	        pstmt.setString(2, lostitem.getDescription());
	        pstmt.setString(3, lostitem.getDate());
	        pstmt.setString(4, lostitem.getLostat());
	        pstmt.setString(5, lostitem.getStudnum());
	        pstmt.setString(6, lostitem.getContact());
	        	        
	        pstmt.executeUpdate(); // execute insert statement  
		} catch (SQLException sqle) {
			System.out.println("SQLException - addLostItem: " + sqle.getMessage());
			return false; 
		}	
		return true;
	}
	
	public static boolean addAnnouncement(Announcement announcement, Connection connection){
		try {
	        PreparedStatement pstmt = connection.prepareStatement(INSERT_ANNOUNCEMENT);
	        pstmt.setString(1, announcement.getTitle()); 
	        pstmt.setString(2, announcement.getBody());
	        if (announcement.getInputStream() != null) {
	        	pstmt.setBlob(3, announcement.getInputStream());
	        }        
	        pstmt.executeUpdate(); // execute insert statement  
		} catch (SQLException sqle) {
			System.out.println("SQLException - addLostItem: " + sqle.getMessage());
			return false; 
		}	
		return true;
	}
	
	public static ResultSet getListFind(Connection connection, String choice, String find){
		ResultSet list = null;
		
		try {
			PreparedStatement pstmt = null;
			if(choice.equals("item")){
				pstmt = connection.prepareStatement(GET_LIST_FIND_ITEM);
			}
			else if(choice.equals("description")){
				pstmt = connection.prepareStatement(GET_LIST_FIND_DESCRIPTION);
			}
			else if(choice.equals("date")){
				pstmt = connection.prepareStatement(GET_LIST_FIND_DATE);
			}
			else if(choice.equals("foundat")){
				pstmt = connection.prepareStatement(GET_LIST_FIND_FOUNDAT);
			}
			
			 pstmt.setString(1, find);
			 
			 list = pstmt.executeQuery();  
		} catch (SQLException sqle) {
			System.out.println("SQLException - getListFind: " 
			  + sqle.getMessage());
			return list; 
		}	
		
		return list;
	}
	
	public static ResultSet getListAnnouncements(Connection connection){
		ResultSet announcementslist = null;
		try{
		PreparedStatement pstmt = connection.prepareStatement(GET_LIST_ANNOUNCEMENTS);
		announcementslist = pstmt.executeQuery();  
		} catch (SQLException sqle) {
			System.out.println("SQLException - getListFind: " 
			  + sqle.getMessage());
			return announcementslist; 
		}	
		return announcementslist;
	}
	
	public static Image getImage(String imageId, Connection connection){
		Image image = new Image();
		ResultSet rs = null;
		try{
			PreparedStatement pstmt = connection.prepareStatement(GET_IMAGE);
			pstmt.setString(1, imageId); 
		       
			rs = pstmt.executeQuery();
		}catch(SQLException sqle) {
			System.out.println("SQLException - getListFind: " 
					  + sqle.getMessage());
					return image; 
		}
		try {
			while(rs.next()){
				image.setId(rs.getString("id"));
				image.setTitle(rs.getString("title"));
				image.setBody(rs.getString("body"));
				image.setContent(rs.getBytes("image"));
			}
		} catch (SQLException e) {
			System.out.println("SQLException - getListFind: " 
					  + e.getMessage());
					return image; 
		}
		return image;
	}
	
	public static synchronized int deleteAnnouncement(int id, Connection connection) {
		int updated = 0;
		
		try {
			connection.setAutoCommit(false);
	        PreparedStatement pstmt = connection.prepareStatement(DELETE_ANNOUNCEMENT);
	        pstmt.setInt(1, id);             
	        updated  = pstmt.executeUpdate();
	        connection.commit();
		} catch (SQLException sqle) {
			System.out.println("SQLException - deleteEmployee: " + sqle.getMessage());
			
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Delete Connection Rollback - " + sql.getMessage());
			}
			return updated; 
		}	
		return updated;
	}
	
	public static ResultSet getLostItems(Connection connection){
		ResultSet lostitems = null;
		try {
			Statement stmt = connection.createStatement();
			lostitems = stmt.executeQuery(GET_LOST_ITEMS);  
		} catch (SQLException sqle) {
			System.out.println("SQLException - getALLEmployees: " 
			  + sqle.getMessage());
			return lostitems; 
		}	
		return lostitems;
	}
	
	public static ResultSet getItems(Connection connection) {
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(GET_ITEMS);  
		} catch (SQLException sqle) {
			System.out.println("SQLException - getALLEmployees: " 
			  + sqle.getMessage());
			return rs; 
		}	
		return rs;
	}
	
	public static Item searchItem(int id, Connection connection) {
			Item item = new Item(); 
			try {
		        PreparedStatement pstmt = 
		        	connection.prepareStatement(SEARCH_ITEM);
		        pstmt.setInt(1, id);             
		        ResultSet rs  = pstmt.executeQuery();
		        
		        while (rs.next()) { 
		        	item.setItem(rs.getString("item"));
		        	item.setDescription(rs.getString("description"));
		        	item.setDate(rs.getString("date"));
		        	item.setFoundat(rs.getString("foundat"));
		        	item.setFoundby(rs.getString("foundby"));
			        }
			} catch (SQLException sqle) {
				System.out.println("SQLException - searchItems: " 
						+ sqle.getMessage());
				return item; 
			}	
			return item;
	}
	
	public static synchronized int deleteItem(int id, Connection connection) {
		int updated = 0;
		
		try {
			connection.setAutoCommit(false);
	        PreparedStatement pstmt = connection.prepareStatement(DELETE_ITEM);
	        pstmt.setInt(1, id);             
	        updated  = pstmt.executeUpdate();
	        connection.commit();
		} catch (SQLException sqle) {
			System.out.println("SQLException - deleteItem: " + sqle.getMessage());
			
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Delete Connection Rollback - " + sql.getMessage());
			}
			return updated; 
		}	
		return updated;
	}
	
	public static synchronized int deleteLostItem(int id, Connection connection) {
		int updated = 0;
		
		try {
			connection.setAutoCommit(false);
	        PreparedStatement pstmt = connection.prepareStatement(DELETE_LOST_ITEM);
	        pstmt.setInt(1, id);             
	        updated  = pstmt.executeUpdate();
	        connection.commit();
		} catch (SQLException sqle) {
			System.out.println("SQLException - deleteItem: " + sqle.getMessage());
			
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Delete Connection Rollback - " + sql.getMessage());
			}
			return updated; 
		}	
		return updated;
	}
	
	public static int updateEmployee(Item item, 
		int id, Connection connection) {
		int updated = 0;
		try {
			connection.setAutoCommit(false);
	        PreparedStatement pstmt = 
	        	connection.prepareStatement(UPDATE_ITEM);
	        pstmt.setString(1, item.getItem()); 
	        pstmt.setString(2, item.getDescription());
	        pstmt.setString(3, item.getDate());
	        pstmt.setString(4, item.getFoundat());
	        pstmt.setString(5, item.getFoundby()); 
	        pstmt.setInt(6, id); 
	        updated = pstmt.executeUpdate();   
	        connection.commit();
		} catch (SQLException sqle) {
			System.out.println("SQLException - updateEmployee: " 
				+ sqle.getMessage());
			
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " 
					+ sql.getMessage());
			}
			return updated; 
		}	
		return updated;
	}
	
	public static ResultSet getAccounts( Connection connection) {
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(SEARCH_USERNAME);  
		} catch (SQLException sqle) {
			System.out.println("SQLException - getALLEmployees: " 
			  + sqle.getMessage());
			return rs; 
		}	
		return rs;
	}
	
}
