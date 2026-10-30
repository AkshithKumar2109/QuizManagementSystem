<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
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
            max-width: 500px;
            margin: 40px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 3px 10px #ddd;
        }
        a {
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header>
        <h1>My Profile</h1>
    </header>

    <div class="container">
        <p><strong>Name:</strong> Student name will appear here.</p>
        <p><strong>Email:</strong> Student email will appear here.</p>

        <p><a href="dashboard.jsp">← Back to Dashboard</a></p>
    </div>
</body>
</html>