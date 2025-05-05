package myvillagebank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;

@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get data from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobilenumber = request.getParameter("mobilenumber");
        String balance = request.getParameter("balance");
        String accounttype = request.getParameter("accounttype");
        String branch = request.getParameter("branch");
        String aadharno = request.getParameter("aadharno");
        String dob = request.getParameter("dob");
        String occupation = request.getParameter("occupation");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "pavan", "pavan123");

            // Step 1: Check if Aadhar already exists
            ps = con.prepareStatement("SELECT COUNT(*) FROM MyVillageBank WHERE aadharno = ?");
            ps.setString(1, aadharno);
            rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            rs.close();
            ps.close();

            if (count > 0) {
                request.setAttribute("error", "Aadhar number already registered.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Step 2: Generate new account number
            String accountnumber = "MVBN1000001";
            ps = con.prepareStatement("SELECT MAX(accountnumber) FROM MyVillageBank");
            rs = ps.executeQuery();
            if (rs.next() && rs.getString(1) != null) {
                String lastAcc = rs.getString(1).substring(4);
                int newAcc = Integer.parseInt(lastAcc) + 1;
                accountnumber = "MVBN" + String.format("%07d", newAcc);
            }
            rs.close();
            ps.close();

            // Step 3: Generate IFSC code
            String ifsccode = "MVBN" + String.format("%04d", (int)(Math.random() * 10000));

            // Step 4: Insert data
            ps = con.prepareStatement("INSERT INTO MyVillageBank (accountnumber, username, password, email, mobilenumber, balance, accounttype, branch, ifsccode, aadharno, dob, occupation, loanstatus, loanid, accountstatus, created_at) \r\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, 'CLOSED', ?, 'Active', SYSDATE)");

            ps.setString(1, accountnumber);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setString(5, mobilenumber);
            ps.setDouble(6, Double.parseDouble(balance));
            ps.setString(7, accounttype);
            ps.setString(8, branch);
            ps.setString(9, ifsccode);
            ps.setString(10, aadharno);
            ps.setString(11, dob);
            ps.setString(12, occupation);
            ps.setString(13, "Not Opened Yet"); 

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<html><body bgcolor='black' text='white'><center>");
                out.println("<h2 style='color:lime;'>Account Registered Successfully</h2>");
                out.println("<p>Your Account Number: <strong>" + accountnumber + "</strong></p>");
                out.println("<p>Your IFSC Code: <strong>" + ifsccode + "</strong></p>");
                out.println("<a href='login.jsp' style='color:deepskyblue;'>Click here to Login</a>");
                out.println("</center></body></html>");
            } else {
                request.setAttribute("error", "Registration failed. Try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace(out);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
