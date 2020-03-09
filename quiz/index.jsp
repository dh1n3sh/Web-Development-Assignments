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
</head>
	<body>
		<center><h1><b><u>ONLINE QUIZ</u></b></h1></center>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
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
				<input type="radio"  name="${row.qid}" value="${row.option2}"><c:out value = "${row.option2}"/></input><br/>
				<input type="radio"  name="${row.qid}" value="${row.option3}"><c:out value = "${row.option3}"/></input><br/>
				<br/>
				<br/>

			</c:forEach>
			<br/>
			<br/>
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

				}
			</script>
	</body>
</html>