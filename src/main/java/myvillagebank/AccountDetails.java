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

@WebServlet("/accountdetails")
public class AccountDetails extends HttpServlet {
	private static final String url="jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String user="pavan";
	private static final String pword="pavan123";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session = request.getSession(false);
		    String accountnumber = null;
		    if (session != null) {
		        accountnumber = (String) session.getAttribute("accountnumber");
		    }

		    System.out.println("Account number: " + accountnumber);
		String query="Select username,email,mobilenumber,accounttype,ifsccode,balance,aadharno,branch,loanstatus FROM MyVillageBank where accountnumber=?";
		
		try(Connection con=DriverManager.getConnection(url,user,pword)){
		 PreparedStatement pstmt=con.prepareStatement(query);
		 pstmt.setString(1, accountnumber);
		 
			try(ResultSet rs=pstmt.executeQuery()){
				if(rs.next()) {
				String username=rs.getString("username");
				String email=rs.getString("email");
				String mobilenumber=rs.getString("mobilenumber");
				String accounttype=rs.getString("accounttype");
				String ifsccode=rs.getString("ifsccode");
				double balance = rs.getDouble("balance");
				String aadharnumber=rs.getString("aadharno");
				String branch=rs.getString("branch");
				String loanstatus=rs.getString("loanstatus");
				
				branch = branch.toUpperCase();
				
				 request.setAttribute("username", username);
                 request.setAttribute("email", email);
                 request.setAttribute("mobilenumber", mobilenumber);
                 request.setAttribute("accounttype", accounttype);
                 request.setAttribute("ifsccode", ifsccode);
                 request.setAttribute("balance", balance);
                 request.setAttribute("aadharnumber", aadharnumber);
                 request.setAttribute("branch", branch);
                 request.setAttribute("loanstatus", loanstatus);
			}
				else {
					request.setAttribute("errorMessage", "Account Not Found!!");
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		     request.setAttribute("errorMessage", "An error occurred while fetching account details.");
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("accountdetails.jsp");
		dispatcher.forward(request, response);
	}

}
