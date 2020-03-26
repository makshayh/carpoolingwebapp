

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<%@ page language="java" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">



<title>Booking Confirmation</title>

<style>
#success_message {
	display: none;
}

body, html {
	height: 40%;
	align-content: center;
}

paypal-button-container{
height: auto;

}
</style>


</head>
<body><c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="details" method="POST" action="${contextPath}/submitconfirmation">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h3>${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h3>

    </c:if>
 
	<div class="card w-50"
		style="height: 500px; text-align: center; top: 5%; left: 50%; margin-top: 15%; transform: translate(-50%, -50%); color: white;">
		<div class="card-body"
			style="font-weight: 800; background-color: gray; ">
			<i>
				<h2>
					<STRONG>ThankYou for booking with us!!</STRONG>
				</h2>
			</i>
<br> <br> <br>
			<table>
			
			
			<tr >
				<h3>Username : -${pageContext.request.userPrincipal.name}</h3>
					
			</tr>
				<tr >
				<h3>Source : -<%=request.getParameter("source")%></h3>
					
			</tr>
			<tr>	


				
					<h3>
					&nbsp;Destination : -<%=request.getParameter("destination")%></h3>
				</tr>
				<tr>
				<tr><h3>
							Driver : -<%=request.getParameter("radioValues")%></h3>
				</tr>

				<tr>
					<h3>
							Total Fare : -<%=request.getParameter("fare")%></h3> </tr>
			</table>
			<br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		<div class="card-body"
			style="font-weight: 900; border: 1px solid grey " >
			<h3 style="color: black;"><br>
				For queries call us: 85749215145555 <br>
				or mail us:<br>demo@example.com
			</h3>
			<br><br><br>
		</div>
		
	<div class="card-body"
			style="font-weight: 800; border: 1px solid grey " >
			
				<div id="paypal-button-container"> </div>
			<br><br><br>
		</div>
	
	</div>
	
	
	


	



<body>
  <script
    src="https://www.paypal.com/sdk/js?client-id=AY8QNv8nXbmffWcaCOzcnrWTTtl48nbGj04VbfxObteCh9A6XmU2gJGI-CWW96wtlGSV26JtI4noWGC3"> // Required. Replace SB_CLIENT_ID with your sandbox client ID.
  </script>
  
    <script>
    paypal.Buttons().render('#paypal-button-container');
    // This function displays Smart Payment Buttons on your web page.
  </script>
	
</body>