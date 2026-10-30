package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.util.DBConnection;

@WebServlet("/login")
public class StudentLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT student_id, name FROM students WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    request.getSession().setAttribute(
                        "studentId", rs.getInt("student_id")
                    );

                    request.getSession().setAttribute(
                        "studentName", rs.getString("name")
                    );

                    response.sendRedirect(
                        request.getContextPath() + "/student/dashboard.jsp"
                    );

                } else {
                    response.sendRedirect(
                        request.getContextPath() + "/student/login.jsp?error=1"
                    );
                }
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
