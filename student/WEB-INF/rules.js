
var ch = 0;
function other()
{	if(ch==0)
	{
		document.getElementById('checkbox-5').style.visibility = 'visible';
		ch=1;

	}
	else{
		ch=0;
		document.getElementById('checkbox-5').style.visibility = 'hidden';
	}
}
function validateName()
{
	var name = document.regform.name.value;
	var regex= /^[A-Z][\s\.](\s)?(\w)+(\s(\w)+)*$/;

		if(regex.test(name)===false)
		{
			window.alert("Please enter Name in the format of Initial. FirstName LastName");
			document.regform.name.focus();
			document.regform.name.value="";
		}
}

function validateUsername()
{
	var uname = document.regform.username.value;
	var regex = /^([A-Za-z])+$/;

	if(regex.test(uname)===false)
	{
		window.alert("Please enter a username having only alphabets.");
		document.regform.username.focus();
		document.regform.username.value="";
	}
}

function validateEmail()
{
	var eid = document.regform.emailid.value;
	var regex=/^[A-Za-z](\w)*@(\w)*\.(((\w)+)\.)*([a-z]){2,4}$/;

		if(regex.test(eid)===false)
		{
			window.alert("Please enter a correct email id.");
			document.regform.emailid.focus();
			document.regform.emailid.value="";
		}

}

function validatePwd()
{
	var pwd = document.regform.pwd.value;
	var regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

	if(regex.test(pwd)===false)
	{
		window.alert("Please enter a password which includes atleast one captial alphabet, number and a special character");
		document.regform.pwd.focus();
		document.regform.pwd.value="";
	}
}

function validateDob()
{
	var dob = document.regform.dob.value;

		if(dob=="")
		{
			window.alert("Please enter a valid Date of Birth");
			document.regform.dob.focus();
		}

}

function validateLang()
{
	var lang = document.regform.lang;
	var i=0;
	var cnt=0;
	for(;i<lang.length;i++)
	{
		if(lang[i].checked===true)
			cnt++;
	}

		if(cnt<2)
		{
			window.alert("Please select atleast 2 languages.");
			document.regform.lang.focus();
		}

}

function validateOtherlang()
{
	var l = document.regform.otherlang;
	var lang = document.regform.lang[3];

	if(lang.checked===true)
		l.readOnly=false;
	else
		l.readOnly=true;
}

function clr()
{
	document.regform.reset();
}