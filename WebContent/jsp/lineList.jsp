<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
	<h1>Line List</h1>
 
	<c:forEach items="${lineList}" var="line">
		 ${line.line_id }: ${line.line_name}
		<br />
	</c:forEach>
<hr>
 
 </body>
</html>
