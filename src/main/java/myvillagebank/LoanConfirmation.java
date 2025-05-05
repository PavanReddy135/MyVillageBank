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
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/loanconfirmation")
public class LoanConfirmation extends HttpServlet {
    private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    private static final String user = "pavan";
    private static final String pword = "pavan123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoanConfirmation: doPost started");
        HttpSession session = request.getSession(false);
        String accountnumber=(String) session.getAttribute("accountnumber");
        String username=(String) session.getAttribute("username");
        System.out.println("LoanConfirmation: Account Number from session: " + accountnumber);
        System.out.println("LoanConfirmation: Username from session: " + username);

  
        Double loanamount =Double.parseDouble(request.getParameter("loanamount"));
        Double interestrate =Double.parseDouble(request.getParameter("interestrate"));
       Double totalinterest = Double.parseDouble(request.getParameter("totalinterest"));
        Double totalpayable = Double.parseDouble(request.getParameter("totalpayable"));
        int duration =Integer.parseInt(request.getParameter("duration"));
        String loantype = request.getParameter("loantype");
       double emipermonth=totalpayable/duration;
        System.out.println("LoanConfirmation: Loan Details - Amount: " + loanamount + ", Interest Rate: " + interestrate + ", Total Interest: " + totalinterest + ", Total Payable: " + totalpayable + ", Duration: " + duration + ", Loan Type: " + loantype + ", EMI per month: " + emipermonth);

       String loanid = generateloanid(loantype);
       System.out.println("LoanConfirmation: Generated Loan ID: " + loanid);
       
        try (Connection con=DriverManager.getConnection(url,user,pword)){
        	System.out.println("LoanConfirmation: Database connection established");
        	
        	  String insertloan = "INSERT INTO MyVillageBankLoans (loanid, accountnumber, loan_type, loan_amount, interest_rate, total_interest, total_payable_amount, no_of_months, amount_paid, emi_per_month, loan_status, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
        	  try (PreparedStatement pstmt1=con.prepareStatement(insertloan)){
        	System.out.println("LoanConfirmation: PreparedStatement for insert created");
        	pstmt1.setString(1, loanid);
        	pstmt1.setString(2,accountnumber );
        	pstmt1.setString(3,loantype);
        	pstmt1.setDouble(4,loanamount );
        	pstmt1.setDouble(5,interestrate);
        	pstmt1.setDouble(6,totalinterest );
        	pstmt1.setDouble(7,totalpayable );
        	pstmt1.setInt(8, duration);
        	pstmt1.setDouble(9, 0);
        	pstmt1.setDouble(10,emipermonth );
        	pstmt1.setString(11, "PENDING");
        	pstmt1.setString(12, username);
        	pstmt1.executeUpdate();
        	System.out.println("LoanConfirmation: Insert query executed successfully");
        	}
        	 String updateLoanStatus = "UPDATE MyVillageBank SET loanstatus = ?, loanid = ? WHERE accountnumber = ?";
             try (PreparedStatement pstmt2 = con.prepareStatement(updateLoanStatus)) {
                 System.out.println("LoanConfirmation: PreparedStatement for update created");
                 pstmt2.setString(1, "PENDING");
                 pstmt2.setString(2, loanid);
                 pstmt2.setString(3, accountnumber);
                 pstmt2.executeUpdate();
                 System.out.println("LoanConfirmation: Update query executed successfully");
             }
             request.setAttribute("successMessage", "Loan Application Submitted Successfully! Your Loan ID: " + loanid);
             System.out.println("LoanConfirmation: Success message attribute set");
             RequestDispatcher dispatcher = request.getRequestDispatcher("loanstatus.jsp");
             System.out.println("LoanConfirmation: RequestDispatcher created for loanstatus.jsp");
             dispatcher.forward(request, response);
             System.out.println("LoanConfirmation: Forwarded to loanstatus.jsp");

        	  
        } catch (SQLException e) {
			System.err.println("LoanConfirmation: SQLException occurred: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred while processing your loan application: " + e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("loanerror.jsp");
			dispatcher.forward(request, response);
        }
        
        System.out.println("LoanConfirmation: doPost finished");
    }

    private String generateloanid(String loantype) {
        System.out.println("LoanConfirmation: generateloanid started with loantype: " + loantype);
        int randomNumber = (int) (Math.random() * 9000) + 1000;
        String loanTypeAbbreviation = "";
        
        if (loantype != null) {
            if (loantype.equalsIgnoreCase("vehicle")) {
                loanTypeAbbreviation = "V";
            } else if (loantype.equalsIgnoreCase("personal")) {
                loanTypeAbbreviation = "P";
            } else if (loantype.equalsIgnoreCase("home")) {
                loanTypeAbbreviation = "H";
            } else if (loantype.equalsIgnoreCase("educational")) {
                loanTypeAbbreviation = "E";
            }
            System.out.println("LoanConfirmation: Loan Type Abbreviation: " + loanTypeAbbreviation);
        } else {
            System.out.println("LoanConfirmation: Loan type is null in generateloanid");
        }
        
        String loanid = "MVB-" + loanTypeAbbreviation + "-" + randomNumber;
        System.out.println("LoanConfirmation: Generated Loan ID in generateloanid: " + loanid);
        System.out.println("LoanConfirmation: generateloanid finished");
        return loanid;
    }


}