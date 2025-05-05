package myvillagebank;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	Connection con;
	
    public LoginServlet() {
        super();
        
    }

    public void init(ServletConfig config) throws ServletException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "pavan", "pavan123");
            System.out.println("Database Connected Successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }
    }
    
    public void destroy() {
        try {
            if (con != null) {
                con.close();
                System.out.println("Database Connection Closed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        
		String s1=request.getParameter("accountnumber").trim();
		String s2=request.getParameter("password").trim();
		

        response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		if (s1.equals("admin") && s2.equals("admin135")) {
		    response.sendRedirect("admindashboard.jsp");
		}else {
		
		try (PreparedStatement pstmt = con.prepareStatement("SELECT * FROM MyVillageBank WHERE accountnumber=? AND password=?")) {
		    pstmt.setString(1, s1);
		    pstmt.setString(2, s2);
		    ResultSet rs = pstmt.executeQuery();
		    System.out.println("Trying to login with: " + s1 + " / " + s2);

		    if (rs.next()) {
		    	String name = rs.getString("username");
		        HttpSession session = request.getSession();
		        session.setAttribute("accountnumber", s1);
		        session.setAttribute("username", name); 
		        response.sendRedirect("account.jsp");
		    } else {
		        pw.println("<html><body bgcolor='black' text='white'><center>");
		        pw.println("<h2 style='color:red;'>Invalid Account Number or Password</h2>");
		        pw.println("<a href='login.jsp' style='color:deepskyblue;'>Try Again</a>");
		        pw.println("</center></body></html>");
		    }

		    rs.close(); // Ensure ResultSet is closed
		} catch (SQLException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}
		}
	}
}
