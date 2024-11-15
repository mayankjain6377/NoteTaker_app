<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add notes</title>
<%-- <%@include file="all_js_css.jsp" %> --%>
</head>
<body>
  
  <div class="container-fluid"   >
  <%@include file="Navbar.jsp" %>
  
  
  </div >
<h1 style="margin-left:50px;">Write Your Notes..... </h1>

<form action="SaveNoteServlet" method="post" class="container" style="background-color:#eeeeee">
  <div class="mb-3">
    <label for="exampleInputEmail1"
    
     class="form-label">
     Note title</label>
    <input
     type="text"
      name="title"
      placeholder="Enter your notes title"
     class="form-control" 
     id="title">
  
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Note Content</label>
<textarea id="content"
required="required"
 class="form-control"
  name="content"
  placeholder="Enter your notes here "
  style="height: 270px;"
  ></textarea>
  </div>
<div class="container text-center">
<button type="submit" class="btn btn-primary mb-3 ">Add Note</button>

</div>
  </form>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>