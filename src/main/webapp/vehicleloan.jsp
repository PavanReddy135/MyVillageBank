<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Village Bank Loan</title>
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
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding-top: 40px;
    overflow-y: auto;
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

  form label {
    display: block;
    margin: 10px 0 5px;
    color: #ffccff;
  }

  form input, select {
    width: 100%;
    padding: 8px;
    border: none;
    border-radius: 5px;
    margin-bottom: 15px;
  }

  .submit-btn {
    background-color: #00bcd4;
    color: white;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
  }

  .submit-btn:hover {
    background-color: #008c9e;
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
<div class="container">
    <h2>Vehicle Loan Application</h2>
    <form action="loanservlet" method="post">
        <input type="hidden" name="loanType" value="Vehicle" />

        <label>FullName</label>
        <input type="text" name="username" value="<%= session.getAttribute("username") %>" readonly >

        <label>Account Number</label>
        <input type="text" name="accountnumber" value="<%= session.getAttribute("accountnumber") %>" readonly >

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Mobile Number</label>
        <input type="text" name="mobilenumber" required> 

        <label for="income">Monthly Income:</label>
        <input type="number" id="income" name="income" min="10000" max="500000" step="10000" required>

        <label for="loanAmount">Loan Amount:</label>
        <!-- ✅ fixed name from loanAmount to loanamount -->
        <input type="number" id="loanAmount" name="loanamount" min="50000" max="500000" step="50000" required>

        <label for="duration">Duration: </label>
        <select id="duration" name="duration" required>
           
            <option value="3">3 Months</option>
            <option value="6">6 Months</option>
            <option value="12">12 Months</option>
            <option value="18">18 Months</option>
            <option value="24">24 Months</option>
            <option value="30">30 Months</option>
            <option value="36">36 Months</option>
            <option value="42">42 Months</option>
            <option value="48">48 Months</option>
            <option value="54">54 Months</option>
            <option value="60">60 Months</option>
        </select>

        <input type="submit" class="submit-btn" value="Apply Loan">
        <a class="back-home" href="account.jsp">&larr; Back to Home</a>
        
    </form>
</div>
</body>
</html>
