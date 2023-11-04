<%@ page import="sql.InitDatabase"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <title>Sign-in form</title>
    <script src="sign_01.js"></script>
    <style>
        #signin-form-container {
            height : 350px;
            width : 400px;
            margin : auto;
            border : 1px solid white;
            filter: alpha(opacity=60);
            text-align:center;
            margin-top: 200px;
            border-radius: 10px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            color:white;
            background-color:rgb(24, 23, 23);
        }
        body{
            background-color: black;
        }
        button{
            height: 35px;
            width:100px;
            background-color: transparent;
            color: white;
            border-radius: 20px;
            border:2px solid white;
            transition-property: width;
            transition-duration: 1s;
        }
        button:hover{
            border-color: rgb(56, 17, 92);
            width:120px ;
        }
        input{
			background-color: transparent;
            color:white;
            border-radius: 8px;
            height:30px;
		}
		input:focus{
			border: 3q solid white;
		}
    </style>
</head>
<body>
</form>
<div id="signin-form-container">
    <form action="login.jsp" method="post">
        <h1>Sign In</h1>
        <label for="signinname">Username:</label><br>
        <input type="text" name="uname" placeholder="Username" required><br><br>

        <label for="signinpwd">Password:</label><br>
        <input type="password" name="pwd" placeholder="Password" required><br><br>
        <button style="font-family: Verdana, Geneva, Tahoma, sans-serif;" type="submit">Login</button>
        <%
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		try{
		Connection con=InitDatabase.Getconnector();
		Statement stmt=con.createStatement();
		ResultSet pass=stmt.executeQuery("select password from users where username='"+uname+"'");
		while (pass.next()){
			String password=pass.getString("password");
			if(password.equals(pwd)){
				response.sendRedirect("userPage.jsp");
	            HttpSession user=request.getSession();
	            user.setAttribute("user", uname);
				response.sendRedirect("userPage.jsp");
			}
		else{%>
			<h3>Password does not match</h3>		
		<%} }}catch(Exception e){
			System.out.println(e);
		}%>
        <p>Don't have an account :<a href="signup.html">Create an account</a></p>
    </form>
</div>

</body>

</html>