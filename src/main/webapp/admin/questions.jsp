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
    <title>Manage Questions</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
        }

        header {
            background: #1e3a8a;
            color: white;
            padding: 20px 35px;
        }

        .container {
            max-width: 800px;
            margin: 35px auto;
            padding: 20px;
        }

        .panel {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 8px 0 15px;
            box-sizing: border-box;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
        }

        button {
            background: #2563eb;
            color: white;
            padding: 12px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>

<header>
    <h2>Quiz Management System — Admin</h2>
</header>

<div class="container">
    <a href="dashboard.jsp">← Back to Dashboard</a>

    <div class="panel">
        <h1>Add Questions</h1>
        <p>Select a quiz and enter a question with four options.</p>

        <form action="${pageContext.request.contextPath}/add-question" method="post">

            <label>Quiz ID</label>
            <input type="number" name="quizId" min="1"
                   placeholder="Enter the Quiz ID" required>

            <label>Question</label>
            <input type="text" name="questionText"
                   placeholder="Enter your question" required>

            <label>Option A</label>
            <input type="text" name="optionA" required>

            <label>Option B</label>
            <input type="text" name="optionB" required>

            <label>Option C</label>
            <input type="text" name="optionC" required>

            <label>Option D</label>
            <input type="text" name="optionD" required>

            <label>Correct Answer</label>
            <select name="correctOption" required>
                <option value="">Select the correct option</option>
                <option value="A">Option A</option>
                <option value="B">Option B</option>
                <option value="C">Option C</option>
                <option value="D">Option D</option>
            </select>

            <button type="submit">Add Question</button>
        </form>
    </div>
</div>

</body>
</html>