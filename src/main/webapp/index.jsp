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

   
    .contact {
  color: black;
  position: fixed;
  right: 30px;
  
  font-size: 14px;
  text-align: right;

}


    .maintext {
      margin-left: 55px;
      color: white;
    }

    .maintext h1 {
      margin-top: 100px;
      font-size: 30px;
    }

    .maintext h1 span {
      font-size: 40px;
      color: deepskyblue;
    }

    .maintext p {
      font-size: large;
      font-family: cursive;
    }

    .maintext p span {
      color: deepskyblue;
    }

    .home {
      position: absolute;
      top: 85px;
      right: 0;
      width: 60%;
      height: calc(100% - 85px);
      overflow: hidden;
    }

    .home img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      clip-path: ellipse(100% 100% at 100% 50%);
    }

    .boxes {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
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

    .box a {
      background-color: green;
      color: white;
      padding: 8px 20px;
      border-radius: 5px;
      text-decoration: none;
      display: inline-block;
      margin-top: 15px;
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
      background-color: #000;
      color: white;
      padding: 70px 30px 50px;
      text-align: center;
      margin-top: 100px;
    }

    .branches h2 {
      font-size: 36px;
      color: deepskyblue;
    }

    .branches h3 {
      font-size: 30px;
      color: gray;
      margin-top: 40px;
    }

    .branch-list {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 25px;
      max-width: 1000px;
      margin: 40px auto 0;
    }

    .branch-list div {
      background-color: #c9bdbd;
      color: #1a1a1a;
      padding: 12px 24px;
      border-radius: 15px;
      font-weight: bold;
      transition: 0.3s ease;
    }

    .branch-list div:hover {
      background-color: lemonchiffon;
    }

    .image-background {
      background-color: black;
      background-image: url('images/favicon.png');
      background-repeat: no-repeat;
      background-position: center;
      background-size: 350px 350px; /* Resize as needed */
      width: 100%;
      height: 300px;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="section">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li><a href="register.jsp">Register</a></li>
      <li class="dropdown">
       </ul>
      <div class="contact">
    <h5>Contact Us<br>85228-44135<br>myvillagebank000@gmail.com</h5>
  </div>
</div>
    </div>
  </div>

  <div class="maintext">
    <h1>Your Path to <span>Financial</span><br>Freedom Starts Here<br><span>My Village Bank</span></h1>
    <p>
      Start building your wealth today with the support of <br><span>My Village Bank</span>.
      Whether you’re saving for the future <br>or making your next big investment,
      we are here to guide <br>you <span>every step of the way.</span>
    </p>
  </div>

  <div class="home">
    <img src="images/MyVillagefirst.png" alt="Banner" />
  </div>

  <div class="boxes">
    <div class="box">
      <h1>Savings Account</h1>
      <p>Zero Fee Charges only for You!!</p>
      <a href="register.jsp">Apply Now</a>
    </div>
    <div class="box">
      <h1>Current Account</h1>
      <p>Unlimited Transactions to your Account!!</p>
      <a href="register.jsp">Apply Now</a>
    </div>
    <div class="box">
      <h1>Deposits</h1>
      <p>Earn up to 6.18% per Annum</p>
      <a href="login.jsp">Apply Now</a>
    </div>
    <div class="box">
      <h1>Personal Loans</h1>
      <p>Flexible repayment plans just for you!</p>
      <a href="login.jsp">Apply Now</a>
    </div>
    <div class="box">
      <h1>Home Loans</h1>
      <p>Low-interest options for your dream home</p>
      <a href="login.jsp">Apply Now</a>
    </div>
    <div class="box">
      <h1>Vehicle Loans</h1>
      <p>Drive your dreams starting today!</p>
      <a href="login.jsp">Apply Now</a>
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
