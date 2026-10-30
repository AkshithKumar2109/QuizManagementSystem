<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("adminUsername") == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
        }

        header {
            background: #1e3a8a;
            color: white;
            padding: 20px 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
        }

        .card h2 {
            color: #1e3a8a;
        }

        .card p {
            color: #64748b;
        }

        .button {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 6px;
        }

        .logout {
            background: #dc2626;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>

<body>

<header>
    <h2>Quiz Management System</h2>
    <a class="logout" href="${pageContext.request.contextPath}/index.jsp">Home</a>
</header>

<div class="container">
    <h1>Welcome, Admin!</h1>
    <p>Manage quizzes, questions, and student results from here.</p>

    <div class="cards">
        <div class="card">
            <h2>Manage Quizzes</h2>
            <p>Create and manage quizzes.</p>
            <a class="button" href="quizzes.jsp">Manage Quizzes</a>
        </div>

        <div class="card">
            <h2>Manage Questions</h2>
            <p>Add and manage quiz questions.</p>
            <a class="button" href="questions.jsp">Manage Questions</a>
        </div>

        <div class="card">
            <h2>Student Results</h2>
            <p>View quiz results.</p>
            <a class="button" href="results.jsp">View Results</a>
        </div>
    </div>
</div>

</body>
</html>