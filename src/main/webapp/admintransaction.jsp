<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Transactions</title>
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


<h2>Transaction History</h2>

<%
    List<Map<String, Object>> txns = (List<Map<String, Object>>) request.getAttribute("transactions");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
    if (txns != null && !txns.isEmpty()) {
%>

<table>
    <tr>
        <th>Transaction ID</th>
        <th>Account Number</th>
        <th>Name</th>
        <th>Type</th>
        <th>Amount (₹)</th>
        <th>Date</th>
    </tr>

<% for (Map<String, Object> txn : txns) { %>
    <tr>
        <td><%= txn.get("id") %></td>
        <td><%= txn.get("accountnumber") %></td>
        <td><%= txn.get("username") %></td>
        <td><%= txn.get("type") %></td>
        <td><%= txn.get("amount") %></td>
        <td><%= sdf.format((java.util.Date) txn.get("date")) %></td>
    </tr>
<% } %>
</table>

<% } else { %>
    <p style="text-align:center; color: red;">No transactions found for your account.</p>
<% } %>

</body>
</html>
