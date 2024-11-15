<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.entities.Note" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Notes</title>
    <%@ include file="all_js_css.jsp" %>
    <style type="text/css">
        /* Add any additional custom styles here */
    </style>
</head>
<body>
    <div class="container-fluid">
        <%@ include file="Navbar.jsp" %>
        <br>
        <h1>All Notes:</h1>

        <%
            Session session2 = null;
            List<Note> list = null;
            String query = request.getParameter("query"); // Get the search query from the form

            try {
                // Open a session from the FactoryProvider
                session2 = FactoryProvider.getFactory().openSession();

                if (query != null && !query.trim().isEmpty()) {
                    // Search notes based on the title
                    Query<Note> q = session2.createQuery("from Note where title like :title", Note.class);
                    q.setParameter("title", "%" + query + "%"); // Use wildcards for partial matching
                    list = q.list();
                } else {
                    // Fetch all notes if no search query is provided
                    Query<Note> q = session2.createQuery("from Note", Note.class);
                    list = q.list();
                }

                // Loop through each note and display it
                if (list != null && !list.isEmpty()) {
                    for (Note note : list) {
        %>
                        <div class=" card mt-4 " style="width: 48rem; background-color:#fff3e0; height: 350px; display: block; margin-left: 17rem; overflow-y: auto; ">
                            <!-- Image for the note -->
                            <img class="card-img-top" style="margin-left:30px; width: 120px; height: 150px; object-fit: cover;" 
                                 src="https://th.bing.com/th/id/OIP.FT43yoyO6azmzGOJA0xcrgHaG2?rs=1&pid=ImgDetMain" alt="Card image cap">

                            <!-- Card Body containing the note title, content and action buttons -->
                            <div class="card-body">

                                <!-- Note Title -->
                                <h5 class="card-title">Title: <%= note.getTitle() %></h5>
                                <p class="text-primary">
                                    <%
                                        // Format the date
                                        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("hh:mm a, dd-MM-yy");
                                        String formattedDate = formatter.format(note.getAddeddate());
                                    %>
                                    <%= formattedDate %>
                                </p>
                                <!-- Note Content -->
                                <p class="card-text dark"><%= note.getContent() %></p>
                                <!-- Action Buttons: Edit, Share, Delete -->
                                <div class="d-flex gap-3 px-2">
                                    <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-warning">Edit</a>
                                    <a href="#" class="btn btn-success">Share</a>
                                    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </div>
        <%
                    }
                } else {
        %>
                    <h5>No notes found for your search query.</h5>
        <%
                }
            } catch (Exception e) {
                // Handle any exceptions
                e.printStackTrace();
            } finally {
                // Close the session to release resources
                if (session2 != null) {
                    session2.close();
                }
            }
        %>
    </div>

    <!-- Include Bootstrap JS bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
