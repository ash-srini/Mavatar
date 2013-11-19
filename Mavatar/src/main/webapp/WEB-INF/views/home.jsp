<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Home</title>

<!-- Twitter Bootstap -->
<link
	href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link href="resources/css/general.css" rel="stylesheet">

<!-- JQuery -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<style type="text/css">
#displayimage{
float: right;
}
.wrapper{
height: 93%;

text-align: center;
}
#footer{
background-color: black;
}
#githublink{
 color: white;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	//div to diaplay image is originally hidden
	//$("#disp").hide();
	
	//AJAX to check if the entered email is valid or not
$("#getmavatar").click(function(){
	var x = $("#email").val();
	if($("#mavatartype1").is(':checked') ){
		var y = $("#mavatartype1").val();
	}
	if($("#mavatartype2").is(':checked') ){
		var y = $("#mavatartype2").val();
	}
	if($("#mavatartype3").is(':checked') ){
		var y = $("#mavatartype3").val();
	}
	
	if(x!=""){
		$.ajax({
			url : "/identicons/checkEmail?x="+x,
			type : 'GET',
			
			success : function(result){
				if(result == "invalid"){
					alert("Invalid Email. Please enter a valid email address!!!");
				}
			}
		});
		
	/* 	$.ajax({
			url : "/identicon/emailAddress?emailaddr="+x+"&mavatartype="+y,
			type : 'GET',
			
			success : function(result){
				$("#displayimage").load(result);
				//$("#displayimage").show();
			}
		}); */
		
		$.post("/identicons/emailAddress",
			{
				emailaddr : x,
				mavatartype : y
			},
			function(result){
				
				//$("#disp").show();
				$("#displayimage").html(result);
				
			});
	} 
});




});



</script>

</head>
<body>

<div class="wrappage">
<div class="wrapper">

	<div class="container">

		<nav class="navbar navbar-inverse">
			<a class="navbar-brand" href="#">Mavatar</a>
		</nav>
		<div class="header"></div>
		<h1>Enter Your Email ID</h1>
		
		<div class="inner">
			<input type="text" name="emailaddr" id="email"> <br/><br/>
			<input type="radio" name="mavatartype" value="identicon" id="mavatartype1"> Identicon <br/>
			<input type="radio" name="mavatartype" value="monsterid" id="mavatartype2"> Monster <br/>
			<input type="radio" name="mavatartype" value="wavatar" id="mavatartype3"> Wavatar <br/><br/>
			<button class="btn btn-inverse btn-lg" type="submit" id="getmavatar">Get my Mavatar</button><br/><br/>
		</div>
		
		
	<div class="display_mavatar" id="displayimage">
		
	
	
	</div>	
	</div>


</div>




<div class="container">
<div id="footer">
			<div class="container">
				<p class="text-muted credit">
					&copy; <a href="https://github.com/ash-srini" id="githublink">Aishwarya Srinivasan</a>
				</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
