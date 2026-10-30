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

@WebServlet("/student-results")
public class StudentResultsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Object id = request.getSession().getAttribute("studentId");

        if (id == null) {
            response.sendRedirect(
                request.getContextPath() + "/student/login.jsp"
            );
            return;
        }

        int studentId = (Integer) id;

        List<String[]> results = new ArrayList<>();

        String sql = "SELECT r.result_id, q.title, r.score, r.total_questions " +
                     "FROM results r JOIN quizzes q ON r.quiz_id = q.quiz_id " +
                     "WHERE r.student_id = ? ORDER BY r.result_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    results.add(new String[] {
                        String.valueOf(rs.getInt("result_id")),
                        rs.getString("title"),
                        String.valueOf(rs.getInt("score")),
                        String.valueOf(rs.getInt("total_questions"))
                    });
                }
            }

            request.setAttribute("results", results);

            request.getRequestDispatcher("/student/results.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
