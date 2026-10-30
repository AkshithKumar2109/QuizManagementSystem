<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect(request.getContextPath() + "/student/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Results</title>

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
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #2563eb;
            color: white;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>

<header>
    <h1>My Quiz Results</h1>
</header>

<div class="container">

    <table>
        <tr>
            <th>Quiz Name</th>
            <th>Score</th>
            <th>Total Questions</th>
        </tr>

        <%
            List<String[]> results =
                (List<String[]>) request.getAttribute("results");

            if (results != null && !results.isEmpty()) {
                for (String[] result : results) {
        %>

        <tr>
            <td><%= result[1] %></td>
            <td><%= result[2] %></td>
            <td><%= result[3] %></td>
        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="3">No results yet.</td>
        </tr>

        <%
            }
        %>
    </table>

    <p>
        <a href="dashboard.jsp">← Back to Dashboard</a>
    </p>

</div>

</body>
</html>