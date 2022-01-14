package idklol;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcManager {
  private String jdbcUrl = "";
  private String jdbcUserName = "";
  private String jdbcPassword = "";

	public JdbcManager() 
	{
		jdbcUrl = "jdbc:mysql://localhost:3306/youtunes?useSSL=false";
		jdbcUserName = "youtunes_user";
		jdbcPassword = "MySQL5IsGreat!";
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (ClassNotFoundException ex)
		{
			System.out.println(ex.toString());
		}
	}
	
//	try to open connection
  public Connection getConn() {
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
      }
    catch (SQLException e) {
      System.out.println("Could not connect to DB: " + e.getMessage());
      }
    return conn;
    }
  
// close connection if it's open
  public void closeConn(Connection conn) {
    if (conn != null) {
      try { conn.close(); }
      catch (SQLException e) { }
      }
    }
  
}
