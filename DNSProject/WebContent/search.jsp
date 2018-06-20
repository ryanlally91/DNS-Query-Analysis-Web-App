<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<title>DNS Query Analyis</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- A reference to the external CSS style sheet as well as the reference for the vector icons & logos -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Inline style elements -->
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
	width: 50%;
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
	<div class="w3-top">
		<div class="w3-bar w3-red w3-card w3-left-align w3-large">
			<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu">  
				<i class="fa fa-bars"></i>
			</a>
			<!-- Contains the links to the applications other pages-->
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Home</a>
				<div class="dropdown-content">
					<a href="search.jsp">Search Domain</a> 
					<a href="add.jsp">Add Domain</a>
					<a href="removedomain.jsp">Remove Domain</a>
				</div>
			</li> 
					<a href="entropy.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Entropy Analysis</a> 
					<a href="regdate.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Domain Registration Dates</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="entropy.jsp" class="w3-bar-item w3-button w3-padding-large">Entropy Analysis</a>
			<a href="regdate.jsp" class="w3-bar-item w3-button w3-padding-large">Domain Registration Dates</a>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-container w3-red w3-center" style="padding: 128px 16px" "color:blue">
		<h1 class="w3-margin w3-jumbo">Whitelist Analysis</h1>
		
		
		<!-- Form -->
		<!-- The input name, "search1", is 
		crucial here as this is the 'parameter' we will request
		when running the MySQL Query in "searchdisplay.jsp" -->
		<form name="myForm" action="searchdisplay.jsp" method="POST"><!-- The 'action' element sends the form-data to a file named "searchdisplay.jsp" (to process the input)  -->
			<label for="fname">Enter Domain Name:</label> 
			<input type="text" value="" placeholder="Domain name.." name="search1"> <br>
			<input type="Submit" value="Submit" name="submit">
		</form>
	</header>


	<!-- First Grid -->
	<div class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-content">
			<div class="w3-twothird">
				<h1>What are suspicious DNS query signatures?</h1>
				<p>Suspicious DNS Query signatures are looking for DNS
					resolution to domains potentially associated with C2 traffic, which
					could be an indication of a breached machine. These modifications
					may be made for malicious purposes such as phishing, or for
					self-serving purposes by Internet service providers (ISPs) and
					public/router-based online DNS server providers to direct users'
					web traffic to the ISP's own web servers where advertisements can
					be served, statistics collected, or other purposes of the ISP; and
					by DNS service providers to block access to selected domains as a
					form of censorship.
				</p>
					<h5 class="w3-padding-32"></h5>
					<p class="w3-text-grey"></p>
					<h1>Blacklists & Whitelists</h1>
					<p>Due to the computational capability of DGAs (some can produce
						as many domains as 250 in 3 hours) maintaining any sort of a
						blacklist is both ineffectual and futile. However, in reality, the
						majority of people spend most of their time visiting the same
						websites regularly (e.g. google, netflix, facebook etc). This makes
						the idea of a whitelist in fact quite effective. If the domain in
						question can be found on a whitelist (comprised of the most
						commonly visited sites on the web) then it can be considered a
						'verified' domain, and not likely a malicious DNS request
					</p>
				<img src="https://1.bp.blogspot.com/-RYn6MdBtYHY/Ub3tHLDcw1I/AAAAAAAALXs/E4dUGnsZ6nM/s1600/Screen+Shot+2013-06-16+at+6.49.00+PM.png" width="600" height="350">
			</div>
			<div class="w3-third w3-center">
				<i class="fa fa-bug w3-padding-64" style="font-size: 200px; color: #ff3333"></i> 
					<br><br><br><br><br><br> 
				<img src="https://oxidemod.org/data/resource_icons/1/1932.jpg?1464204571" alt="resource" width= "160" height="160 "> 
					<br><br><br><br><br><br>
				 <img src="https://alln-extcloud-storage.cisco.com/ciscoblogs/Security-Research2-300x226.jpg " alt="cisco stats" width ="210 " height="220 ">
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-padding-64 w3-center w3-opacity ">
		<p>Ryan Lally</p>
		<p> Contact information: 
			<a href="ryanlally91@gmail.com "> ryanlally91@gmail.com </a>.
		</p>
	</footer>
</body>
</html>