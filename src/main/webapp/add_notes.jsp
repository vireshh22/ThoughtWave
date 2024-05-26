<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>

		<!-- add form -->
		<form class="m-5" action="SaveNoteServlet" method="post" >
		
			<h1>Add Notes</h1>
			<div class="form-group">
				<label for="exampleInputEmail1">Note Title</label> 
				<input required type="text" name="title" class="form-control" id="title" placeholder="Enter Title Of The Note"> 
			</div>
			
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label> 
				<textarea required class="form-control" id="content" name="content" placeholder="Enter Content Of The Note" style="height:220px"></textarea>
			</div>
			
			<div class="container text-center" >
				<button type="submit" class="btn btn-primary">Add Note</button>
			</div>
			
		</form>
	</div>

</body>
</html>