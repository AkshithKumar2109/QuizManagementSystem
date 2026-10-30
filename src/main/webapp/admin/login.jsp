<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: white;
            padding: 35px;
            width: 320px;
            border-radius: 12px;
            box-shadow: 0 4px 15px #ddd;
        }

        h1 {
            text-align: center;
            color: #2563eb;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .back {
            text-align: center;
            margin-top: 20px;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="login-box">
        <h1>Admin Login</h1>

        <form action="${pageContext.request.contextPath}/admin-login" method="post">
            <input type="text" name="username" placeholder="Admin Username" required>

            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Login</button>
        </form>

        <div class="back">
            <a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>