
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Village Bank</title>
      <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <style>
    body {
      margin: 0;
      padding-top: 120px;
      font-family: Arial, sans-serif;
      background-color: black;
      overflow-y: auto;
    }

    .section {
      width: 100%;
      height: 85px;
      display: flex;
      align-items: center;
      justify-content: center;
      background-image: url('images/MyVillage4.png');
      background-size: cover;
      background-position: center;
      position: fixed;
      top: 0;
      left: 0;
      z-index: 1000;
    }

    ul {
      list-style: none;
      margin: 0;
      padding: 0;
      display: flex;
    }

    li {
      margin-right: 30px;
      position: relative;
    }

    a {
      color: black;
      text-decoration: none;
      font-size: 20px;
    }

    a:hover {
      color: darkred;
      text-decoration: underline;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: white;
      min-width: 200px;
      z-index: 1;
      box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
      border: 0.1px solid white;
      border-radius: 12px;
    }

    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      display: block;
      border-bottom: 1px solid #ddd;
      border-radius: 18px;
    }

    .dropdown-content a:hover {
      background-color: lemonchiffon;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    .dropdown-content a::after {
      content: " >";
      position: absolute;
      right: 10px;
      transition: transform 0.3s ease;
    }

    .dropdown-content a:hover::after {
      transform: translateX(5px);
    }

    .contact {
      color: white;
      position: fixed;
      right: 45px;
      top: 8px;
      font-size: 16px;
      text-align: right;
    }

    .home {
      position: absolute;
      top: 85px;
      right: 0.1px;
      width: 60%;
      height: calc(100% - 85px);
      overflow: hidden;
    }

    .home img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      clip-path: ellipse(90% 100% at 100% 50%);

    }

    .maintext {
      margin-left: 55px;
      color: white;
    }

    .maintext h1 {
      font-family: 'Lucida Sans', sans-serif;
      font-size: 30px;
      margin-top: 100px;
    }

    .maintext h1 span {
      font-family: 'MV Boli', cursive;
      color: deepskyblue;
      font-size: 40px;
    }

    .maintext p {
      font-family: cursive;
      font-size:larger;
      margin-left:70px;
    }

    .maintext p span {
      font-family: 'MV Boli', cursive;
      color: deepskyblue;
    }

    .boxes {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 25px;
      margin: 200px 20px 0;
    }

    .box {
      width: 350px;
      height: 200px;
      background-color: lemonchiffon;
      border-radius: 10px;
      padding: 4px;
      text-align: center;
    }

    .box h1 {
      font-size: 22px;
    }

    .box p {
      margin-top: 20px;
    }

    .box a {
      width: 185px;
      height: 35px;
      background-color: green;
      color: white;
      border-radius: 5px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      line-height: 35px;
      position: relative;
    }

    .box a:hover {
      background-color: black;
    }

    .box a::after {
      content: " >";
      position: absolute;
      right: 10px;
      transition: transform 0.3s ease;
    }

    .box a:hover::after {
      transform: translateX(5px);
    }
    .branches {
  background-color: black; /* nearly black */
  color: white;
  padding: 70px 30px 50px;
  text-align: center;
  margin-top: 100px; /* Adds space from previous black section */
  border-top: 2px solid #333;
}

.branches h2 {
  font-size: 36px;
  margin-bottom: 40px;
  font-family: 'Lucida Sans', sans-serif;
  letter-spacing: 1px;
  color: deepskyblue;
}
.branches h3 {
  font-size: 36px;
  margin-bottom: 40px;
  font-family: 'Lucida Sans', sans-serif;
  letter-spacing: 1px;
  color: gray;
}


.branch-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 25px;
  justify-items: center;
  max-width: 1000px;
  margin: 0 auto;
}

.branch-list div {
  background-color: #fff;
  color: #1a1a1a;
  padding: 12px 24px;
  border-radius: 15px;
  font-weight: bold;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
  transition: transform 0.2s ease, background-color 0.3s ease;
}

.branch-list div:hover {
  transform: translateY(-4px);
  background-color: lemonchiffon;
}

.image-background {
   background-color: black;
      background-image: url('images/favicon.png');
      background-repeat: no-repeat;
      background-position: center;
      background-size: 350px 350px; 
      width: 100%;
      height: 300px;
      margin-top: 20px;
    }

  </style>
</head>
<body>
  <div class="section">
    <ul>
      <li><a href="accountdetails">Account Details</a></li>
      <li class="dropdown">
        <a href="#deposits">Deposits</a>
        <div class="dropdown-content">
          <a href="depositmoney.jsp">Savings Account</a>
          <a href="depositmoney.jsp">Current Account</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#withdraw">Withdraw</a>
        <div class="dropdown-content">
          <a href="withdrawmoney.jsp">Savings Account</a>
          <a href="withdrawmoney.jsp">Current Account</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#loans">Loans</a>
        <div class="dropdown-content">
          <a href="vehicleloan.jsp">Vehicle Loan</a>
          <a href="educationalloan.jsp">Educational Loan</a>
          <a href="homeloan.jsp">Home Loan</a>
          <a href="personalloan.jsp">Personal Loan</a>
        </div>
      </li>
       <li><a href="loanrepayment">Pay Loan EMI</a></li>
       <li><a href="usertransaction">Transactions</a></li>
    </ul>
    <div class="contact">
      <p>Contact Us<br>85228-44135</p>
    </div>
  </div>

  <div class="maintext">
  <h1>Welcome <span><%= session.getAttribute("username") %></span></h1>
  <p>
  Explore all the services offered by  <br><span>My Village Bank</span>.
From managing accounts to <br>applying for loans,
you're just a click <br>away from <span>secure and smart banking</span>.<br><br>
Experience seamless digital banking at your <br>fingertips.
Empowering every village with<br> trust, speed, and technology.

  </p>
</div>


  <div class="home">
    <img src="images/farmer2.jpg" alt="Bank Banner" />

  </div>

 <div class="boxes">
  <div class="box">
    <h1>Deposit Money</h1>
    <p>Grow your savings safely and instantly add funds to your account.</p>
    <p><a href="depositmoney.jsp">Deposit Now</a></p>
  </div>
  <div class="box">
    <h1>Withdraw Money</h1>
    <p>Access your funds anytime,anywhere securely and quickly.</p>
    <p><a href="withdrawmoney.jsp">Withdraw Now</a></p>
  </div>
  <div class="box">
    <h1>Education Loan</h1>
    <p>Invest in your future with low-interest education financing.</p>
    <p><a href="educationalloan.jsp">Apply Now</a></p>
  </div>
  <div class="box">
    <h1>Personal Loans</h1>
    <p>Flexible repayment plans tailored to your personal needs.</p>
    <p><a href="personalloan.jsp">Apply Now</a></p>
  </div>
  <div class="box">
    <h1>Home Loans</h1>
    <p>Turn your dream home into reality with our low-interest options.</p>
    <p><a href="homeloan.jsp">Apply Now</a></p>
  </div>
  <div class="box">
    <h1>Vehicle Loans</h1>
    <p>Get on the road faster with quick and affordable vehicle loans.</p>
    <p><a href="vehicleloan.jsp">Apply Now</a></p>
  </div>
</div>

  <div class="branches">
    <h2>Our Branches Across Andhra Pradesh</h2>
    <div class="branch-list">
      <div>Dharmavaram</div>
      <div>Hyderabad</div>
      <div>Guntur</div>
      <div>Ananthapur</div>
      <div>Tadipatri</div>
      <div>Puttaparthi</div>
      <div>Kurnool</div>
      <div>Vijayawada</div>
      <div>Kadiri</div>
      <div>Rajahmundry</div>
      <div>Kadapa</div>
      <div>Vizag</div>
      <div>Pulivendula</div>
      <div>Nandikotkur</div>
      <div>Srikakulam</div>
      <div>ChenneKothapalli</div>
      <div>Penukonda</div>
      <div>Hindupur</div>
      <div>Batthalapalli</div>
      <div>Tirupati</div>
    </div>
    
    <h3>Visit Our Main Branch in Dharmavaram</h3>
  </div>
  <div class="image-background"></div>
  
</body>
</html>
