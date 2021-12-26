<!DOCTYPE>
 <!-- html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html>
   <!-- xmlns="http://www.w3.org/1999/xhtml> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Voting System Access Denied</title>
<link href="css/user_styles.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="tan">
<center><a href ="https://www.elections.sk.ca/"><img src = "images/logo.png" alt="site logo"></a></center><br>     
<center><b><font color = "brown" size="6">Voting System</font></b></center><br><br>
<body>
<div id="page">
<div id="header">
<h1>Invalid Credentials Provided </h1>
<p align="center">&nbsp;</p>
</div>
<div id="container">
<?php
ini_set ("display_errors", "1");
error_reporting(E_ALL);

ob_start();
session_start();
require('connection.php');


//login details.
$usrname=$_POST['myusername'];
$psswrd=$_POST['mypassword'];

$encrypted_mypassword=md5($psswrd);

$usrname = stripslashes($usrname);
echo $psswrd = stripslashes($psswrd);

$sql=mysqli_query($con, "SELECT * FROM tbmembers WHERE email='$usrname' and password='$encrypted_mypassword'");

// Checking table row
$count=mysqli_num_rows($sql);

if($count==1){
//moving to student.php
$user = mysqli_fetch_assoc($sql);
$_SESSION['member_id'] = $user['member_id'];
header("location:student.php");
}
//If the username or password is wrong.
else {
echo "Wrong Username or Password<br><br>Return to <a href=\"index.php\">login</a>";
}

ob_end_flush();

?> 
</div>
<div id="footer"> 
<div class="bottom_addr">-----&copy; 2021 Simple PHP Voting System. Made By Harshil & Aayush-----</div></div>
</div>
</body>
</html>