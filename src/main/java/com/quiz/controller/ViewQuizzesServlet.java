package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.util.DBConnection;

@WebServlet("/view-quizzes")
public class ViewQuizzesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("adminUsername") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
            return;
        }

        List<String[]> quizzes = new ArrayList<>();

        String sql = "SELECT quiz_id, title, description FROM quizzes";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                quizzes.add(new String[] {
                    String.valueOf(rs.getInt("quiz_id")),
                    rs.getString("title"),
                    rs.getString("description")
                });
            }

            request.setAttribute("quizzes", quizzes);

            request.getRequestDispatcher("/admin/quizzes.jsp")
                   .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Unable to retrieve quizzes.", e);
        }
    }
}