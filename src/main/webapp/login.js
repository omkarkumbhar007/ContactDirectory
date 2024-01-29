	function showRegistration(flag){
	    var login = document.getElementById("login");
	    var registration = document.getElementById("registration");
	    if(flag){
	        login.style.display = "none";
	        registration.style.display = "block";
	    }else{
	        login.style.display = "block";
	        registration.style.display = "none";
	    }
	}
	
	