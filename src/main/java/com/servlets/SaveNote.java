package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Transaction;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.entities.Note;
//import com.helper.FactoryProvider;

public class SaveNote extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // title, content fetch
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Note note = new Note(title, content, new Date());
            
            // storing into db
            Configuration cfg = new Configuration();
            cfg.configure("hibernate.cfg.xml");
            SessionFactory factory = cfg.buildSessionFactory();
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(note);
            tx.commit();
            session.close();
            
            factory.close();

            response.setContentType("text/html");
            
            PrintWriter pw = response.getWriter();
            pw.println("<h1 style='text-align:center;'>Note Added</h1>");
            pw.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>See All Notes</a></h1>");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
