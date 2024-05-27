<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="java.util.*" %>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThoughtWave || Edit Notes</title>
<%@include file="all_js.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
        <%@include file="navbar.jsp"%>
        <br>
        <% 
            String noteIdParam = request.getParameter("note_id");
            if (noteIdParam == null || noteIdParam.trim().isEmpty()) {
                // Handle case where note_id parameter is missing or empty
                out.println("<p>Error: Missing note_id parameter</p>");
            } else {
                try {
                    int id = Integer.parseInt(noteIdParam.trim());
                    Configuration cfg = new Configuration();
                    cfg.configure("hibernate.cfg.xml");
                    SessionFactory factory = cfg.buildSessionFactory();
                    Session s = factory.openSession();
                    Note note = (Note) s.get(Note.class, id);
                    
                    // If note found, populate form with its data
                    if (note != null) {
        %>
        
        <form class="m-5" action="UpdateNote" method="post" >
		
			<h1>Edit Note</h1>
			
			<input value="<%= note.getId() %>" name="note_Id" type="hidden" />
			
			<div class="form-group">
				<label for="exampleInputEmail1">Note Title</label> 
				<input required type="text" name="title" value="<%= note.getTitle() %>" class="form-control" id="title" placeholder="Enter Title Of The Note"> 
			</div>
			
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label> 
				<textarea required class="form-control" id="content" name="content" placeholder="Enter Content Of The Note" style="height:220px">
					<%= note.getContent() %>
				</textarea>
			</div>
			
			<div class="container text-center" >
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
			
		</form>
		 <% 
                    } else {
                        out.println("<p>Error: Note not found for id " + id + "</p>");
                    }
                    s.close();
                    factory.close();
                } catch (NumberFormatException e) {
                    out.println("<p>Error: Invalid note_id format</p>");
                }
            }
        %>
    </div>
</body>
</html>