
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<title>DNS Query Analysis</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Inline CSS style elements -->
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

html {
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%
}

body {
	margin: 0
}

article, aside, details, figcaption, figure, footer, header, main, menu,
	nav, section, summary {
	display: block
}

input[type=submit] {
	width: 25%;
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

w3-top, .w3-bottom {
	position: fixed;
	width: 100%;
	z-index: 1
}

.w3-top {
	top: 0
}

.w3-bottom {
	bottom: 0
}

.w3-container:after, .w3-container:before
        .w3-container, .w3-panel {
	padding: 0.01em 16px
}

.w3-panel {
	margin-top: 16px;
	margin-bottom: 16px
}

input[type=text], select {
	width: 55%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<body>

	<!-- Navbar -->
	<!-- Contains the links to the applications other pages-->
	<div class="w3-top">
		<div class="w3-bar w3-red w3-card w3-left-align w3-large">
			<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu">
				<i class="fa fa-bars"></i>
			</a>
				<li class="dropdown">
				<a href="javascript:void(0)" class="dropbtn">Home</a>
				<div class="dropdown-content">
					<a href="search.jsp">Search Domain</a> <a href="add.jsp">Add Domain</a> 
						<a href="#">Remove Domain</a>
				</div></li> 
					<a href="entropy.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Entropy Analysis</a> 
				<a href="regdate.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Domain Registration Dates</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="entropy.jsp" class="w3-bar-item w3-button w3-padding-large">Entropy Analysis</a>
			<a href="regdate.jsp" class="w3-bar-item w3-button w3-padding-large">Domain Registration Dates</a>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-container w3-red w3-center" style="padding: 128px 16px">
	<h1 class="w3-margin w3-jumbo">Add Domain</h1>

	<!-- Form -->
	<!-- The input name, "add", is 
	crucial here as this is the 'parameter' we will request
	when running the MySQL Query in "adddisplay.jsp"-->
	<FORM ACTION="adddisplay.jsp" METHOD="POST">
		<CENTER>
			<label for="fname3">Enter Domain Name:</label> 
			<INPUT TYPE="TEXT" NAME="add" VALUE=""> <BR>
			<INPUT TYPE="SUBMIT" VALUE="Submit">
		</CENTER>
	</FORM>
	
	<header class="w3-container w3-red w3-center" style="padding: 128px 16px">
	<title>Insert title here</title>


	</header> <!-- First Grid -->
	<div class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-content">
			<div class="w3-twothird"></div>
			<h1>Local Variants</h1>
			<p>While the majority</p>
			<div class="w3-third w3-center">
				<i class="fa fa-bar-chart" style="font-size: 200px; color: #ff3333"></i>
			</div>
		</div>

		<!-- Footer -->
		<footer class="w3-container w3-padding-64 w3-center w3-opacity">
		<p>Ryan Lally</p>
		<p>	Contact information:
			 <a href="ryanlally91@gmail.com">ryanlally91@gmail.com</a>.
		</p>
		</footer>
</body>
</html>


</body>
</html>