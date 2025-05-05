package myvillagebank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admintransaction")
public class AdminTransaction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Map<String, Object>> transactions = new ArrayList<>();


	        try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "pavan", "pavan123");
	             PreparedStatement ps = con.prepareStatement("SELECT * FROM MYVILLAGEBANKTRANSACTIONS ORDER BY TRANSACTION_DATE DESC")) {

	          
	           
	            ResultSet rs = ps.executeQuery();

	           
	            while (rs.next()) {
	                Map<String, Object> txn = new HashMap<>();
	                txn.put("id", rs.getString("TRANSACTION_ID"));
	                txn.put("accountnumber", rs.getString("ACCOUNTNUMBER")); 
	                txn.put("username", rs.getString("USERNAME")); 
	                txn.put("type", rs.getString("TYPE")); 
	                txn.put("amount", rs.getDouble("AMOUNT"));
	                txn.put("date", rs.getTimestamp("TRANSACTION_DATE"));
	                transactions.add(txn);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();  // Ideally, use logging here
	        }

	        // Set transactions as request attribute to be used in JSP
	        request.setAttribute("transactions", transactions);

	        // Forward the request to the JSP page
	        request.getRequestDispatcher("admintransaction.jsp").forward(request, response);
	    }
	}
