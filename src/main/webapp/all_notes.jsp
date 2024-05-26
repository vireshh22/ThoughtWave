<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Query" %>
<%@page import="java.util.*" %>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThoughtWave||All Notes</title>
<%@include file="all_js.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>
		
		<h1 class="text-uppercase">All Notes</h1>
		
		<div class="row">
			<div class="col-12">
				<%
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory factory = cfg.buildSessionFactory();
			Session s = factory.openSession();
			Query q = s.createQuery("from Note");
			List<Note> list = q.list();
			for(Note note : list){
				%>
				<div class="card m-3">
  				<div class="card-body">
    			<h5 class="card-title"><%= note.getTitle()%></h5>
    			<p class="card-text"><%= note.getContent()%></p>
    			<a href="#" class="btn btn-danger">Delete</a>
  				</div>
				</div>
			<% 
			}	
			s.close();
			factory.close();
			%>
			
		%>
			</div>
		</div>
		
		
		
	</div>

</body>
</html>