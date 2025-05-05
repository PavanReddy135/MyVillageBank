package myvillagebank;

import jakarta.servlet.RequestDispatcher;
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

@WebServlet("/loanservlet")
public class LoanServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String DB_USER = "pavan";
    private static final String DB_PASSWORD = "pavan123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String accountnumber = request.getParameter("accountnumber");
        String email = request.getParameter("email");
        String mobilenumberStr = request.getParameter("mobilenumber");
        String incomeStr = request.getParameter("income");
        String loanamountStr = request.getParameter("loanamount");
        String durationStr = request.getParameter("duration");
        String loantype = request.getParameter("loanType");

        boolean hasActiveLoan = false;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Connection established!");

            String sql = "SELECT LOAN_STATUS FROM MYVILLAGEBANKLOANS WHERE ACCOUNTNUMBER = ? AND (LOAN_STATUS = 'Approved' OR LOAN_STATUS = 'Active')";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, accountnumber);
            System.out.println("Executing query: " + sql + " with account number: " + accountnumber);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                hasActiveLoan = true;
                System.out.println("Loan status for account " + accountnumber + " is: " + rs.getString("LOAN_STATUS"));
            } else {
                System.out.println("No active or approved loan found for account: " + accountnumber);
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error connecting to the database: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("loanerror.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (hasActiveLoan) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("alreadyloan.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            int duration = (durationStr != null && !durationStr.isEmpty()) ? Integer.parseInt(durationStr) : 0;
            int income = (incomeStr != null && !incomeStr.isEmpty()) ? Integer.parseInt(incomeStr) : 0;
            long mobilenumber = (mobilenumberStr != null && !mobilenumberStr.isEmpty()) ? Long.parseLong(mobilenumberStr) : 0L;
            int loanamount = (loanamountStr != null && !loanamountStr.isEmpty()) ? Integer.parseInt(loanamountStr) : 0;

            double interestrate = getIntrestRate(loantype, duration, loanamount);
            double totalinterest = (loanamount * interestrate * duration) / (12 * 100);
            double totalpayable = loanamount + totalinterest;
            double emipermonth = totalpayable / duration;

            request.setAttribute("loantype", loantype);
            request.setAttribute("loanamount", loanamount);
            request.setAttribute("interestrate", interestrate);
            request.setAttribute("totalinterest", totalinterest);
            request.setAttribute("totalpayable", totalpayable);
            request.setAttribute("duration", duration);
            request.setAttribute("emipermonth", emipermonth);
            request.setAttribute("username", username);

            RequestDispatcher dispatcher = request.getRequestDispatcher("confirmloan.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("loanerror.jsp");
            dispatcher.forward(request, response);
        }
    }

    private double getIntrestRate(String loantype, int duration, int loanamount) {
        double interestrate = 0.0;

        if (loantype.equalsIgnoreCase("Vehicle")) {
            if (duration < 12) {
                interestrate = 7.5;
            } else if (duration < 30) {
                interestrate = 8.0;
            } else {
                interestrate = 9.5;
            }
        } else if (loantype.equalsIgnoreCase("Home")) {
            if (duration < 12) {
                interestrate = 5.5;
            } else if (duration < 30) {
                interestrate = 7.0;
            } else {
                interestrate = 8.5;
            }
        } else if (loantype.equalsIgnoreCase("Education")) {
            if (duration < 12) {
                interestrate = 6.5;
            } else if (duration < 30) {
                interestrate = 8.5;
            } else {
                interestrate = 10.0;
            }
        } else if (loantype.equalsIgnoreCase("Personal")) {
            if (duration < 12) {
                interestrate = 8.5;
            } else if (duration < 30) {
                interestrate = 10.0;
            } else {
                interestrate = 12.5;
            }
        }

        return interestrate;
    }
}
