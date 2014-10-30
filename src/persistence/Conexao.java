
package persistence;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class Conexao {

	public Connection getConnection(){
		
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdeventos", "root", "");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	
		catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
}