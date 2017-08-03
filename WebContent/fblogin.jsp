<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
</head>
<body>
	<script>
		// initialize and setup facebook js sdk
		window.fbAsyncInit = function() {
		    FB.init({
		    	 appId      : '458152301212153',
		    	    cookie     : true,  // enable cookies to allow the server to access 
		    	                        // the session
		    	    xfbml      : true,  // parse social plugins on this page
		    	    version    : 'v2.8' // use version 2.2
		    });
		    FB.getLoginStatus(function(response) {
		    	if (response.status === 'connected') {
		    		//document.getElementById('status').innerHTML = 'We are connected.';
		    		document.getElementById('login').style.visibility = 'hidden';
		    		window.location="http://google.com";
		    	} else if (response.status === 'not_authorized') {
		    		document.getElementById('status').innerHTML = 'We are not logged in.'
		    	} else {
		    		//document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
		    	}
		    });
		};
		(function(d, s, id){
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) {return;}
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		// login with facebook with extra permissions
		function login() {
			FB.login(function(response) {
				if (response.status === 'connected') {
		    		//document.getElementById('status').innerHTML = 'We are connected.';
		    		document.getElementById('login').style.visibility = 'hidden';
		    		
		    	} else if (response.status === 'not_authorized') {
		    		document.getElementById('status').innerHTML = 'We are not logged in.'
		    	} else {
		    		//document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
		    	}
			}, {scope: 'email'});
			getInfo();
			
		}
		
		// getting basic user info
		function getInfo() {
			FB.api('/me', 'GET', {fields: 'first_name,last_name,name,id,email'}, function(response) {
				var abc = response.email;
				var cde=response.first_name;
				var fg=response.last_name;
				window.location="fblogincontroller.jsp?email="+abc+"&first_name="+cde+"&last_name="+fg;
			});
			
			
		}
	</script>

	<div id="status"></div>
	<!-- <button onclick="login()" class="login">Connect with facebook</button> --> 
   <center> <div class="fb-login-button" data-width="25" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true" onlogin="login()"></div> 
	</center>
	
</body>
</html>