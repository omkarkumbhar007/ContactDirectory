

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
  </head>
 <body>
        <%
	    Connection cn=null;
		String fullname=request.getParameter("fullname");
		String emailid=request.getParameter("emailid");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		   try
		      {
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    System.out.println("In Register_User.jsp ");
			    cn=DriverManager.getConnection("jdbc:mysql://localhost/contactdb","root","");
			
			    String sql="insert into register (`Name`, `Email`, `username`, `password`) values(?,?,?,?)";
			      PreparedStatement ps=cn.prepareStatement(sql);
			      ps.setString(1,fullname);
			      ps.setString(2,emailid);
			      ps.setString(3,username);
			      ps.setString(4,password);
			
			      int cnt=ps.executeUpdate();
			
			      if(cnt>0)
			        {%> 
		       
		    	       <html>
		    	        <head>
		    	        <script>
				  
				  
				         // Wait for the user to click "OK"
				          var result = confirm("User Registered Successfully!!!");
				  
				         // If the user clicked "OK", redirect to the next page
				        if (result)
				           {
				             window.location.href = "login.jsp";
	 			           }
				            else
					         {
					            window.location.href = "login.jsp";
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