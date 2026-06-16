<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>DevOps Registration</title>

<style>
body {
  font-family: Arial, sans-serif;
  background: #f4f6f9;
  margin: 0;
  padding: 0;
}

.container {
  width: 420px;
  margin: 50px auto;
  background: #fff;
  padding: 25px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

h1 {
  text-align: center;
  color: #2c3e50;
  font-size: 22px;
}

p {
  text-align: center;
  color: #666;
  font-size: 14px;
}

label {
  font-weight: bold;
  display: block;
  margin-top: 12px;
}

input {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

button {
  width: 100%;
  padding: 12px;
  margin-top: 20px;
  background: #28a745;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
}

button:hover {
  background: #218838;
}

.footer {
  text-align: center;
  margin-top: 15px;
  font-size: 13px;
}

h2 {
  text-align: center;
  margin-top: 30px;
  color: #34495e;
  font-size: 18px;
}
</style>
</head>

<body>

<div class="container">

  <h1>New User Registration</h1>
  <p>Create your DevOps learning account</p>

  <form action="action_page.php">

    <label>Full Name</label>
    <input type="text" placeholder="Enter your full name" required>

    <label>Mobile Number</label>
    <input type="text" placeholder="Enter mobile number" required>

    <label>Email</label>
    <input type="email" placeholder="Enter email address" required>

    <label>Password</label>
    <input type="password" placeholder="Enter password" required>

    <label>Confirm Password</label>
    <input type="password" placeholder="Repeat password" required>

    <button type="submit">Register</button>

  </form>

  <div class="footer">
    Already have an account? <a href="#">Sign in</a>
  </div>

</div>



</body>
</html>
