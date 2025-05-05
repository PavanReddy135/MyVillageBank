<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Loan Status</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            text-align: center;
            padding-top: 100px;
        }
        .message-box {
            background: #fff;
            display: inline-block;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .message-box h2 {
            color: #d9534f;
        }
        .message-box a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #0275d8;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .message-box a:hover {
            background: #025aa5;
        }
    </style>
</head>
<body>
<div class="message-box">
    <h2>You already have an active loan.</h2>
    <p>Please repay your existing loan before applying for a new one.</p>
    <a href="loanrepayment">Go to Loan Repayment</a>
</div>
</body>
</html>
