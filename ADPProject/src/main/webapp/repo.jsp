<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sql.InitDatabase"%>
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="styles.css">
		<link rel="stylesheet" href="repo.css">
		<script src="updateText.js"></script>
	</head>
	<body>
		<div class="menu">
			<h3>Code Management</h3>
			<form method="post" action="search">
				<input type="text" placeholder="search">
			</form>
		</div>
		<section class="repo-menu">
			<form method="post" action="upload" enctype="multipart/form-data">
				<input style="height: 5%;" type="file" multiple>
				<input style="background-color: black;width: 20%;height: 5%;" type="submit" value="upload" name="upload">
			</form>
			<div class="info">
				<h3>Username</h3>
				<h4>repo name</h4>
			</div>
			<div class="main-container">
			<div class="container">
				<div class="element">
					<img class="icon" src="folder.jpg">
					item1
				</div>
				<div class="element">
					<img class="icon" src="file.jpg">
					item1
				</div>
				<div class="element">
					<img class="icon" src="file.jpg">
					item1
				</div>
				<div class="element">
					<img class="icon" src="file.jpg">
					item1
				</div>
			</div>
			</div>
			<div>
				<h3>About</h3>
				<textarea style="background-color: rgb(24,23,27); color: white;" id="about" cols="40%" rows="10" maxlength="500"></textarea>
				<input style="background-color: black;width: 50%;height: 20%; display: none;" id="update" type="button" value="Update">
			</div>
		</section>
	</body>
</html>