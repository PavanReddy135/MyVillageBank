<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Loans</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: Arial; background-color: #f4f4f4; padding: 20px; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: #fff; box-shadow: 0 2px 6px rgba(0,0,0,0.1); }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        h2 { text-align: center; color: #333; }
         .back-button-container {
        text-align: right;
        margin-bottom: 10px;
    }

    .back-button {
        padding: 10px 20px;
        background-color:white ;
        color: black;
        border-color:#4CAF50;
        border-radius: 6px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .back-button:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }
    </style>
</head>
<body>
<div class="back-button-container">
    <form action="admindashboard.jsp" style="display: inline;">
        <button type="submit" class="back-button">Back</button>
    </form>
</div>


<h2>Loan Details</h2>

<%
    List<Map<String, Object>> loans = (List<Map<String, Object>>) request.getAttribute("loans");
    
    if (loans != null && !loans.isEmpty()) {
%>

<table>
    <tr>
        <th>Loan ID</th>
        <th>Account Number</th>
        <th>Name</th>
        <th>Type</th>
        <th>Loan Amount (₹)</th>
        <th>Amount Paid</th>
        <th>Total Amount</th>
        <th>No of Months</th>
        <th>EMI Per Month</th>
        
    </tr>

<% for (Map<String, Object> loan : loans) { %>
    <tr>
        <td><%= loan.get("id") %></td>
        <td><%= loan.get("accountnumber") %></td>
        <td><%= loan.get("username") %></td>
        <td><%= loan.get("type") %></td>
        <td><%= loan.get("amount") %></td>
        <td><%= loan.get("paid") %></td>
        <td><%=  loan.get("payable") %></td>
        <td><%=  loan.get("duration") %></td>
        <td><%=  loan.get("emi") %></td>
        
    </tr>
<% } %>
</table>

<% } else { %>
    <p style="text-align:center; color: red;">No transactions found for your account.</p>
<% } %>

</body>
</html>
