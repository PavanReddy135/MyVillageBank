<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit Money</title>
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
  }

  .deposit-box {
    background-color: #1e1e1e;
    border: 2px solid deepskyblue;
    border-radius: 15px;
    padding: 30px 40px;
    width: 400px;
    box-shadow: 0 0 20px deepskyblue;
    color: white;
    text-align: center;
  }

  .deposit-box h1 {
    margin-top: 0;
    color: white;
  }

  .deposit-box p {
    color: deepskyblue;
    font-style: italic;
    margin-bottom: 25px;
    font-size: 15px;
  }
  
  .deposit-box p span {
    color: white;
    font-style: italic;
    margin-bottom: 25px;
    font-size: 15px;
  }

  label {
    font-size: 18px;
    margin-bottom: 8px;
    display: block;
    text-align: left;
  }

  input[type="text"],
  input[type="number"],
  input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: none;
    border-radius: 8px;
    background-color: #333;
    color: white;
  }

  input:focus {
    outline: none;
    border: 1px solid deepskyblue;
  }

  button {
    background-color: deepskyblue;
    border: none;
    color: black;
    padding: 12px;
    width: 100%;
    font-size: 16px;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-weight: bold;
  }

  button:hover {
    background-color: #5da9c0;
  }
  .back-home {
  display: inline-block;
  margin-top: 20px;
  padding: 10px 20px;
  border-radius: 8px;
  border: 1px solid deepskyblue;
  color: deepskyblue;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.3s ease;
}

.back-home:hover {
  background-color: deepskyblue;
  color: black;
}
  
  
</style>
</head>
<body>
  <div class="deposit-box">
    <h1>Deposit Money</h1>
    <p>Adding money is just the beginning — let it grow with us.</p>
  <p><span>Account Number:</span><%= session.getAttribute("accountnumber") %></p>
    <form action="depositmoney" method="post">
      <label for="amount">Amount to be Deposited:</label>
      <input type="number" id="amount" name="depositamount" step="100" min="500" max="5000" required>

      <label for="pass">Password:</label>
      <input type="password" id="pass" name="password" required>

      <button type="submit">Deposit</button>
      <a class="back-home" href="account.jsp">&larr; Back to Home</a>
      
    </form>
  </div>
</body>
</html>
