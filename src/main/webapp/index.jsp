<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Management System</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            color: #1f2937;
        }

        header {
            background: #2563eb;
            color: white;
            padding: 25px;
            text-align: center;
        }

        header h1 {
            margin-bottom: 10px;
        }

        main {
            max-width: 800px;
            margin: 60px auto;
            padding: 20px;
            text-align: center;
        }

        .card {
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .card p {
            margin: 20px 0;
            line-height: 1.6;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            text-decoration: none;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        footer {
            margin-top: 40px;
            color: #6b7280;
        }
    </style>
</head>

<body>

    <header>
        <h1>Quiz Management System</h1>
        <p>Learn, Practice, and Test Your Knowledge</p>
    </header>

    <main>
        <div class="card">
            <h2>Welcome to Our Quiz Platform!</h2>

            <p>
                Take quizzes, test your knowledge, and view your results
                through our Quiz Management System.
            </p>

           <a href="${pageContext.request.contextPath}/student/login.jsp" class="btn">Student Login</a>
<a href="${pageContext.request.contextPath}/admin/login.jsp" class="btn">Admin Login</a>

            <footer>
                <p>Software Engineering Course End Project</p>
            </footer>
        </div>
    </main>

</body>
</html>