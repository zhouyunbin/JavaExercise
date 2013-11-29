<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	request.getSession().setAttribute("user", null);
	//request.getSession().setAttribute("student", null);
	//response.sendRedirect("/");
%>
<script>
window.location.href="/";
</script>