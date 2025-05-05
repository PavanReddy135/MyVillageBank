<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Loan Application Error - MyVillageBank</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #f5c6cb;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #721c24;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 15px;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Loan Application Error</h1>
        <% String errorMessage = (String) request.getAttribute("errorMessage");
           if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <p><strong>Error:</strong> <%= errorMessage %></p>
        <% } else { %>
            <p>An unexpected error occurred during your loan application.</p>
        <% } %>
        <p><a href="account.jsp">Back to Account</a></p>
    </div>
</body>
</html>