package sql;

import java.sql.Connection;
import java.sql.DriverManager;

public class InitDatabase {
	public static Connection Getconnector(){
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","SRnair1234");
			return con;
		}catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
