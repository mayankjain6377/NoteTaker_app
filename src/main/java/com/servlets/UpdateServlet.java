package com.servlets;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve parameters from the request
            String Title = request.getParameter("title");
            String content = request.getParameter("content");
            int noteId = Integer.parseInt(request.getParameter("noteId").trim());

            // Open a session to interact with the database
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();

            // Get the existing note object by its ID
            Note note = s.get(Note.class, noteId);

            if (note != null) {
                // Update the note fields
                note.setTitle(Title);
                note.setContent(content);
                note.setAddeddate(new Date()); // Update the date to current time
                
                // Commit the transaction to save changes
                tx.commit();
            } else {
                // Handle the case where the note doesn't exist
                response.getWriter().println("Note not found");
            }

            // Close session and redirect to all notes page
            s.close();
            response.sendRedirect("all_notes.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exception that occurs
            response.getWriter().println("Error occurred while updating the note: " + e.getMessage());
        }
    }
}
