<%@ page isErrorPage="true" %>
<html>
<head><title>Error</title>
   <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="images/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="font-family: Arial; background: #fce4e4;">
    <h2 style="color: red;">Oops! Something went wrong.</h2>
    <h3>Error Details:</h3>
    <pre style="background: #fff0f0; border: 1px solid #ccc; padding: 15px;">
${error}
    </pre>
</body>
</html>
