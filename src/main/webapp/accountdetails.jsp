<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Account Details</title>
   <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
  background-color: black;
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
  height: 100vh;
  margin: 0;
}
h1 {
  text-align: center;
  text-decoration: underline;
  color: deepskyblue;
}
.box {
  border: 3px solid deepskyblue;
  border-radius: 10px;
  width: 400px;
  padding: 20px;
  background-color: cornsilk;
}
.details p {
  margin: 10px 0;
  font-size: 16px;
  color: #2c3e50;
}
.back-button {
  margin-top: 20px;
}
button {
  background-color: deepskyblue;
  color: black;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s;
  font-weight: bold;
  border: none;
}
button:hover {
  background-color: #5da9c0;
  color: white;
}
</style>
</head>
<body>

  <div class="box">
    <h1>Account Details</h1>
    <div class="details">
      <p><strong>Username:</strong> ${username}</p>
      <p><strong>Email:</strong> ${email}</p>
      <p><strong>Mobile Number:</strong> ${mobilenumber}</p>
      <p><strong>Account Type:</strong> ${accounttype}</p>
      <p><strong>IFSC Code:</strong> ${ifsccode}</p>
      <p><strong>Balance:</strong> ${balance}</p>
      <p><strong>Aadhar Number:</strong> ${aadharnumber}</p>
      <p><strong>Branch:</strong> ${branch}</p>
      <p><strong>Loan Status:</strong> ${loanstatus}</p>
    </div>
  </div>

  <!-- Back to Home Button -->
  <div class="back-button">
    <a href="account.jsp">
      <button type="button">Back to Home</button>
    </a>
  </div>

</body>
</html>
