<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Repay Loan</title>
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
            width: 600px;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        .box h1 {
            color: deepskyblue;
            text-align: center;
            font-family: 'Segoe UI', sans-serif;
            font-size: 30px;
            margin: 0;
        }
        .details {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .details p {
            display: flex;
            justify-content: flex-start;
            font-size: 17px;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .details p strong {
            width: 150px;
            display: inline-block;
            text-align: left;
        }
        .repay {
            width: 100%;
            text-align: center;
        }
        .repay p {
            font-size: 18px;
            font-family: Arial, sans-serif;
            color: #000;
        }
        .repay label {
            display: block;
            margin: 10px 0 5px;
            font-size: 16px;
            color: #333;
        }
        input[type="password"] {
            padding: 10px;
            width: 60%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .buttons {
            display: flex;
            gap: 15px;
        }
        .buttons input[type="submit"] {
            width: 150px;
            padding: 10px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .buttons .paynow {
            background-color: deepskyblue;
            color: black;
        }
        .buttons .back {
            width: 150px;
            padding: 10px;
            font-weight: bold;
            border: 2px solid black;
            border-radius: 6px;
            cursor: pointer;
            background-color: #000;
            color: white;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .buttons .paynow:hover {
            background-color: rgb(17, 105, 134);
            color: white;
            font-size: 15px;
        }
        .buttons .back:hover {
            background-color: #3d3b3b;
            color: white;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <div class="box">
        <h1>Loan Repayment</h1>
        <div class="details">
            <p><strong>Loan ID:</strong> ${loanId}</p>
            <p><strong>Loan Type:</strong> ${loanType}</p>
            <p><strong>Loan Amount:</strong> ₹${loanAmount}</p>
            <p><strong>Total Amount to be Paid:</strong> ₹${totalPayable}</p>
            <p><strong>Amount Paid:</strong> ₹${amountPaid}</p>
            <p><strong>EMI / Month:</strong> ₹${emiPerMonth}</p>
            <p><strong>Loan Status:</strong> ${loanStatus}</p>
        </div>
        <div class="repay">
            <p>Pay Your <strong>₹${emiPerMonth}</strong> Now</p>
            <form action="confirmedloanrepayment" method="post">
                <label for="password">Enter Your Password</label>
                <input type="password" id="password" name="password" required>
                <div class="buttons">
                    <input class="paynow" type="submit" value="Pay Now">
                    <input class="back" type="button" value="Back" onclick="history.back()">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
