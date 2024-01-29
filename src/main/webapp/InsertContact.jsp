<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%
		Connection cn=null;
		String f_name=request.getParameter("FirstName");
		String l_name=request.getParameter("Surname");
		String com_name=request.getParameter("CompanyName");
		String jobTitle=request.getParameter("JobTitle");
		String pnone_no=request.getParameter("PhoneNumber");
		String email=request.getParameter("Email");
		String date=(String)request.getParameter("Date");
		
		String address=request.getParameter("Address");
		
		int u_id=(Integer)session.getAttribute("u_id");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("Driver loaded");
			cn=DriverManager.getConnection("jdbc:mysql://localhost/contactdb","root","");
			
			String sql="INSERT INTO `contacts`( `u_id`, `fname`, `lname`, `com_name`, `jobTitle`, `email`, `mo_no`,`date`,`address`) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setInt(1,u_id);
			ps.setString(2,f_name);
			ps.setString(3,l_name);
			ps.setString(4,com_name);
			ps.setString(5,jobTitle);
			ps.setString(6,email);
			ps.setString(7,pnone_no);
			ps.setString(8,date);
			ps.setString(9,address);
			
			int cnt=ps.executeUpdate();
			
			if(cnt>0)
			{%> 
		       
		    	<html>
		    	<head>
		    	<script>
				  
				  
				  // Wait for the user to click "OK"
				  var result = confirm("Contact Saved Successfully!!!");
				  
				  // If the user clicked "OK", redirect to the next page
				  if (result) {
				    window.location.href = "Dashboard.jsp";
	 				}
				  else
					  {
					    window.location.href = "Dashboard.jsp";

					  }
				</script>
				</head>
				</html>
		    	
		   <% 
				
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
%>
</body>
</html>