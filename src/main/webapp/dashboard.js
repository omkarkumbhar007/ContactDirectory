

//validating mobile number using check function
function check()
	{
		var mob=document.getElementById("PhoneNumber").value;
		
		var len=mob.length;
		
	
		//allowing appropirate condtions only	
		if(mob.trim()!='' && len==10 )
		{
				return true;
		}
		else
		{
		    alert("Enter Appropriate Mobile Number");
			return false;
		}

	}