package myvillagebank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/loandecision")
public class LoanDecision extends HttpServlet {
    private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String user = "pavan";
    private static final String pword = "pavan123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loanid = request.getParameter("loanid");
        String action = request.getParameter("action");

        System.out.println("LoanDecision: Received Loan ID: " + loanid + ", Action: " + action);

        Connection con = null;
        PreparedStatement stmtLoan = null, stmtAccount = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection(url, user, pword);
            System.out.println("LoanDecision: Database connection established");

            // Fetch loan details
            String loanQuery = "SELECT * FROM MYVILLAGEBANKLOANS WHERE loanid=?";
            stmtLoan = con.prepareStatement(loanQuery);
            stmtLoan.setString(1, loanid);
            System.out.println("LoanDecision: Executing query: " + loanQuery + " with loanid=" + loanid);
            rs = stmtLoan.executeQuery();

            if (rs.next()) {
                double amount = rs.getDouble("loan_amount");
                String accountNumber = rs.getString("accountnumber");

                System.out.println("LoanDecision: Loan Amount: " + amount + ", Account Number: " + accountNumber);

                con.setAutoCommit(false);
                System.out.println("LoanDecision: Auto-commit disabled");

                // Update loan status
                String updateLoanQuery = "UPDATE MYVILLAGEBANKLOANS SET LOAN_STATUS=? WHERE loanid=?";
                stmtLoan = con.prepareStatement(updateLoanQuery);

                if ("approve".equalsIgnoreCase(action)) {
                    stmtLoan.setString(1, "APPROVED");
                    stmtLoan.setString(2, loanid);
                    int loanUpdateResult = stmtLoan.executeUpdate();
                    System.out.println("LoanDecision: Updated MYVILLAGEBANKLOANS with APPROVED status. Result: " + loanUpdateResult);

                    // Update account balance and status
                    String updateAccountQuery = "UPDATE MYVILLAGEBANK SET BALANCE = BALANCE + ?, LOANSTATUS = ?, LOANID = ? WHERE ACCOUNTNUMBER = ?";
                    stmtAccount = con.prepareStatement(updateAccountQuery);
                    stmtAccount.setDouble(1, amount);
                    stmtAccount.setString(2, "APPROVED");
                    stmtAccount.setString(3, loanid);
                    stmtAccount.setString(4, accountNumber);
                    int accountUpdateResult = stmtAccount.executeUpdate();
                    System.out.println("LoanDecision: Updated MYVILLAGEBANK with approved loan. Result: " + accountUpdateResult);

                    if (loanUpdateResult > 0 && accountUpdateResult > 0) {
                        con.commit();
                        System.out.println("LoanDecision: Transaction committed (Loan Approved)");
                        response.sendRedirect("admindashboard.jsp?status=success");
                    } else {
                        con.rollback();
                        System.err.println("LoanDecision: Transaction rolled back (Approval failed)");
                        response.sendRedirect("admindashboard.jsp?status=error3");
                    }

                } else if ("reject".equalsIgnoreCase(action)) {
                    stmtLoan.setString(1, "REJECTED");
                    stmtLoan.setString(2, loanid);
                    int loanUpdateResult = stmtLoan.executeUpdate();
                    System.out.println("LoanDecision: Updated MYVILLAGEBANKLOANS with REJECTED status. Result: " + loanUpdateResult);

                    // Update account loan status only (no balance change)
                    String updateAccountRejectQuery = "UPDATE MYVILLAGEBANK SET LOANSTATUS = ?, LOANID = NULL WHERE ACCOUNTNUMBER = ?";
                    stmtAccount = con.prepareStatement(updateAccountRejectQuery);
                    stmtAccount.setString(1, "REJECTED");
                    stmtAccount.setString(2, accountNumber);
                    int accountUpdateResult = stmtAccount.executeUpdate();
                    System.out.println("LoanDecision: Updated MYVILLAGEBANK for loan rejection. Result: " + accountUpdateResult);

                    if (loanUpdateResult > 0 && accountUpdateResult > 0) {
                        con.commit();
                        System.out.println("LoanDecision: Transaction committed (Loan Rejected)");
                        response.sendRedirect("admindashboard.jsp?status=success");
                    } else {
                        con.rollback();
                        System.err.println("LoanDecision: Transaction rolled back (Rejection failed)");
                        response.sendRedirect("admindashboard.jsp?status=error3");
                    }

                } else {
                    System.err.println("LoanDecision: Invalid action received: " + action);
                    response.sendRedirect("admindashboard.jsp?status=error3");
                }
            } else {
                System.err.println("LoanDecision: Loan not found with ID: " + loanid);
                response.sendRedirect("admindashboard.jsp?status=error1");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            try {
                if (con != null) con.rollback();
                System.err.println("LoanDecision: Transaction rolled back due to exception: " + e.getMessage());
            } catch (SQLException se) {
                se.printStackTrace();
            }
            response.sendRedirect("admindashboard.jsp?status=error2&msg=" + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmtLoan != null) stmtLoan.close();
                if (stmtAccount != null) stmtAccount.close();
                if (con != null) con.close();
                System.out.println("LoanDecision: Database resources closed");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
