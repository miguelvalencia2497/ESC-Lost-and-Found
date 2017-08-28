package com.esc.utility;

import java.io.InputStream;


import ust.esc.model.*;

public class BeanFactory {

	
public static AccountBean getAccountBean(int idaccounts, String username, String password, boolean admin){
		
		AccountBean ab = new AccountBean();
		ab.setIdaccounts(idaccounts);
		ab.setUsername(username);
		ab.setPassword(password);
		ab.setAdmin(admin);
		
		
		
		return ab;
		
	}
	public static Item getItemBean(String item, 
			String description, String date, 
			String foundat, String foundby) {
			
			Item itemBean = new Item();
			itemBean.setItem(item);
			itemBean.setDescription(description);
			itemBean.setDate(date);
			itemBean.setFoundat(foundat);
			itemBean.setFoundby(foundby);
			
			return itemBean;
	}
	
	public static LostItem getLostItemBean(String item, String description, String date, String lostat, String studnum, String contact){
		LostItem lostitem = new LostItem();
		
		lostitem.setItem(item);
		lostitem.setDescription(description);
		lostitem.setDate(date);
		lostitem.setLostat(lostat);
		lostitem.setStudnum(studnum);
		lostitem.setContact(contact);
		
		return lostitem;
	}
	
	public static Announcement getAnnouncementBean(String title, String body, InputStream inputStream){
		Announcement announcement = new Announcement();
		
		announcement.setTitle(title);
		announcement.setBody(body);
		announcement.setInputStream(inputStream);
		
		return announcement;
	}
}
