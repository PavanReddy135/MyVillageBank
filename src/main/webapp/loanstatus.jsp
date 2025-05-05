<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Application Status</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* General Page Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        /* Centered container */
        .container {
            max-width: 600px;
            margin: 80px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Title styling */
        h1 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        /* Message box */
        .message {
            background-color: #f9f9f9;
            border-left: 6px solid #4CAF50;
            padding: 20px;
            margin-bottom: 30px;
            color: #333;
            border-radius: 8px;
            font-size: 16px;
        }

        /* Button Styling */
        .back-button {
            display: inline-block;
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Loan Application Status</h1>

        <div class="message">
            <p> Your loan application has been submitted successfully and is currently <strong>pending</strong>.</p>
            <p> It will be reviewed and approved within <strong>24 hours</strong>.</p>
        </div>

        <a href="account.jsp" class="back-button">← Back to Account</a>
    </div>
</body>
</html>
