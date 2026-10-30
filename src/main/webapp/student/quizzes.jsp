<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect(request.getContextPath() + "/student/login.jsp");
        return;
    }

    List<String[]> quizzes = (List<String[]>) request.getAttribute("quizzes");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Quizzes</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            margin: 0;
        }

        header {
            background: #2563eb;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }

        .quiz {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
        }

        .button {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>

<body>

<header>
    <h1>Available Quizzes</h1>
</header>

<div class="container">

    <%
        if (quizzes != null && !quizzes.isEmpty()) {
            for (String[] quiz : quizzes) {
    %>

    <div class="quiz">

        <h2><%= quiz[1] %></h2>

        <p><%= quiz[2] %></p>

        <a class="button"
           href="<%= request.getContextPath() %>/take-quiz?quizId=<%= quiz[0] %>">
            Start Quiz
        </a>

    </div>

    <%
            }
        } else {
    %>

    <div class="quiz">
        <p>No quizzes available.</p>
    </div>

    <%
        }
    %>

    <p>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </p>

</div>

</body>
</html>