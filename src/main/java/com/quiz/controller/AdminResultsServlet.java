package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.util.DBConnection;

@WebServlet("/admin-results")
public class AdminResultsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("adminUsername") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
            return;
        }

        List<String[]> results = new ArrayList<>();

        String sql = "SELECT r.result_id, s.name, q.title, " +
                     "r.score, r.total_questions " +
                     "FROM results r " +
                     "JOIN students s ON r.student_id = s.student_id " +
                     "JOIN quizzes q ON r.quiz_id = q.quiz_id " +
                     "ORDER BY r.result_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String[] row = {
                    String.valueOf(rs.getInt("result_id")),
                    rs.getString("name"),
                    rs.getString("title"),
                    String.valueOf(rs.getInt("score")),
                    String.valueOf(rs.getInt("total_questions"))
                };

                results.add(row);
            }

            request.setAttribute("results", results);

            request.getRequestDispatcher("/admin/results.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Unable to load quiz results.", e);
        }
    }
}
