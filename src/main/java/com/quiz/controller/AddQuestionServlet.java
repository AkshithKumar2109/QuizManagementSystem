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

@WebServlet("/add-question")
@WebServlet("/take-quiz")
public class TakeQuizServlet extends HttpServlet {

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

        String quizIdText = request.getParameter("quizId");
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        try {
            int quizId = Integer.parseInt(quizIdText);

            if (!correctOption.matches("[ABCD]")) {
                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid correct answer."
                );
                return;
            }

            String sql = "INSERT INTO questions " +
                "(quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, quizId);
                ps.setString(2, questionText);
                ps.setString(3, optionA);
                ps.setString(4, optionB);
                ps.setString(5, optionC);
                ps.setString(6, optionD);
                ps.setString(7, correctOption);

                ps.executeUpdate();
            }

            response.sendRedirect(
                request.getContextPath() + "/admin/questions.jsp?success=1"
            );

        } catch (NumberFormatException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Quiz ID must be a valid number."
            );
        } catch (SQLException e) {
            throw new ServletException("Unable to save question.", e);
        }
    }
}
