package db;

import java.sql.*;

public class JDBCExample {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String connectionURL = "jdbc:postgresql://localhost:5432/postgres";
		Connection con = null;
		try {
			 // Load the Driver class.
			 Class.forName("org.postgresql.Driver");
			//Create the connection using the static getConnection method
			 con = DriverManager.getConnection (connectionURL,"java","SNpassword");
			//Create a Statement class to execute the SQL statement
			 Statement stmt = con.createStatement();
			 //Execute the SQL statement and get the results in a Resultset
			 ResultSet rs = stmt.executeQuery("select * from starnumber.destination_type;");
			// Iterate through the ResultSet, displaying two values
			// for each row using the getString method
			 
			 while (rs.next())
				 System.out.println("Name= " + rs.getString("destination_type_name") );
			 
			
		}
		catch (SQLException e) {
			System.out.println("database call SQL blew up");
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();				
			}
			catch (Exception e) {
				e.printStackTrace();
				
			}
		}
	}
}
