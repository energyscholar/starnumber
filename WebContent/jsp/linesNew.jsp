<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<html>
 
<head>
  <title>New Line</title>
  <style>
    .error {
    	color: red;
    }
  </style>  
</head>
 
<body>
	<h1>New Line</h1>
 
	<form:form method="post">
 
 
		LineName <br />
		<form:input path="line_name"/><br /><br />
 
		<input type="submit" value="Submit">
 
	</form:form>
</body>
</html>