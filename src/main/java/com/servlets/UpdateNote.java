package com.servlets;

import java.io.IOException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.entities.Note;

public class UpdateNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int id = Integer.parseInt(request.getParameter("note_Id").trim());
			Configuration cfg = new Configuration();
            cfg.configure("hibernate.cfg.xml");
            SessionFactory factory = cfg.buildSessionFactory();
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();
            Note note = (Note) s.get(Note.class, id);
            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());
            tx.commit();
            s.close();
            factory.close();
            
            response.sendRedirect("all_notes.jsp");
		}catch(Exception e) {
			
		}
	}

}
