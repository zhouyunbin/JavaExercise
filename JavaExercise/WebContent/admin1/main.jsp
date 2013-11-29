<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%
	User u=(User)request.getSession().getAttribute("user");
%>
<div style="margin:30px">
<table style="font-size:20px" class='brand'>
<tr>
<td>当前用户:</td><td><%=u.getUsername() %></td></tr>
<tr><td>邮箱:</td><td><%=u.getEmail()%></td></tr>
<tr><td>部门:</td><td><%=u.getDepartment() %></td>
</tr>
</table>
</div>