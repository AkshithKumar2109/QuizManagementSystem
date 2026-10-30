<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>

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
            margin: 40px auto;
            padding: 20px;
        }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            flex: 1;
            min-width: 220px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            color: #2563eb;
        }

        .button {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 10px 16px;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 10px;
        }

        .button:hover {
            background: #1d4ed8;
        }

        .logout {
            background: #dc2626;
        }
    </style>
</head>

<body>
    <header>
        <h1>Student Dashboard</h1>
        <p>Welcome to the Quiz Management System</p>
    </header>

    <div class="container">
        <div class="cards">

            <div class="card">
                <h3>Available Quizzes</h3>
                <p>View quizzes and test your knowledge.</p>
                <a href="${pageContext.request.contextPath}/student-quizzes">
    View Available Quizzes
</a>
            </div>

            <div class="card">
                <h3>My Results</h3>
                <p>Check your quiz scores and performance.</p>
                <a href="results.jsp" class="button">View Results</a>
            </div>

            <div class="card">
                <h3>My Account</h3>
                <p>View your student account.</p>
                <a href="profile.jsp" class="button">My Profile</a>
            </div>

        </div>

        <p style="text-align:center; margin-top:30px;">
            <a href="login.jsp" class="button logout">Logout</a>
        </p>

        <p style="text-align:center;">
            <a href="../index.jsp">Back to Home</a>
        </p>
    </div>
</body>
</html>