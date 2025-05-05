<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: black;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }
        .box {
            background-color: white;
            width: 400px;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 25px;
        }
        .box h1 {
            color: seagreen;
            text-align: center;
            font-family: 'Segoe UI', sans-serif;
            font-size: 32px;
            margin: 0;
        }
        .message {
            text-align: center;
            font-size: 18px;
            color: #333;
            font-family: Arial, sans-serif;
        }
        .back-button {
            width: 150px;
            padding: 10px;
            font-weight: bold;
            border: 2px solid black;
            border-radius: 6px;
            cursor: pointer;
            background-color: #000;
            color: white;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease, font-size 0.3s ease;
        }
        .back-button:hover {
            background-color: #3d3b3b;
            color: white;
            font-size: 17px;
        }
    </style>
</head>
<body>
    <div class="box">
        <h1>Payment Successful!</h1>
        <div class="message">
            <p>Your EMI has been paid successfully.</p>
        </div>
        <a href="account.jsp" class="back-button">Back to Status</a>
    </div>
</body>
</html>