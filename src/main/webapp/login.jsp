<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - My Village Bank</title>
   <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body {
    margin: 0;
    padding: 0;
    background-color: black;
    color: white;
    font-family: Arial, sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .container {
    background-color: #1e1e1e;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 0 20px rgba(0, 191, 255, 0.7);
    width: 320px;
    text-align: center;
  }

  h1, h2 {
    color: deepskyblue;
    margin-bottom: 20px;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: none;
    border-radius: 6px;
    box-sizing: border-box;
  }

  input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: deepskyblue;
    color: black;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  input[type="submit"]:hover {
    background-color: #00aaff;
  }
  .reg-link {
            text-align: center;
            margin-top: 20px;
        }
        .reg-link a {
            color: #00bcd4;
            text-decoration: none;
            font-weight: bold;
        }
        .reg-link a:hover {
            text-decoration: underline;
        }
</style>
</head>
<body>
  <div class="container">
    <h1>Welcome to My Village Bank!!</h1>
    <h2>Login with Your Details</h2>
    <form action="loginservlet" method="post">
    Account Number: <input type="text" name="accountnumber" /><br>
    Password: <input type="password" name="password" /><br>
    <input type="submit" value="Login" />
</form>
 <div class="reg-link">
            <p>Don't have an account? <a href="register.jsp">Register!!</a></p>
        </div>
  </div>
</body>
</html>
