<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import= "java.lang.*,java.net.*,java.util.*,java.text.*"%>
<%@ page import="javax.activation.*,javax.mail.*,org.apache.commons.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
	<title> ONLINE QUIZ</title>
	<style type="text/css">
		.boxed {
  			border: 1px solid red;
				} 
		body{
			 background-image: linear-gradient(#ff4b1f,#1fddff );
			 background-repeat: no-repeat;
			 width: 100%;
    			 height: 100%;
			 background-attachment: fixed;
		    }
	</style>

</head>
<body>
	<script type="text/javascript">
		function Timer_start(){
			var n = 25;
			var timer= setTimeout(countDown,1000);

			function countDown(){
			   n--;
			   if(n > 0){
			      timer=setTimeout(countDown,1000);
			   }
			   document.getElementById("hey").innerHTML = "<b>TIME LEFT: "+ n +"</b>";	
					
			  if(n==0)			
			   {	alert("TIME UP !");				
				window.location.reload(true);
			   }
			}
		}
	</script>

<h3> PRESS BUTTON TO START TEST</h3>
<button type="submit" onclick="Timer_start();">START TEST</button>
<p id="hey"></p>

	<!-- JSTL CODE !--> 
<c:set var = "count" scope = "session" value = "${0}"/>
<c:set var = "q1" scope = "session" value = "${param.q1}"/>
<c:set var = "q2" scope = "session" value = "${param.q2}"/>
<c:set var = "q3" scope = "session" value = "${param.q3}"/>
<c:set var = "q4" scope = "session" value = "${param.q4}"/>
<c:set var = "q5" scope = "session" value = "${param.q5}"/>



<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/ex8"
         user = "deepika"  password = "deepika"/>
<sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from quiz;
</sql:query>
<c:forEach var="row" items="${result.rows}">
<c:set var = "t1" scope = "session" value = "${row.a1}"/>
<c:set var = "t2" scope = "session" value = "${row.a2}"/>
<c:set var = "t3" scope = "session" value = "${row.a3}"/>
<c:set var = "t4" scope = "session" value = "${row.a4}"/>
<c:set var = "t5" scope = "session" value = "${row.a5}"/>

    <c:if test="${ q1==t1}">
		<c:set var = "count" scope = "session" value = "${count+1}"/>
	</c:if>
	<c:if test="${ q2==t2}">
		<c:set var = "count" scope = "session" value = "${count+1}"/>
	</c:if> 
	<c:if test="${ q3==t3}">
		<c:set var = "count" scope = "session" value = "${count+1}"/>
	</c:if> 
	<c:if test="${ q4==t4}">
		<c:set var = "count" scope = "session" value = "${count+1}"/>
	</c:if>
	 <c:if test="${ q5==t5}">
		<c:set var = "count" scope = "session" value = "${count+1}"/>
	</c:if>
	 <b>YOUR <U>SCORE</U> IS&nbsp<c:out value="${count}"/></b>
</c:forEach>
 		<!-- JSTL CODE !--> 
	<h1>TIMELINE QUIZ</h1>
	<form name="quizF" action="quiz.jsp">
		<label>1. YEAR OF INDEPENDANCE________</label><br>
		<input type="radio" name="q1" value="1">1947
		<input type="radio" name="q1" value="2">1945
		<input type="radio" name="q1" value="3">1948<br><br>

		<label>2. WORLD WAR 1 STARTED IN THIS YEAR________</label><br>
		<input type="radio" name="q2" value="1">1914
		<input type="radio" name="q2" value="2">1918
		<input type="radio" name="q2" value="3">1915<br><br>

		<label>3. UNITED NATIONS WAS FORMED IN________</label><br>
		<input type="radio" name="q3" value="1">1944
		<input type="radio" name="q3" value="2">1945
		<input type="radio" name="q3" value="3">1946<br><br>

		<label>4. BERLIN WALL WAS DESTROYED IN________</label><br>
		<input type="radio" name="q4" value="1">1991
		<input type="radio" name="q4" value="2">1961
		<input type="radio" name="q4" value="3">1993<br><br>

		<label>5. EAST INDIA COMPANY WAS STARTED IN________</label><br>
		<input type="radio" name="q5" value="1">1600
		<input type="radio" name="q5" value="2">1610
		<input type="radio" name="q5" value="3">1605<br><br>

		<input type="submit" value="FINISH" onClick="">		
	</form>
</body>
