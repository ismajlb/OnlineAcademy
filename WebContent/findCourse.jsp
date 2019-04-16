<%@ page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	session="true"
    	import="java.sql.*"
    	import="com.mysql.*"
    	import="java.io.*"
    	import="javax.servlet.*"
    	import="javax.servlet.http.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:scriptlet>
		String userName = (String)session.getAttribute("user");
		if(userName==null)
		{
			response.sendRedirect("login.jsp?requestUrl=findCourse");
		}
	</jsp:scriptlet>
	
	<jsp:useBean id="course" class="com.academy.model.Course" scope="request"></jsp:useBean>
	
	<jsp:scriptlet>
		String courseName = null;
		String facultyName = null;
		String courseDuration = null;
		int CourseFee = 0;

		courseName=request.getParameter("courseName");
		Connection conn = (Connection) application.getAttribute("connection");
		String sql = "select * from course where courseTitle="+ courseName + "'";
		
		Statement getData = conn.createStatement();
		ResultSet rs = getData.executeQuery(sql);
		
		if(rs.next())
		{
	</jsp:scriptlet>
			
			<jsp:setProperty property="courseName" name="course" value="<%= courseName %>"/>
			<jsp:setProperty property="facultName" name="course" value="<%= rs.getString(3) %>"/>
			<jsp:setProperty property="ImageUrl" name="course" value="<%= rs.getString(4) %>"/>
			<jsp:setProperty property="Fees" name="course" value="<%= rs.getInt(5) %>"/>
			<jsp:setProperty property="description" name="course" value="<%= rs.getString(6) %>"/>
			
			<jsp:scriptlet>
		}
			</jsp:scriptlet>
			
			<jsp:forward page="viewCourse.jsp"></jsp:forward>

</body>
</html>