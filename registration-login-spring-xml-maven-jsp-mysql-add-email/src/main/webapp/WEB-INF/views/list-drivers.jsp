
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page language="java" session="true"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  align-items:center;
  width: 80%;
  margin-top: 3%;
  margin-left: 10%;

}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 20px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
  

  #fare {
      display: none;
  }

</style>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 

</head>
<body>



<c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h3>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h3>

 </c:if>

<div class="text-center">
<br>
<br>
<br>
<h3>Select Your Driver</h3>

</div>

 <form:form   style=""  action="bookingdetails"  modelAttribute="bookingdetails" class="align-items-center font-weight-bold" method="GET">
 
<% String fare = request.getParameter("fare");/* out.print(fare); */%>
<% String destination = request.getParameter("destination");%>
<% String source = request.getParameter("source"); /* out.print(source); */%>
<% String date = request.getParameter("date");%>
<%session.setAttribute("date", request.getParameter("date"));%>
<% String drivers = request.getParameter("drivers");%>
<% String radioValues = request.getParameter("radioValues");%>
<%String radioValues1 = request.getParameter("fare");%>
<%String pickuptime = request.getParameter("pickuptime");%>


<input type="hidden" id="source" name = "source" value="${source}"> 
<input type="hidden" id="destination" name = "destination" value="${destination}">
<input type="hidden" id="radioValues" name = "radioValues" value="${radioValues}"> 
<input type="hidden" id="pickuptime" name = "pickuptime" value="${pickuptime}"> 
<input type="hidden" id="fare" name = "fare" value="${fare}">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 
	

<table>
 

   <tr>
    <th>Driver Name</th>
    <th>Language</th>
    <th>Rate</th>
   <th>Fare</th>
    <th>Select </th>
  </tr>
  
  
  <c:forEach begin="0"  end="${fn:length(fare) - 1}" var="driverdetails" varStatus="status">
   <tr>
      <td><c:out value="${drivers[driverdetails].name}"/></td>
           <td><c:out value="${drivers[driverdetails].language}"/></td>
            <td><c:out value="${drivers[driverdetails].rate}"/></td>
   
      <td><c:out value="${fare[driverdetails]}"/></td>
       <td>
       
         
           <input type="radio" value="${drivers[driverdetails].name}" onClick="alertRadioValueJS();" id='radioValues' name="radioValues" required>
         
          <input type="radio" value="${fare[driverdetails]}" id='fare' name="fare" ><label for=radioValues1></label>

     </td>
   </tr>
</c:forEach>
  
  
  
 </table>
 
 
 

 
 <br>
 <br>
 <br>
 <div class="container	">
 <div class="text-center">
 
 	  <button type="submit" class="btn btn-secondary btn-lg active" > Submit
</button> 
  </div>
  
  </div>
  <script>
  


  function alertRadioValueJS() {
   
    var radios = document.getElementsByName('radioValues')
    var radios1 = document.getElementsByName('fare')
    console.log(radios);
    var radioValues = '';
   
    for (var i = 0, length = radios.length; i < length; i++) {
      if (radios[i].checked) {
    	  console.log(i);
    	  
    	  fare = radios1[i].value;
    	  
    	  console.log(fare);
    	   document.getElementById("fare").value = fare;
    	    console.log(fare);
        radioValues = radios[i].value;
   
        // only one radio can be logically checked, don't check the rest
        break;
      }
    }
    document.getElementById("radioValues").value = radioValues;
    console.log(radioValues);
   }
  </script>
  </form:form>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>

