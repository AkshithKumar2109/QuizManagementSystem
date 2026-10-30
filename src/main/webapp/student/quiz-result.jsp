<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            text-align: center;
            padding-top: 100px;
        }

        .result {
            background: white;
            padding: 35px;
            max-width: 400px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 4px 15px #ddd;
        }

        h1 {
            color: #2563eb;
        }

        .score {
            font-size: 30px;
            font-weight: bold;
            color: #16a34a;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            background: #2563eb;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>

<body>
    <div class="result">
        <h1>Quiz Completed!</h1>

        <p>Your Score</p>

        <div class="score">
            <%= request.getAttribute("score") %>
            /
            <%= request.getAttribute("totalQuestions") %>
        </div>

        <p>Thank you for taking the quiz.</p>

        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>