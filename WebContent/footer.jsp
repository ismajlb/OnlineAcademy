<%@page import="java.util.*"%>
<%@page language="java"%>

<html>
<head></head>
<title>jspelement jspattribute jspbody</title>
<body>

<jsp:element name="h1">
	<jsp:body>Demo on Element, Attribute and Body actions</jsp:body>
</jsp:element>

<jsp:element name="hr"/>
<jsp:element name="a">
<jsp:attribute name="href"> error.jsp </jsp:attribute>
<jsp:body>Click Here</jsp:body>
</jsp:element>	
	
</body>

</html>

<div class="row">
		<p class="text-center">Copyright &copy; LearnToday - <%= Calendar.getInstance().get(Calendar.YEAR) %></p>
</div>