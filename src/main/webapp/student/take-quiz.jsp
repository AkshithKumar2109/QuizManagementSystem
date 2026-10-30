<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect(request.getContextPath() + "/student/login.jsp");
        return;
    }

    List<String[]> questions =
        (List<String[]>) request.getAttribute("questions");

    Object quizIdObject = request.getAttribute("quizId");

    if (questions == null || quizIdObject == null) {
        response.sendRedirect(request.getContextPath() + "/student/quizzes.jsp");
        return;
    }

    int quizId = (Integer) quizIdObject;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Quiz</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
        }

        .question {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
        }

        .option {
            display: block;
            margin: 12px 0;
        }

        button {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Take Your Quiz</h1>

    <form action="<%= request.getContextPath() %>/submit-quiz" method="post">

        <input type="hidden" name="quizId" value="<%= quizId %>">

        <%
            int number = 1;

            for (String[] q : questions) {
                String questionId = q[0];
        %>

        <div class="question">

            <h3>
                Question <%= number++ %>: <%= q[1] %>
            </h3>

            <label class="option">
                <input type="radio" name="q<%= questionId %>" value="A">
                A. <%= q[2] %>
            </label>

            <label class="option">
                <input type="radio" name="q<%= questionId %>" value="B">
                B. <%= q[3] %>
            </label>

            <label class="option">
                <input type="radio" name="q<%= questionId %>" value="C">
                C. <%= q[4] %>
            </label>

            <label class="option">
                <input type="radio" name="q<%= questionId %>" value="D">
                D. <%= q[5] %>
            </label>

        </div>

        <%
            }
        %>

        <button type="submit">Submit Quiz</button>

    </form>

</div>

</body>
</html>