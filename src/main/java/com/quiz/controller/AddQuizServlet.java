package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.util.DBConnection;

@WebServlet("/add-quiz")
public class AddQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("adminUsername") == null) {
            response.sendRedirect(
                request.getContextPath() + "/admin/login.jsp"
            );
            return;
        }

        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        String sql = "INSERT INTO quizzes (title, description) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, title);
            ps.setString(2, description);

            ps.executeUpdate();

            response.sendRedirect(
                request.getContextPath() + "/admin/quizzes.jsp?success=1"
            );

        } catch (SQLException e) {
            throw new ServletException("Unable to save quiz.", e);
        }
    }
}