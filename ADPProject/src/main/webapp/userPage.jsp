<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sql.InitDatabase"%>
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% Connection con=InitDatabase.Getconnector(); %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<div class="menu">
			<h3>Code Management</h3>
			<form method="post" action="Search">
				<input type="text" placeholder="search">
			</form>
		</div>
		<center style="height: 5%;">
		<input style="width: 20%;height: 100%;" type="button" value="New Repository">
		</center>
		<section class="user-section">
		<%
			if (session.getAttribute("user")==null){
				response.sendRedirect("login.jsp");
			}
			ResultSet result=null;
			Statement statement=con.createStatement();
			result=statement.executeQuery("Select repoName from repos where username='"+session.getAttribute("user")+"'");
		%>
			<div>
				<h2>Your repositories</h2>
				<%
					if (!result.isBeforeFirst()){
				%>
					<h3>You do not have any repositories</h3>
				<%}%>
				<%
					while (result.next()){
				%>
				<a href="repo.jsp"><%=result.getString("repoName")%></a><br>
				<%}%>
			</div>
			<div>
				<h2>Starred repositories</h2>
			</div>
		</section>
	</body>
</html>