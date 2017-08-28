package com.esc.utility.sql;

public interface SQLCommands {
	String INSERT_ITEM = "Insert into items(item, description, date, foundat, foundby) values(?, ?, ?, ?, ?)";
	String INSERT_LOST_ITEM = "Insert into lostitems(item, description, datelost, lostat, studentnum, contactnum) values(?, ?, ?, ?, ?, ?)";
	String INSERT_ANNOUNCEMENT = "Insert into announcements(title, body, image) values(?, ?, ?)";
	
	String GET_LIST_FIND_ITEM = "Select * from items where item = ?;";
	String GET_LIST_FIND_DESCRIPTION = "Select * from items where description = ?;";
	String GET_LIST_FIND_DATE = "Select * from items where date = ?;";
	String GET_LIST_FIND_FOUNDAT = "Select * from items where foundat = ?;";
	String GET_LIST_ANNOUNCEMENTS = "Select * from announcements";
	String GET_IMAGE = "Select * from announcements where id = ?";
	String GET_LOST_ITEMS = "Select * from lostitems";
	String GET_ITEMS = "Select * from items";
	String SEARCH_ACCOUNT= "select * from accounts where id=?";
	String UPDATE_USERNAME = "update accounts set username = ?,password =? where id = ?";
	String DELETE_ANNOUNCEMENT = "Delete from announcements where id = ?";
	String CHECK_USERNAME ="select count(*) from accounts where username=?";
	String INSERT_ACCOUNT = "insert into accounts(username, password, admin) values (?,?,?)";
	String SEARCH_ITEM = "select * from items where id=?";
	String SEARCH_USERNAME = "Select * from accounts";
	String DELETE_ITEM = "delete from items where id=?";
	String DELETE_LOST_ITEM = "delete from lostitems where id=?";
	String UPDATE_ITEM = "update items set item = ?, "
			+ "description = ?, date=?, "
			+ "foundat=?, foundby=? where id = ?";
}
