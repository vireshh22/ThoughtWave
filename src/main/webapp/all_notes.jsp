<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Query" %>
<%@page import="java.util.*" %>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThoughtWave || All Notes</title>
<%@include file="all_js.jsp"%>

<style>
    .white {
        filter: invert(100%) brightness(2) contrast(0.5);
    }

    .card {
        display: flex;
        flex-direction: column;
        height: 100%;
        border: 1px solid #ccc;
        border-radius: 8px;
        overflow: hidden; /* Hide any overflow from card body */
    }
    .card-header {
        display: flex;
        align-items: center;
        padding: 10px;
        background-color: #2F4F4F; /* Purple background */
        color: white;
    }
    .card-body {
        flex-grow: 1;
        overflow-y: auto; /* Enable vertical scrolling for card body */
        padding: 10px;
    }
    .card-footer {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        background-color: #f8f9fa; /* Light gray background */
        border-top: 1px solid #ccc; /* Top border to separate footer from body */
    }
</style>
</head>
<body>
    <div class="container-fluid p-0 m-0">
        <%@include file="navbar.jsp"%>
        <br>
        
        <h1 class="text-uppercase text-center mb-4">All Notes</h1>
        
        <div class="row justify-content-center m-3">
            <%
                Configuration cfg = new Configuration();
                cfg.configure("hibernate.cfg.xml");
                SessionFactory factory = cfg.buildSessionFactory();
                Session s = factory.openSession();
                Query q = s.createQuery("from Note");
                List<Note> list = q.list();
                if (list.isEmpty()) {
                    out.println("<h4 class='display-3 text-center'>No Notes Available</h4>");
                } else {
                    for (Note note : list) {
            %>    
            <div class="col-md-4 col-sm-6 mt-3"> 
                <div class="card shadow-sm h-100">
                    <div class="card-header">
                        <div class="col-4 p-0 text-center">
                            <img src="images/pen.png" class="card-img-top img-fluid white" style="max-width: 80px;" alt="Image"/>
                        </div>
                        <div class="col-8">
                            <h5 class="mb-0 font-weight-bold"><%= note.getTitle() %></h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="card-body-content">
                            <p class="card-text"><%= note.getContent() %></p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="DeleteNote?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                        <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                    </div>
                </div>
            </div>
            <%
                    }
                }
                s.close();
                factory.close();
            %>
        </div>
    </div>
</body>
</html>
