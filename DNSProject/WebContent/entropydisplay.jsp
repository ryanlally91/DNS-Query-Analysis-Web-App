<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Inline CSS style elements -->
<style>
#domains {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#domains td, #domains th {
	border: 1px solid #ddd;
	padding: 8px;
}

#domains tr:nth-child(even) {
	background-color: #f2f2f2;
}

#domains tr:hover {
	background-color: #ddd;
}

#domains th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #ff4d4d;
	color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<HTML>
<BODY>

	<!-- Navbar -->
	<!-- Contains the links to the applications other pages-->
	<div class="w3-top">
		<div class="w3-bar w3-red w3-card w3-left-align w3-large">
			<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu">
				<i class="fa fa-bars"></i>
			</a> 
				<a href="search.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
				<a href="entropy.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Entropy Analysis</a> 
				<a href="regdate.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Domain Registration Dates</a>
		</div>
		
		<!-- Navbar on small screens -->
		<div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
			<a href="entropy.jsp" class="w3-bar-item w3-button w3-padding-large">Entropy Analysis</a> 
			<a href="regdate.jsp" class="w3-bar-item w3-button w3-padding-large">Domain Registration Dates</a>
		</div>
	</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding: 128px 16px">
<h1 class="w3-margin w3-jumbo">Query Results</h1>
</head>
<H2>
	<CENTER>
		<%
			String shannon=request.getParameter("entro");//Assigns input from the web form (in entropy.jsp) to the string, 'shannon'
			//The shannon entropy formula, expressed here as a lamda expression, finds the entropy of the user input. By assessing the amount of entropy (i.e 'radnomness') in the string, we can evaluate the liklihood that a given Domain is 'malicious'
			//takes the user input, boxes it into a stream of type, character, returns a double stream then retrievesthe unicode code point values at each index in the string
			//before filtering through them while performing various mathematical functions (mainly getting log values) in order to predict the probability that agiven symbol will appear
			//sometimes referred to as "estimate the average minimum number of bits needed to encode a string of symbols, based on the frequency of the symbols."
			//the source code is located at, '(https://www.reddit.com/r/dailyprogrammer/comments/4fc896/20160418_challenge_263_easy_calculating_shannon/)'
			Double result = (shannon.chars().mapToDouble(i ->-Math.log((double)shannon.codePoints().filter(c -> c==i).count()/shannon.length())/Math.log(2)/shannon.length()).sum());
			out.println(result);
			if (result < 3.69) {
		%>
		
		<!-- The user is issued an alert if the entropy value exceeds that of the predefined threshold --> 
		<h1>Acceptable entropy value</h1>
		<i class="fa fa-thumbs-o-up" style="font-size: 105px; color: #d9d9d9"></i>
		<%
            // else
        } else {
         %>
		<h1>Unacceptable entropy value</h1>

		<i class="fa fa-warning" style="font-size: 105px; color: yellow"></i>
		<%} %>


	</CENTER>
</H2>
		<!-- Footer --> 
		<footer class="w3-container w3-padding-64 w3-center w3-opacity">
			<p>Ryan Lally</p>
				<p>Contact information: 
				<a href="ryanlally91@gmail.com">ryanlally91@gmail.com</a>.
				</p>
		</footer>
</BODY>
</HTML>