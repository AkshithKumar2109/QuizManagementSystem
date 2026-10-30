package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.util.DBConnection;

@WebServlet("/submit-quiz")
public class SubmitQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Object studentObject =
            request.getSession().getAttribute("studentId");

        if (studentObject == null) {
            response.sendRedirect(
                request.getContextPath() + "/student/login.jsp"
            );
            return;
        }

        int studentId = (Integer) studentObject;
        int quizId;

        try {
            quizId = Integer.parseInt(request.getParameter("quizId"));
        } catch (NumberFormatException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid quiz ID."
            );
            return;
        }

        int score = 0;
        int totalQuestions = 0;

        String sql =
            "SELECT question_id, correct_option FROM questions WHERE quiz_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quizId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    totalQuestions++;

                    int questionId = rs.getInt("question_id");

                    String correctAnswer =
                        rs.getString("correct_option");

                    String submittedAnswer =
                        request.getParameter("q" + questionId);

                    if (submittedAnswer != null &&
                        correctAnswer.equalsIgnoreCase(submittedAnswer)) {
                        score++;
                    }
                }
            }

            if (totalQuestions == 0) {
                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "This quiz has no questions."
                );
                return;
            }

            String insertSql =
                "INSERT INTO results " +
                "(student_id, quiz_id, score, total_questions) " +
                "VALUES (?, ?, ?, ?)";

            try (PreparedStatement insert =
                     con.prepareStatement(insertSql)) {

                insert.setInt(1, studentId);
                insert.setInt(2, quizId);
                insert.setInt(3, score);
                insert.setInt(4, totalQuestions);

                insert.executeUpdate();
            }

            request.setAttribute("score", score);
            request.setAttribute("totalQuestions", totalQuestions);

            request.getRequestDispatcher("/student/quiz-result.jsp")
                   .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(
                "Unable to calculate or save quiz results.", e
            );
        }
    }
}