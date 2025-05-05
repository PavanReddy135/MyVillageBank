package myvillagebank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/confirmedloanrepayment")
public class ConfirmedLoanRepayment extends HttpServlet {

    private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String user = "pavan";
    private static final String pword = "pavan123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String accountnumber = (String) session.getAttribute("accountnumber");
        String username = (String) session.getAttribute("username");

        if (accountnumber == null || username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String enteredpassword = request.getParameter("password");
        String pwordquery = "SELECT password, balance FROM MYVILLAGEBANK WHERE accountnumber=?";

        try (Connection con = DriverManager.getConnection(url, user, pword);
             PreparedStatement pstmt = con.prepareStatement(pwordquery)) {

            pstmt.setString(1, accountnumber);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String dbPassword = rs.getString("password");
                    double balance = rs.getDouble("balance");

                    if (!enteredpassword.equals(dbPassword)) {
                        request.setAttribute("errorMessage", "Incorrect password.");
                        request.getRequestDispatcher("loanstatus.jsp").forward(request, response);
                        return;
                    }

                    String loanQuery = "SELECT loanid, amount_paid, loan_amount, emi_per_month FROM MYVILLAGEBANKLOANS WHERE accountnumber=?";
                    try (PreparedStatement loanpstmt = con.prepareStatement(loanQuery)) {
                        loanpstmt.setString(1, accountnumber);
                        try (ResultSet loanrs = loanpstmt.executeQuery()) {
                            if (loanrs.next()) {
                                double amountpaid = loanrs.getDouble("amount_paid");
                                double loanamount = loanrs.getDouble("loan_amount");
                                double emi = loanrs.getDouble("emi_per_month");

                                if (balance < emi) {
                                    request.setAttribute("errorMessage", "Insufficient balance to pay EMI.");
                                    request.getRequestDispatcher("loanpaymentstatus.jsp").forward(request, response);
                                    return;
                                }

                                double newamountpaid = amountpaid + emi;
                                double payableamount = loanamount - newamountpaid;

                              
                                try (PreparedStatement updateBalance = con.prepareStatement("UPDATE MYVILLAGEBANK SET balance = balance - ? WHERE accountnumber = ?")) {
                                    updateBalance.setDouble(1, emi);
                                    updateBalance.setString(2, accountnumber);
                                    updateBalance.executeUpdate();
                                }

                                if (newamountpaid >= loanamount) {
                                   
                                    try (PreparedStatement deleteloanpstmt = con.prepareStatement("DELETE FROM MYVILLAGEBANKLOANS WHERE accountnumber=?");
                                         PreparedStatement updatestatuspstmt = con.prepareStatement("UPDATE MYVILLAGEBANK SET loanstatus='CLOSED', loanid=NULL WHERE accountnumber=?")) {

                                        deleteloanpstmt.setString(1, accountnumber);
                                        deleteloanpstmt.executeUpdate();

                                        updatestatuspstmt.setString(1, accountnumber);
                                        updatestatuspstmt.executeUpdate();

                                        request.setAttribute("successMessage", "Loan fully repaid! Status updated to CLOSED.");
                                    }
                                } else {
                                   
                                    try (PreparedStatement updateloan = con.prepareStatement("UPDATE MYVILLAGEBANKLOANS SET amount_paid=?, total_payable_amount=? WHERE accountnumber=?")) {
                                        updateloan.setDouble(1, newamountpaid);
                                        updateloan.setDouble(2, payableamount);
                                        updateloan.setString(3, accountnumber);
                                        updateloan.executeUpdate();

                                        request.setAttribute("successMessage", "EMI paid successfully. Remaining: ₹" + payableamount);
                                    }
                                }

                                
                                String transactionId = "TXN" + System.currentTimeMillis();
                                try (PreparedStatement txnStmt = con.prepareStatement("INSERT INTO MYVILLAGEBANKTRANSACTIONS (TRANSACTION_ID, ACCOUNTNUMBER, USERNAME, TYPE, AMOUNT) VALUES (?, ?, ?, ?, ?)")) {
                                    txnStmt.setString(1, transactionId);
                                    txnStmt.setString(2, accountnumber);
                                    txnStmt.setString(3, username);
                                    txnStmt.setString(4, "EMI_PAYMENT");
                                    txnStmt.setDouble(5, -emi); 
                                    txnStmt.executeUpdate();
                                }

                            } else {
                                request.setAttribute("errorMessage", "Loan not found.");
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing the repayment.");
        }

        request.getRequestDispatcher("loanpaymentstatus.jsp").forward(request, response);
    }
}
