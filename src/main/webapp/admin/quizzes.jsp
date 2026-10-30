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
    <title>Manage Quizzes</title>

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
            max-width: 1000px;
            margin: 35px auto;
            padding: 20px;
        }

        .panel {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
        }

        input, textarea {
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #e2e8f0;
            text-align: left;
        }

        th {
            background: #eff6ff;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<header>
    <h2>Quiz Management System — Admin</h2>
</header>

<div class="container">
    <a class="back" href="dashboard.jsp">← Back to Dashboard</a>

    <div class="panel">
        <h1>Manage Quizzes</h1>
        <p>Create quizzes by entering a title and description.</p>

        <form action="${pageContext.request.contextPath}/add-quiz" method="post">
            <label>Quiz Title</label>
            <input type="text" name="title" placeholder="Example: Java Programming" required>

            <label>Description</label>
            <textarea name="description" rows="3" placeholder="Enter quiz description"></textarea>

            <button type="submit">Add Quiz</button>
        </form>

        <h2>Available Quizzes</h2>

        <table>
            <thead>
                <tr>
                    <th>Quiz ID</th>
                    <th>Quiz Title</th>
                    <th>Description</th>
                </tr>
            </thead>

           <tbody>
    <%
        java.util.List<String[]> quizzes =
            (java.util.List<String[]>) request.getAttribute("quizzes");

        if (quizzes != null && !quizzes.isEmpty()) {
            for (String[] quiz : quizzes) {
    %>
        <tr>
            <td><%= quiz[0] %></td>
            <td><%= quiz[1] %></td>
            <td><%= quiz[2] == null ? "" : quiz[2] %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="3">No quizzes found.</td>
        </tr>
    <%
        }
    %>
</tbody>
        </table>
    </div>
</div>

</body>
</html>