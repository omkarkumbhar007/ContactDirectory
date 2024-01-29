<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
 <link rel="stylesheet" href="assets/css/style.css">
 	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Edit Contact</title>
</head>
<body>
<%!
int n;

%>
<%n=(Integer)session.getAttribute("u_id"); %>
<%int cid=Integer.parseInt(request.getParameter("c_id"));%>
<%!
  String fname;
  String lname;
  String com_name;
  String jobTitle;
  String email;
  String mo_no;
  String date;
  String Address;
%>
  <%
    Connection cn=null;
    Statement stmt = null;
  try
    {
	Class.forName("com.mysql.jdbc.Driver");
	cn=DriverManager.getConnection("jdbc:mysql://localhost/contactdb","root","");
    stmt = cn.createStatement();
    String sql = "SELECT * FROM  `contacts` WHERE c_id ='" + cid + "'" ;
    ResultSet rs = stmt.executeQuery(sql);

    if (rs.next()) 
    {
       fname=rs.getString("fname");
       lname=rs.getString("lname");
       com_name=rs.getString("com_name");
       jobTitle=rs.getString("jobTitle");
       email=rs.getString("email");
       mo_no=rs.getString("mo_no");
      // date=rs.getString("date");
      //Address=rs.getString("address");
     } 
    }
 catch(Exception e)
 {
	e.printStackTrace();
 }

 %>
	<div class="container" id="">
		<div class="col-sm-10 col-md-6 login-form">
			<h2 class="col-md-offset-2">Update Contact</h2>
			<br />
			<form class="form-horizontal" action="" method="post">
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="fullname"  >First Name</label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="text" name="fname" id="fname" value="<%=fname%>"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="fullname"  >Last Name</label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="text" name="lname" id="lname" value="<%=lname%>" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="emailid">Email Id</label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="text" name="email"  value="<%=email%>" id="email" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="username">Company Name</label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="text" name="com_name" id="com_name" value="<%=com_name%>"/>
					</div>
				</div>

				<div class="form-group">	
					<label class="control-label col-md-4 col-sm-4"  for="password">Job Title</label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control"  type="text" name="jobTitle" value="<%=jobTitle%>" id="jobTitle" />
					</div>
				</div>
				<div class="form-group">	
					<label class="control-label col-md-4 col-sm-4"  for="password">Phone Number</label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control"  type="text" name="mo_no" value="<%=mo_no%>" id="reg-password" />
					</div>
				</div>
				
				<br />
				<div class="form-group">
					<div class="modal-footer">
						<button type="submit" class="btn btn-default " id="popUpdate" name="btn">Update</button>
					  <a href="Dashboard.jsp">  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></a>
					</div>
				</div>
				
				<div class="form-group" id = "message">
					<div class="col-md-offset-4 col-sm-offset-2">
						
						
					</div>
				</div>
			</form>
		</div>
	</div>
	<%
	
	String bt=request.getParameter("btn");
	 if(bt!=null)
	   {
	     try
	    { 
	   
	     String fname=request.getParameter("fname");
	     String lname=request.getParameter("lname");
	     String email=request.getParameter("email");
	     String mo_no=request.getParameter("mo_no");
	     String com_name= request.getParameter("com_name");
	     String jobTitle= request.getParameter("jobTitle");
	   
	    Class.forName("com.mysql.jdbc.Driver");
		//System.out.println("Driver loaded");
		cn=DriverManager.getConnection("jdbc:mysql://localhost/contactdb","root","");
		
		String sql="UPDATE `contacts` SET `fname`=?,`lname`=?,`com_name`=?,`jobTitle`=?,`email`=?,`mo_no`=? WHERE c_id ='" + cid + "'";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1,fname);
		ps.setString(2,lname);
		ps.setString(3,com_name);
		ps.setString(4,jobTitle);
		ps.setString(5,email);
		ps.setString(6,mo_no);
		
		int cnt=ps.executeUpdate();
		
		if(cnt>0)
		{%> 
	       
	    	<html>
	    	<head>
	    	<script>
			  
			  
			   // Wait for the user to click "OK"
			   var result = confirm("Contact Updated Successfully!!!");
			  
			   // If the user clicked "OK", redirect to the next page
			   if (result)
			      {
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
	}
 	     catch(Exception e)
     	{
	     	e.printStackTrace();
	    }
	     finally
	     {
		  cn.close();
       	}
   }
 %>
	
	
	
				
				<!-- jQuery library --> 
	<script src="assets/js/jquery.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="assets/js/bootstrap.js"></script>
				
</body>
</html>