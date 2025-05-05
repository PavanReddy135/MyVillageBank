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

@WebServlet("/adminloans")
public class AdminLoans extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> loans = new ArrayList<>();

        try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "pavan", "pavan123");
        	     PreparedStatement ps = con.prepareStatement("SELECT * FROM MYVILLAGEBANKLOANS WHERE UPPER(LOAN_STATUS)=UPPER(?)")) {

        	    ps.setString(1, "Approved");
        	    ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> loan = new HashMap<>();
                loan.put("id", rs.getString("LOANID"));  // Correct column names
                loan.put("accountnumber", rs.getString("ACCOUNTNUMBER"));
                loan.put("username", rs.getString("USERNAME"));  // If you stored name separately, else use USERNAME
                loan.put("type", rs.getString("LOAN_TYPE"));
                loan.put("amount", rs.getDouble("LOAN_AMOUNT"));
                loan.put("paid", rs.getDouble("AMOUNT_PAID"));  // Not timestamp!
                loan.put("payable", rs.getDouble("TOTAL_PAYABLE_AMOUNT"));  // Not timestamp!
                loan.put("duration", rs.getInt("NO_OF_MONTHS"));
                loan.put("emi", rs.getDouble("EMI_PER_MONTH"));

                loans.add(loan);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("loans", loans);
        request.getRequestDispatcher("adminloans.jsp").forward(request, response);
    }
}
