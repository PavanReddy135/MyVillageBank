package myvillagebank;

import jakarta.servlet.RequestDispatcher;
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
import java.sql.SQLException;

@WebServlet("/loanrepayment")
public class LoanRepayment extends HttpServlet {
    private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String user = "pavan";
    private static final String pword = "pavan123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNumber = (session != null) ? (String) session.getAttribute("accountnumber") : null;

        if (accountNumber == null || accountNumber.isEmpty()) {
            request.setAttribute("errorMessage", "Session expired. Please login again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        String query = "SELECT loanid, loan_type, loan_amount, total_payable_amount, amount_paid, emi_per_month, loan_status FROM MYVILLAGEBANKLOANS WHERE ACCOUNTNUMBER = ?";

        try (Connection con = DriverManager.getConnection(url, user, pword);
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, accountNumber);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String loanStatus = rs.getString("loan_status");

                    if ("Pending".equalsIgnoreCase(loanStatus)) {
                        request.setAttribute("infoMessage", "Your loan is still pending approval. The loan amount will be credited once approved.");
                    } else {
                        request.setAttribute("loanId", rs.getString("loanid"));
                        request.setAttribute("loanType", rs.getString("loan_type"));
                        request.setAttribute("loanAmount", rs.getDouble("loan_amount"));
                        request.setAttribute("totalPayable", rs.getDouble("total_payable_amount"));
                        request.setAttribute("amountPaid", rs.getDouble("amount_paid"));
                        request.setAttribute("emiPerMonth", rs.getDouble("emi_per_month"));
                        request.setAttribute("loanStatus", loanStatus);
                    }

                } else {
                    request.setAttribute("errorMessage", "No loan details found for your account.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error while fetching loan details.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("repayloan.jsp");
        dispatcher.forward(request, response);
    }
}
