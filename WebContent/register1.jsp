<!doctype html>
<html>
<head>
<title>
ApniDukan
</title>
<style>
form
{
border:1px solid black;
max-width:30%;
position:relative;
padding:15px;
left:33%;
}
input[type="text"],input[type="password"],input[type="number"],input[type="email"]
{
width:100%;
height:27px;
border-radius:5px;
box-sizing:border-box;
}
button{
padding:0 15px;
height:40px;
cursor: pointer;
position:relative;
border-radius:5px;
left:40%;
}
label{
font-size:20px;
}

.container
{
padding:5px;
}
.option1{
width:100px;}
.sign
{
position:relative;
left:40%;
}
img
{
position:fixed;
left:0px;
}
.SocialLogin a.facebook1
{
border-radius:5px;
color:white;
background:blue;
}
.SocialLogin a
{
text-decoration:none;
position:relative;
border:1px solid black;
padding :10px;
margin:10px;
left:42%;
}
.SocialLogin a.google1
{
border-radius:5px;
color:white;
background:#FF1919;
}

.SocialLogin a.facebook1:hover
{
color:white;
border:2px solid #000066;
background:#3333CC;
}
</style>
</head>
<body>
<h1><center>online shoping cart</center></h1>
<hr>
<h2><p class="sign">Sign-Up Form</p></h2>
<form action="register.jsp" method="post">
<div class="container">
<label>first name :</label><input type="text" name="fname" required><br><br>
<label>last name :</label><input type="text" name="lname" required><br><br>
<label>Password :</label><input type="password" name="pass" required><br><br>
<label>Confirm Password  :</label><input type="password" name="cun_pass" required><br><br>

<label>Address :</label><input type="text" name="address" required><br><br>
<label>Phone :</label><input type="number" name="phone" min="1000000000" max="9999999999" step="1" required><br><br>
<label>Email ID :</label><input type="email" name="email" required><br><br>
<button type="submit" onclick="validatePassword()" >Sign-In</button>
</div>
</form>
<br>
<jsp:include page="fblogin.jsp"/>
<!-- 
<script>
var password = document.getElementById("upass"), confirm_password = document.getElementById("cun_upass");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>
-->
</body>
</html>
