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
    }
    .card-body {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .card-buttons {
        display: flex;
        justify-content: center;
        margin-top: auto;
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
                    <div class="card-header d-flex align-items-center purple text-white">
                        <div class="col-4 p-0 text-center">
                            <img src="images/pen.png" class="card-img-top img-fluid white" style="max-width: 80px;" alt="Image"/>
                        </div>
                        <div class="col-8">
                            <h5 class="mb-0 font-weight-bold"><%= note.getTitle() %></h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><%= note.getContent() %></p>
                        <div class="card-buttons">
                            <a href="#" class="btn btn-danger mr-3">Delete</a>
                            <a href="#" class="btn btn-primary">Update</a>
                        </div>
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
