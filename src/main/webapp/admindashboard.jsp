<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - MyVillageBank</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        height: 100vh;
        background-color: #f4f4f4;
      }  

      .sidebar {
        width: 250px;
        height: 100vh;
        background-color: dimgray;
        position: fixed;
        top: 0;
        left: 0;
        padding-top: 30px;
        box-shadow: 2px 0 5px rgba(0,0,0,0.1); 
      }

      .sidebar h2 {
        color: white;
        text-align: center;
        margin-bottom: 30px;
        font-size: 24px;
        letter-spacing: 1px;
      }

      .sidebar a {
        color: white;
        text-decoration: none;
        font-size: 18px;
        padding: 10px 25px;
        display: block;
        transition: background 0.3s ease;
      }

      .sidebar a:hover {
        background-color: #444;
        border-left: 5px solid white;
      }

      .main-content {
        margin-left: 250px;
        padding: 20px;
        flex-grow: 1;
      }
 .loantable{
        margin-left: 10px;
      }
      table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 10px;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }
        .approve-btn, .reject-btn {
            padding: 8px 16px;
            background-color: #27ae60;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin: 5px;
        }
button.approve-btn {
    background-color: #28a745; 
    color: white;
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    margin: 2px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

button.approve-btn:hover {
    background-color: #218838;
}

button.reject-btn {
    background-color: #dc3545; 
    color: white;
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    margin: 2px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

button.reject-btn:hover {
    background-color: #c82333;
}

    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="admindashboard.jsp">Dashboard</a>
        <a href="admincustomers">Customers</a>
        <a href="adminloans">Manage Loans</a>
        <a href="admintransaction">Transactions</a>
        
        <a href="index.jsp">Logout</a>
    </div>

    <div class="main-content">
        <h1>Welcome to the Admin Dashboard</h1>
        <p>Select a section from the sidebar to manage MyVillageBank operations.</p>
        <div class="loantable">
            <h1>Pending Loan Requests</h1>
            <table>
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Name</th>
                        <th>Account Number</th>
                        <th>Loan Type</th>
                        <th>Amount</th>
                        <th>Duration</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "pavan", "pavan123");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(
                            	    "SELECT l.*, u.USERNAME FROM MyVillageBankLoans l " +
                            	    "JOIN MyVillageBank u ON l.accountnumber = u.accountnumber " +
                            	    "WHERE UPPER(l.loan_status) = UPPER('Pending')"
                            	);
                            
                            while(rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("loanid") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("accountnumber") %></td>
                        <td><%= rs.getString("loan_type") %></td>
                        <td><%= rs.getInt("loan_amount") %></td>
                        <td><%= rs.getString("no_of_months") %></td>
                        <td><%= rs.getString("loan_status") %></td>
                        <td>
                            <form action="loandecision" method="post" style="display:inline;">
                                <input type="hidden" name="loanid" value="<%= rs.getString("loanid") %>">
                                <input type="hidden" name="action" value="approve">
                                <button type="submit" class="approve-btn">Approve</button>
                            </form>
                            <form action="loandecision" method="post" style="display:inline;">
                                <input type="hidden" name="loanid" value="<%= rs.getString("loanid") %>">
                                <input type="hidden" name="action" value="reject">
                                <button type="submit" class="reject-btn">Reject</button>
                            </form>
                            
                        </td>
                    </tr>
                    <%
                            }
                            rs.close();
                            st.close();
                            con.close();
                        } catch(Exception e) {
                            out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        
    </div>
</body>
</html>
