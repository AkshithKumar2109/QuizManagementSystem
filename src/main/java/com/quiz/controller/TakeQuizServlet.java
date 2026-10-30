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

@WebServlet("/take-quiz")
public class TakeQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("studentId") == null) {
            response.sendRedirect(request.getContextPath() + "/student/login.jsp");
            return;
        }

        try {
            int quizId = Integer.parseInt(request.getParameter("quizId"));

            List<String[]> questions = new ArrayList<>();

            String sql = "SELECT question_id, question_text, option_a, option_b, option_c, option_d "
                       + "FROM questions WHERE quiz_id = ?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, quizId);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        questions.add(new String[]{
                            String.valueOf(rs.getInt("question_id")),
                            rs.getString("question_text"),
                            rs.getString("option_a"),
                            rs.getString("option_b"),
                            rs.getString("option_c"),
                            rs.getString("option_d")
                        });
                    }
                }
            }

            if (questions.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND,
                        "No questions found for this quiz.");
                return;
            }

            request.setAttribute("questions", questions);
            request.setAttribute("quizId", quizId);

            request.getRequestDispatcher("/student/take-quiz.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid quiz ID.");
        } catch (java.sql.SQLException e) {
            throw new ServletException("Unable to load quiz questions.", e);
        }
    }
}