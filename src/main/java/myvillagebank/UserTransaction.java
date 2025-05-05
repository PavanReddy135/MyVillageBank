package myvillagebank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class UserTransaction
 */
@WebServlet("/usertransaction")
public class UserTransaction extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("accountnumber");

        if (accountNumber == null) {
            response.sendRedirect("login.jsp");
            return;
        }

      
        List<Map<String, Object>> transactions = new ArrayList<>();


        try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "pavan", "pavan123");
             PreparedStatement ps = con.prepareStatement("SELECT * FROM MYVILLAGEBANKTRANSACTIONS WHERE ACCOUNTNUMBER = ? ORDER BY TRANSACTION_DATE DESC")) {

          
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();

           
            while (rs.next()) {
                Map<String, Object> txn = new HashMap<>();
                txn.put("id", rs.getString("TRANSACTION_ID"));
                txn.put("type", rs.getString("TYPE")); // ✅ corrected
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
        request.getRequestDispatcher("usertransaction.jsp").forward(request, response);
    }
}
