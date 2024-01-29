<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%!
int n;

%>
<%n=(Integer)session.getAttribute("u_id"); %>
<%int cid=Integer.parseInt(request.getParameter("c_id"));%>
	<html>
	<head>
 <script>
				  
  
  // Wait for the user to click "OK"
  var result = confirm("Do You Want To Retrieve The Contact");
	  // If the user clicked "OK", redirect to the next page
 if (result==true) 
    {
	 <%
	 	Connection cn=null;
	 Statement stmt = null;
	 try
	 {
	 	Class.forName("com.mysql.jdbc.Driver");
	 	
	 	cn=DriverManager.getConnection("jdbc:mysql://localhost/contactdb","root","");

	     stmt = cn.createStatement();
	    // String sql = "delete  FROM  `contacts` WHERE c_id ='" + cid + "'" ;
	     String sql = "UPDATE `contacts` SET deleted=1 WHERE  c_id ='" + cid + "'" ;
	      stmt.executeUpdate(sql);

	    
	    
	 }
	 catch(Exception e)
	 {
	 	e.printStackTrace();
	 }
	 finally
	 {
		 cn.close();
		 %>
		 window.location.href = "Dashboard.jsp";
		 <%
	 }

	 %>
  	}
 	 else
	  {
	  window.location.href = "Dashboard.jsp";

	  }
</script>
</head>
</html>
		    

</body>
</html>