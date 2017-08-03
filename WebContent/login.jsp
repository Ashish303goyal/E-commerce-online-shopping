
<!doctype html>
<html>
<head>
<title>
ApniDukan
</title>
<link rel="shortcut icon" href="myfile.jpg" href="mufile.jpg" >
<link rel="stylesheet" href="fa/css/font-awesome.min.css" type="text/css" >
<style>
form{
border:1px solid black;
max-width:30%;
position:relative;
padding:15px;
left:35%;
}
input[type="text"],input[type="password"]
{
width:100%;
height:30px;
border-radius:5px;
box-sizing:border-box;
}
input[type="submit"]
{
position:relative;
left:40%;
top:-5px;
font-size:20px;
border-radius:5px;
background:#cdc0b0;
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
.line{
border:1px dotted black;
}
.container
{
padding:5px;
}
.forget
{
margin-top:6px;
position:relative;
left:85px;
}
.error{
text-align:center;
font-size:20px;
color:red;
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
left:37%;
}
.SocialLogin a.google1
{
border-radius:5px;
color:white;
background:#FF1919;
}
.SocialLogin a.google1:hover
{
color:white;
border:2px solid #FF1919;
background:#FF4D4D;
}
.SocialLogin a.facebook1:hover
{
color:white;
border:2px solid #000066;
background:#3333CC;
}
div.admin
{
position:relative;
left:40%;
}
.admin a
{
color:red;
text-decoration:none;
}
.admin a:hover
{
color:black;
text-decoration:underline;
}
</style>
</head>
<body>
<h1><center>online shoping cart</center></h1>
<h2><p align="center">Login Form</p></h2>
<form method="post" action="loginprocess.jsp">
<div class="container">
<label>email :</label><input type="text" name="email" required><br><br>
<label>password :</label><input type="password" name="password" required><br><br>
<input type="submit" value="login">
<!--<p class="error">invalid username or password</p>-->
</div>
<div class="line"></div>
<div class="admin">
<a href="adminlogin.jsp">ADMIN LOGIN</a>
</div>
<div class="forget">

<a href="register1.jsp">Create new account</a>
</div>
</form>
<br>
<jsp:include page="fblogin.jsp"/>

</div> 
</body>
</html>
