<% if (request.getAttribute("error") != null) { %>
    <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>



<!DOCTYPE html>
<html>
<head>
    <title>Register - MyVillageBank</title>
       <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: white;
        }
        .container {
            max-width: 700px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.05);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }
        h2 {
            text-align: center;
            color: #00ffff;
        }
        form label {
            display: block;
            margin: 10px 0 5px;
            color: #ffccff;
        }
        form input, select {
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .submit-btn {
            background-color: #00bcd4;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }
        .submit-btn:hover {
            background-color: #008c9e;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        .login-link a {
            color: #00bcd4;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register New Account</h2>
        <form action="registerservlet" method="post">
            

            <label>FullName</label>
            <input type="text" name="username" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Mobile Number</label>
            <input type="text" name="mobilenumber" required>

            <label>Enter Amount</label>
            <input type="number" name="balance" required>

            <label>Account Type</label>
            <select name="accounttype">
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
            </select>

            <label>Branch</label>
            <select name="branch">
                <option value="dharmavaram">Dharmavaram</option>
                <option value="tirupati">Tirupati</option>
                <option value="guntur">Guntur</option>
                <option value="ananthapur">Ananthapur</option>
                <option value="tadipatri">Tadipatri</option>
                <option value="puttaparthi">Puttaparthi</option>
                <option value="kurnool">Kurnool</option>
                <option value="vijayawada">Vijayawada</option>
                <option value="pattikonda">Pattikonda</option>
                <option value="rajahmundry">Rajahmundry</option>
                <option value="kadapa">Kadapa</option>
                <option value="vizag">Vizag</option>
                <option value="pulivendula">Pulivendula</option>
                <option value="nandikotkur">Nandikotkur</option>
                <option value="srikakulam">Srikakulam</option>
                <option value="chennekothapalli">ChenneKothapalli</option>
                <option value="penukonda">Penukonda</option>
                <option value="hindupur">Hindupur</option>
                <option value="batthalapalli">Batthalapalli</option>
                <option value="kadiri">Kadiri</option>
            </select>


            <label>Aadhar Number</label>
            <input type="text" name="aadharno" required>

            <label>Date of Birth</label>
            <input type="date" name="dob" required>

            <label>Occupation</label>
            <input type="text" name="occupation" required>

            <input type="submit" class="submit-btn" value="Register">
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
