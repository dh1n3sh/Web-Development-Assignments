<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<html>
<head>
	<title>ONLINE AUIZ APP</title>
	<style type="text/css">
		.center{
			margin-left: 20%;
			font-size: 20px;
		}
		.finish{
			margin-left: 30%;
			width: 80px;
			height: 50px;
		}
	</style>
	 <link rel="stylesheet" href="style.css">
	 <link rel="stylesheet" href="nav.css">
</head>
	<body>
	<script type="text/javascript">
		function Timer_start(){
			var n = 25;
			var timer= setTimeout(countDown,1000);
			document.getElementById("questions").style="display:block";
			document.getElementById("Timerstart").style="display:none";
			function countDown(){
			   n--;
			   if(n > 0){
			      timer=setTimeout(countDown,1000);
			   }
			   document.getElementById("time").innerHTML = "<b>TIME LEFT: "+ n +"</b>";	
					
			  if(n==0)			
			   {	alert("TIME UP !");				
				window.location.reload(true);
			   }
			}
		}
	</script>
	<div class="topnav">
         <a style="float: right;" id="time"> Time Left : </a>
      </div>
	<div id="container">
	<button type="submit" id="Timerstart" onclick="Timer_start();" class="start">START TEST</button>
		<center><h1><b><u>ONLINE QUIZ</u></b></h1></center>
		<%-- <br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/> --%>
		<div id="questions" class="left" style="display:none">
		<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3308/quiz"
         user = "root"  password = "ssn"/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from mcq;
         </sql:query>
			<form class="center" id="form1">
				 <c:forEach var = "row" items = "${result.rows}">
               	<label><c:out value = "${row.qid}"/></label>
				<label><c:out value = "${row.question}"/> </label><br/>
				<input type="radio" id   name="${row.qid}" value="${row.option1}"><c:out value = "${row.option1}"/></input><br/>
				<input type="radio"  name="${row.qid}" value   ="${row.option2}"><c:out value = "${row.option2}"/></input><br/>
				<input type="radio"  name="${row.qid}" value="${row.option3}"><c:out value = "${row.option3}"/></input><br/>
				<br/>
				<br/>

			</c:forEach>

			<button type="button"  class="finish" onclick="checkAnswer()" >FINISH</button>
			</form>
			<script type="text/javascript">
				function checkAnswer(){
					var count =0;
					// var first = document.a1.value;
					// var second = document.a2.value;
					// var third = document.a3.value;

					var f_ele = document.getElementById('form1').elements;
					var checked_val1 = f_ele['a1'].value;
					var checked_val2 = f_ele['a2'].value;
					var checked_val3 = f_ele['a3'].value;
					console.log(checked_val1);
					console.log(checked_val2);
					console.log(checked_val3);
					// console.log(second);
					// console.log(third);
					if(checked_val1=="Delhi"){
						count++;
					}
					if(checked_val2 == "Dhoni"){
						count++;
					}
					if(checked_val3=="Dhoni")
					{
						count++;
					}
					alert("You have Got : "+count);
					var f_elem = document.getElementById('form1');
					f_elem.reset();
								document.getElementById("questions").style="display:block";
			document.getElementById("Timerstart").style="display:none";
				}
			</script>
		</div>
		</div>
	</body>
</html>