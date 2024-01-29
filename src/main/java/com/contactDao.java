package com;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
public class contactDao 
{

		Connection conn;
		int u_id;
		public void setU_id(int uid)
		{
			this.u_id=uid;
		}
		public contactDao() throws Exception
		{
			//database connection using JDBC 
			 Class.forName("com.mysql.jdbc.Driver");
		      conn = DriverManager.getConnection("jdbc:mysql://localhost/contactdb", "root", "");
		      
		      //int u_id=(Integer)session.getAttribute("u_id"); trying to getsession attribute
		}
	    public List<contact> getAllContacts() throws Exception 
	    {
	        List<contact> contacts = new ArrayList<>(); //list of contacts 
	       
	        // Connect to the database
	      
	        // Execute a query to get all the contacts
	        Statement stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery("SELECT * FROM contacts WHERE u_id ='" + u_id + "' AND deleted=1");

	        // Loop through the results and create contacts objects
	        while (rs.next()) {
	        	contact contact = new contact();
	        	
	        	contact.setC_id(rs.getInt("c_id"));
	            contact.setFname(rs.getString("fname"));
	            contact.setLname(rs.getString("lname"));
	            contact.setCom_name(rs.getString("com_name"));
	            contact.setJobTitle(rs.getString("jobTitle"));
	            contact.setEmail(rs.getString("email"));
	            contact.setMo_no(rs.getString("mo_no"));
	            contact.setDate(rs.getString("date"));
	            contact.setAddress(rs.getString("address"));
	            
	            contacts.add(contact);
	        }

	        // Close the resources
	        rs.close();
	        stmt.close();
	        

	        return contacts;
	    }
	    //Recycle Contacts
	    
	    public List<contact> getAllRecycleContacts() throws Exception 
	    {
	        List<contact> recycle = new ArrayList<>(); //list of contacts 
	       
	        // Connect to the database
	      
	        // Execute a query to get all the contacts
	        Statement stmt1 = conn.createStatement();
	        ResultSet rs1 = stmt1.executeQuery("SELECT * FROM contacts WHERE u_id ='" + u_id + "' AND deleted=0");

	        // Loop through the results and create contacts objects
	        while (rs1.next()) {
	        	contact contact1 = new contact();
	        	
	        	contact1.setC_id(rs1.getInt("c_id"));
	            contact1.setFname(rs1.getString("fname"));
	            contact1.setLname(rs1.getString("lname"));
	            contact1.setCom_name(rs1.getString("com_name"));
	            contact1.setJobTitle(rs1.getString("jobTitle"));
	            contact1.setEmail(rs1.getString("email"));
	            contact1.setMo_no(rs1.getString("mo_no"));
	            contact1.setDate(rs1.getString("date"));
	            contact1.setAddress(rs1.getString("address"));
	            
	            recycle.add(contact1);
	        }

	        // Close the resources
	        rs1.close();
	        stmt1.close();
	        

	        return recycle;
	    }
	}

