
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<title>DNS Query Analyis</title>
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

img {
	border-radius: 50%;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #ff9999;
    color: white;
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
					<a href="search.jsp">Search Domain</a>
					<a href="add.jsp">Add Domain</a> 
					<a href="#">Remove Domain</a>
				</div>
			</li> 
				<a href=entropy.jsp class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Entropy Analysis</a>
				<a href="regdate.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Domain Registration Dates</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="realentropy.jsp" class="w3-bar-item w3-button w3-padding-large">Entropy Analysis</a>
			<a href="realreg.jsp" class="w3-bar-item w3-button w3-padding-large">Domain Registration Dates</a>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-container w3-red w3-center" style="padding: 128px 16px">
	<h1 class="w3-margin w3-jumbo">Entropy Analyis</h1>
	
	<!-- Form -->
	<!-- The input name, "entro", is 
	crucial here as this is the 'parameter' we will request
	when running the MySQL Query in "entropydisplay.jsp" -->
	<form ACTION="entropydisplay.jsp" METHOD="POST">
		<center>
			<label for="fname">Enter Domain Name:</label> 
			<input TYPE="TEXT" NAME="entro" VALUE=""> <br> 
			<input TYPE="SUBMIT" VALUE="Submit">
		</center>
	</form>
	</header>

	<!-- First Grid -->
	<div class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>Shannon Entropy</h1>
				<p>Information entropy is defined as the average amount of
					information produced by a stochastic source of data. The measure of
					information entropy associated with each possible data value is the
					negative logarithm of the probability mass function for the value.
					Thus, when the data source has a lower-probability value (i.e.,
					when a low-probability event occurs), the event carries more
					"information" ("surprisal") than when the source data has a
					higher-probability value. The amount of information conveyed by
					each event defined in this way becomes a random variable whose
					expected value is the information entropy.
					(sourced at, https://en.wikipedia.org/wiki/Entropy_(information_theory))
				</p>
					<h5 class="w3-padding-32"></h5>
					<p class="w3-text-grey"></p>
					<h1>DGAs</h1>
				<p>Conficker, pushdo and cryptolocker are examples of which implement DGAs. Each of these use different seeds and as such it may be useful to assess the entropy levels of each of these malicious domain types
				</p>
					<img src="https://cdn.grahamcluley.com/wp-content/uploads/2013/11/cryptolocker-thumb.png" alt="Cyptolocker" width="130" height="130">
					<img src="https://news.asis.io/sites/default/files/styles/220-320/public/field/image/PushDo-Logo.png?itok=CPgvqqdU" alt="PushDo" width="150" height="150">
					<img src="https://systweak1.vo.llnwd.net/content/wp/systweakblogsnew/uploads/Conficker.jpeg" alt="Conficker" width="130" height="130">
					<img src="https://i1.wp.com/www.sileo.com/wp-content/uploads/2014/10/gameover.jpg?fit=500%2C500&ssl=1" alt="GOZ" width = "155" height = "155">
			</div>
			<div class="w3-third w3-center">
				<i class="fa fa-bar-chart" style="font-size: 200px; color: #ff3333"></i>
				<br><br><br><br><br><br><br><br><br><br>

				<table>
					<tr>
						<th>Ransomware</th>
						<th>Sample Domain</th>
						<th>Entropy Value</th>
					</tr>
					<tr>
						<td>GameOver Zues</td>
						<td>ljbeutceyovxjnirdepudyfm.ru</td>
						<td>4.10637</td>
					</tr>
					<tr>
						<td>New GameOver Zues</td>
						<td>71sz271y6jw0m1nmkgq11owix1f.com</td>
						<td>3.81366</td>
					</tr>
					<tr>
						<td>Cryptolocker</td>
						<td>ofdhiydrrttpblp.com</td>
						<td>3.72161</td>
					</tr>
				</table>
			</div>
		</div>

		<!-- Footer -->
		<footer class="w3-container w3-padding-64 w3-center w3-opacity">
		<p>Ryan Lally</p>
		<p> Contact information:
			<a href="ryanlally91@gmail.com"> ryanlally91@gmail.com</a>.
		</p>
		</footer>
</body>
</html>
