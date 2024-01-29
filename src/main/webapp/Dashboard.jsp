<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.contact" %>
<%@ page import="com.contactDao" %>
<%@ page import="java.util.*" %>

<%
int uid=(Integer)session.getAttribute("u_id");

%>
<% 
//Get the list of users from the DAO
System.out.println("In Dashboard.jsp");
contactDao contact_dao = new contactDao();
contact_dao.setU_id(uid);
List<contact> contacts = contact_dao.getAllContacts();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>DashBoard</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css"> 
	<script src="assets/js/xlsx.js"></script>
	<script src="assets/js/jszip.js"></script>
	<script src="assets/js/xlsx.full.min.js"></script>
	<script src="exportCSV.js"></script>
	<!--  <script src="Service.js"></script>  -->
	<script src="dashboard.js"></script> 
	
 </head>
 <body >
		<div class="container-fluid">
			<div class="row">
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
						<div class="navbar-header col-md-2">
							<a class="navbar-brand" href="Dashboard.jsp">Contact Directory</a>
						</div>
						<div class="col-md-7 search-bar">
								<div class="input-group col-md-10">
								<input type="text" class="form-control" name="searchContact" id="searchContact" placeholder="Search" name="search">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
								</div>
						</div>
						<ul class="nav navbar-nav navbar-right col-md-2">
							
							<li><a href="logout.jsp"><span id="user" value=""><%=session.getAttribute("u_name") %></span> <span class="glyphicon glyphicon-log-in"></span> Logout</a>
							
						</ul>
				  </div>
				</nav>
			</div>
			<div class="col-md-2" id="leftMenu">
				  <div class="input-group col-md-10">
					<div class="input-group-btn">
					  <button class="btn btn-default create-contact-btn" type="submit" data-toggle="modal" data-target="#myModal">
						<b>
							<i class="glyphicon glyphicon-plus"></i>
							<span>Create Contact</span>
						</b>
					  </button>
					</div>
				  </div>
				<br />

				<ul class="list-group list-group-flush">
					<li class="list-group-item activeDiv" onclick="redirect('Dashboard.jsp')">Contacts</li>
				</ul>
				<hr />
				<ul class="list-group list-group-flush">
					<li class="list-group-item-2">
							<div class="panel-group">
									<div class="panel panel-default">
										<div class="panel-heading">
												<a data-toggle="collapse" href="#collapse1">
													<h4 class="panel-title">Label</h4>
												</a>
										</div>
										<div id="collapse1" class="panel-collapse collapse">
											<div class="panel-body" id="labelBody">
												<ul class="list-group list-group-flush" id="labelUl">	
														<li class="label-group-item" onclick="addLabel()">
																<span class="glyphicon glyphicon-plus label-glyphicon text-secondary" ></span>
																<span class="col">Create Label</span>
														</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
					</li>
				</ul>
				<ul class="list-group list-group-flush">
					<li class="list-group-item activeDiv" ><a href="Recycle.jsp">#Recycle Bin</a></li>
				</ul>
				<hr />
			</div>
			<div class="col-md-10" id="body-container">
				<div class="col-md-12">
						<div class="col-md-1 col-md-offset-10">
								
						</div>
						<div class="col-md-1">
								<input type="button" class="btn btn-default" value = "Export" />
						</div>
				</div>

				<table class="table" id="contactTable" >
					<thead>
					  <tr>
						
						<th> Name</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Company</th>
						<th>Job Title</th>
						<th>DOB</th>
						<th>Address</th>
					  </tr>
					</thead>
					<tbody>
			         <% for (contact con : contacts) { %>
     					   <tr>
     					   		<%int cid=con.getC_id(); %>   					   		
     					     
		           			  <td><%= con.getFname() %> <%= con.getLname()%></td>		           			 
		   			 		  <td><%= con.getMo_no() %></td>
		   					  <td><%= con.getEmail() %></td>
		   					  <td><%= con.getCom_name() %></td>
		   					  <td><%= con.getJobTitle() %></td>
		   					  <td><%= con.getDate() %></td>
		   					  <td><%= con.getAddress() %></td>
		   					  <td><a href="editContact.jsp?c_id=<%=cid %>" class="btn btn-primary btn-sm">
        							  <i class="fas fa-edit"> Edit</i>
     							  </a>
        						   <a href="deleteContact.jsp?c_id=<%=cid %>" class="btn btn-danger btn-sm">
     								    <i class="fas fa-trash">Delete</i> 
        							</a></td>
		        			</tr>
       					 <% } %>
					</tbody>
				  </table>
			</div>
			
				
				

			 <!-- Modal -->
			  <div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
				
				  <!-- Modal content-->
				  <div class="modal-content">
				  	<form name="popContactForm" id="popContactForm" action="InsertContact.jsp" method="get" onsubmit=" return (check())">
					<div class="modal-header">
					  <button type="button" id="myModalCloseBtn" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">Create Contact</h4>
					</div>
					<div class="modal-body popup-form">
							<br />
							<div class="row">
									<div class="col-md-4 col-md-offset-4">
										<img src="" id="profilePhoto" class="img-thumbnail profileImage" />
									</div>	
							</div>
							<br />
							
							<div class="row">
									<div class="col-md-4 col-md-offset-4">
											<input type="file" name="profileImage" id="profileImage" onchange="document.getElementById('profilePhoto').src = window.URL.createObjectURL(this.files[0])" />
									</div>
							</div>
							<div class="row">
								<div class="col-md-1">
								</div>
								<div class="col-md-5">
										<input type="text" class="form-control" name="FirstName" id="FirstName" Placeholder="First Name" required/>
								</div>
								<div class="col-md-5">
										<input type="text" class="form-control" name="Surname" id="Surname"  placeholder="Surname" required/>
								</div>
							</div>
							<div class="row">	
								<div class="col-md-1">
								</div>
								<div class="col-md-5">
										<input type="text" class="form-control" name="CompanyName" id="CompanyName"  Placeholder="Company Name" />
								</div>
								<div class="col-md-5">
										<input type="text" class="form-control" name="JobTitle" id="JobTitle"  placeholder="Job Title" />
								</div>
							</div>
							<div class="row">	
								<div class="col-md-1">
								</div>
								<div class="col-md-10">
										<input type="email" class="form-control" name="Email" id="Email"  Placeholder="Email Id" />
								</div>
							</div>
							<div class="row">	
								<div class="col-md-1">
								</div>
								<div class="col-md-10">
										<input type="text" class="form-control" name="PhoneNumber" id="PhoneNumber"  Placeholder="Phone Number" required/>
								</div>
							</div>
							<div class="row">	
								<div class="col-md-1">
								</div>
								<div class="col-md-10">
										<input type="Date" class="form-control" name="Date" id="date"  Placeholder="Enter DOB" />
								</div>
							</div>
							<div class="row">	
								<div class="col-md-1">
								</div>
								<div class="col-md-10">
										<input type="text" class="form-control" name="Address" id="Address"  Placeholder="Enter Your Address" required/>
								</div>
							</div>
							
						
					</div>
					<div class="modal-footer">
				 		<button type="submit" class="btn btn-default" id="Save"  >Save</button>
					    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					</form>
				  </div>
				  
				</div>
				</div>
				
			
		</div>
	<!-- jQuery library -->
	<script src="assets/js/jquery.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="assets/js/bootstrap.js"></script>


 </body>
</html>
