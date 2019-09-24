<%@page import="rest_fb.User_Profile"%>
<%@page import="rest_fb.Get_User_Details"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<%
			String access_token=(String)request.getParameter("access_token");
			
			
			Get_User_Details obj_Get_User_Details=new Get_User_Details();
			
			//User_Profile obj_User_Profile=obj_Get_User_Details.Get_Profile_info(access_token);
			
			//obj_Get_User_Details.Get_Profile_info_v2(access_token);
			
			User_Profile obj_User_Profile=obj_Get_User_Details.Get_Profile_info_v2(access_token);
			
			%>
			
			Id : <%=obj_User_Profile.getId() %><br>
			Nombre : <%=obj_User_Profile.getName() %><br>
			Correo : <%=obj_User_Profile.getEmail() %><br>
			
			
			
</body>
</html>