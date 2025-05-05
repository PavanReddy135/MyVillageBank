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
     table {
    width: 95%;
    margin: auto;
    border-collapse: collapse;
    background: #fff;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    font-size: 13px;
    table-layout: auto;  /* Let column size adjust naturally */
}

th, td {
    padding: 10px;
    border: 1px solid #ccc;
    text-align: center;
    word-break: break-word;
    max-width: 150px;
    font-size: 13px;
}

div[style*="overflow-x:auto"] {
    overflow-x: hidden !important;
    max-width: 95%;
    margin: auto;
}

th {
    background-color: #4CAF50;
    color: white;
    font-size: 13px;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

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


<h2>My Village Bank Customers</h2>

<%
    List<Map<String, Object>> customers = (List<Map<String, Object>>) request.getAttribute("customers");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
    int n=1;
    if (customers != null && !customers.isEmpty()) {
%>
<div style="overflow-x:auto; max-width: 95%; margin:auto;">
<table>
    <tr>
        <th>Sl.No</th>
        <th>Account Number</th>
        <th>Name</th>
        <th>EMAIL</th>
        <th>MOBILE</th>
        <th>BALANCE</th>
        <th>ACCOUNT TYPE</th>
        <th>BRANCH</th>
        <th>IFSC CODE</th>
        <th>AADHAR</th>
        <th>DOB</th>
        <th>LOAN STATUS</th>
        
    </tr>

<% for (Map<String, Object> customer : customers) { %>
    <tr>
        <td><%= n++ %></td>
        <td><%= customer.get("accountnumber") %></td>
        <td><%= customer.get("username") %></td>
         <td><%= customer.get("email") %></td>
          <td><%= customer.get("mobilenumber") %></td>
         <td><%= customer.get("balance") %></td>
          <td><%= customer.get("accounttype") %></td>
           <td><%= customer.get("branch") %></td>
            <td><%= customer.get("ifsccode") %></td>
             <td><%=customer.get("aadharnumber") %></td>
             <td><%=customer.get("dob") %></td>
             <td><%=customer.get("loanstatus") %></td>
             
             
        
    </tr>
<% } %>
</table>
</div>
<% } else { %>
    <p style="text-align:center; color: red;">No Users found!!</p>
<% } %>

</body>
</html>
