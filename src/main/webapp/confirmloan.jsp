
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loantype = (String) request.getAttribute("loantype");
    Object loanAmountObj = request.getAttribute("loanamount");
    Object interestRateObj = request.getAttribute("interestrate");
    Object durationObj = request.getAttribute("duration");

    if (loantype == null || loanAmountObj == null || interestRateObj == null || durationObj == null) {
%>
        <h1 style="color:red; text-align:center; margin-top:100px;">Missing Loan Details! Cannot Proceed.</h1>
<%
    } else {
        double loanamount = Double.parseDouble(loanAmountObj.toString());
        double interestrate = Double.parseDouble(interestRateObj.toString());
        int duration = Integer.parseInt(durationObj.toString());

        double totalinterest = (loanamount * interestrate * duration) / (12 * 100);
        double totalpayable = loanamount + totalinterest;
        DecimalFormat df = new DecimalFormat("0.00");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Loan Confirmation - MyVillageBank</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 100px auto;
            background-color: #1a1a1a;
            padding: 30px;
            border-radius: 15px;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 0 20px deepskyblue;
        }
        h1 {
            color: deepskyblue;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            margin-bottom: 30px;
            border-collapse: collapse;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #444;
            font-size: 18px;
        }

        .btn {
            width: 45%;
            padding: 12px;
            margin: 10px;
            background-color: deepskyblue;
            color: black;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #00aaff;
        }

        .back-btn {
            background-color: transparent;
            border: 2px solid deepskyblue;
            color: deepskyblue;
        }

        .back-btn:hover {
            background-color: deepskyblue;
            color: black;
            text-decoration:none;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Confirm Your Loan Details</h1>
    <table>
        <tr>
            <td>Loan Type:</td>
            <td><%= loantype %></td>
        </tr>
        <tr>
            <td>Loan Amount:</td>
            <td>₹ <%= df.format(loanamount) %></td>
        </tr>
        <tr>
            <td>Interest Rate:</td>
            <td><%= df.format(interestrate) %> %</td>
        </tr>
        <tr>
            <td>Duration:</td>
            <td><%= duration %> months</td>
        </tr>
        <tr>
            <td>Total Interest:</td>
            <td>₹ <%= df.format(totalinterest) %></td>
        </tr>
        <tr>
            <td>Total Payable Amount:</td>
            <td>₹ <%= df.format(totalpayable) %></td>
        </tr>
    </table>

    <form action="loanconfirmation" method="post">
        <input type="hidden" name="loantype" value="<%= loantype.toUpperCase() %>">
        <input type="hidden" name="loanamount" value="<%= loanamount %>">
        <input type="hidden" name="interestrate" value="<%= interestrate %>">
        <input type="hidden" name="duration" value="<%= duration %>">
        <input type="hidden" name="totalinterest" value="<%= totalinterest %>">
        <input type="hidden" name="totalpayable" value="<%= totalpayable %>">
        
        <button type="submit" class="btn">Agree & Confirm</button>
        <a href="account.jsp" class="btn back-btn">Go Back</a>
    </form>
</div>

</body>
</html>

<%
    } // end of else
%>