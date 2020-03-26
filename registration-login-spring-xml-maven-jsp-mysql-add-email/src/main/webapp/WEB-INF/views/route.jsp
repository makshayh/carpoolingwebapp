 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page language="java" session="true"%>

 <c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
 

<%-- <% response.sendRedirect("driver/list"); %> --%>


 <!DOCTYPE html>
<html lang="en">
<head>

<style>
      #right-panel {
 
        line-height: 30px;
        padding-left: 10px;
      }

 h2 {
  font-size: 20px;
}

 #fare {
  font-size: 30px;
}
   
      #map {
      
      margin-top :5%;
      
      float: left;
      padding-bottom: 30%;
        height: 60%;
        width: 50%;
        
      }
      #right-panel {
        float: right;
        width: 48%;
        padding-right: 20%;
      }
           #output {
        float: right;
        width: 72%;

     
      }
      
    </style>

    <title>Route Detailst</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

  
</head>

<body>

<div class="card" style="width: 150rem;">

<c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h5>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h5>

</c:if>
  <div class="card-body">
  
<!-- <div class="card mb-3"> -->
<div id="right-panel"></div>
<div id="map"></div>
<div class="container" id="right-panel">
    <form method="POST" action="${contextPath}/booking" modelAttribute="booking" class="form-signin">
        <h2 class="form-heading">Select Route</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input id="source" name="source" type="text" class="form-control" placeholder="source"
                   value="Bangalore"/>
            <input id="destination" name="destination" type="destination" class="form-control" placeholder="Destination" onfocusout="demo()"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 
            <input type="hidden" id="fare" name ="fare" value=""> 
           <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
           
     

             <input type="date" id="date"  onkeydown="return false"  required name="date" placeholder="date"  class="form-control datepicker" >

 			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
 
</div>
</form>
</div>
</div>
<div id="output">
</div>
 
<script>
    
    function activatePlaceSearch(){
	      var cityBounds = new google.maps.LatLngBounds(
	      new google.maps.LatLng(25.341233, 68.289986),
	      new google.maps.LatLng(25.450715, 68.428345)
	      );

	          var options = {
	                       types: ['(cities)'],
	                       componentRestrictions: {country: 'in'}
	           };
	         var input = document.getElementById('destination');
	         var search = new google.maps.places.Autocomplete(input, options);
	      }
    
    
    </script>
    
  
	   
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCD-yOrwFqzEOo0U1Fk4BpQvFYDywP-jz0&libraries=places&region=in&callback=activatePlaceSearch">
    </script>
    <script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
    
    <script type="text/javascript">
      var today = new Date().toISOString().split('T')[0];
      document.getElementById('date').setAttribute('min', today)
 
   </script>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
 
 
 
 
 

 