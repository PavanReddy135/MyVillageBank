package myvillagebank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;


@WebServlet("/admincustomers")
public class AdminCustomers extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 List<Map<String, Object>> customers = new ArrayList<>();

         try(Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","pavan","pavan123")){
        	 PreparedStatement pstmt=con.prepareStatement("SELECT * FROM MYVILLAGEBANK");
        	 ResultSet rs=pstmt.executeQuery();
        	 
        	 while(rs.next()) {
        		 Map<String, Object> customer = new HashMap<>();
        		 customer.put("accountnumber",rs.getString("ACCOUNTNUMBER"));
        		 customer.put("username",rs.getString("USERNAME"));
        		 customer.put("email",rs.getString("EMAIL"));
        		 customer.put("mobilenumber",rs.getString("MOBILENUMBER"));
        		 customer.put("balance",rs.getString("BALANCE"));
        		 customer.put("accounttype",rs.getString("ACCOUNTTYPE"));
        		 customer.put("branch",rs.getString("BRANCH"));
        		 customer.put("ifsccode",rs.getString("IFSCCODE"));
        		 customer.put("aadharnumber",rs.getString("AADHARNO"));
        		 customer.put("dob",rs.getString("DOB"));
        		 customer.put("loanstatus",rs.getString("LOANSTATUS"));
        		 customers.add(customer);
        		 
        	 }
        	 
         } catch (SQLException e) {
			
			e.printStackTrace();
		}
         
	        request.setAttribute("customers", customers);

	        // Forward the request to the JSP page
	        request.getRequestDispatcher("admincustomers.jsp").forward(request, response);
		
	}

}
