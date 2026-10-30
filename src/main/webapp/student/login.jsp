<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 30px;
            width: 320px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2563eb;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        p {
            text-align: center;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Student Login</h2>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <input type="email" name="email"
                   placeholder="Email Address" required>

            <input type="password" name="password"
                   placeholder="Password" required>

            <button type="submit">Login</button>
        </form>

        <p>Don't have an account?
            <a href="register.jsp">Register here</a>
        </p>

        <p><a href="../index.jsp">Back to Home</a></p>
    </div>
</body>
</html>