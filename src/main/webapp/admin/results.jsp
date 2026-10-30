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
    <title>Student Results</title>

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
            margin: 40px auto;
            padding: 20px;
        }

        .panel {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px #ddd;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #e2e8f0;
            text-align: left;
        }

        th {
            background: #eff6ff;
            color: #1e3a8a;
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
        <h1>Student Results</h1>
        <p>View students' quiz performance.</p>

        <table>
            <thead>
                <tr>
                    <th>Result ID</th>
                    <th>Student ID</th>
                    <th>Quiz ID</th>
                    <th>Score</th>
                    <th>Total Questions</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td colspan="5">
                        Results will appear here after database integration.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
