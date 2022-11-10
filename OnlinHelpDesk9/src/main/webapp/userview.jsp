<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User view</title>
</head>
<body>
<h1>HEllo</h1>
	<c:forEach var="userdetails" items="${artdls}">
	
            <c:set var = "id" value = "${userdetails.id}"/>
			<c:set var = "adminID" value = "${userdetails.adminID}"/>
            <c:set var = "subject" value = "${userdetails.subject}"/>
 			<c:set var = "description" value = "${userdetails.description}"/>
 			
 			
 			
 			<h1>${userdetails.subject}</h1>
 			<p>${userdetails.description}</p>
                 
		</c:forEach>

</body>
</html>