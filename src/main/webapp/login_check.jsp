<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
	Connection cn=null;
	Statement stmt = null;
  try
	{
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver loaded");
		cn=DriverManager.getConnection("jdbc:mysql://localhost/contactdb","root","");

	    stmt = cn.createStatement();
	    String sql = "SELECT * FROM register WHERE username = '" + username + "' AND password = '" + password + "'";
	    ResultSet rs = stmt.executeQuery(sql);

	    if (rs.next()) {
	     	int user_id=rs.getInt("u_id");
	     	 session = request.getSession(true);
	     	session.setAttribute("u_id", user_id);
	     	String user_name=rs.getString("Name");
	     	session.setAttribute("u_name", user_name );
	     	
	     	 response.sendRedirect("Dashboard.jsp");
	      
	    } 
	    else 
	    {
	    	%> 
	       
	    	<html>
	    	<head>
	    	<script>
			  
			  
			  // Wait for the user to click "OK"
			  var result = confirm("Invalid UserName Or Password");
			  
			  // If the user clicked "OK", redirect to the next page
			  if (result) {
			    window.location.href = "login.jsp";
 				}
			</script>
			</head>
			</html>
	    	
	   <% 
	    }
	}
  	catch
  	(Exception e)
	{
		e.printStackTrace();
	}

 
%>
