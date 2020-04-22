/**
 * Make sure the Postgresql JDBC driver is in your classpath.
 * You can download the JDBC 4 driver from here if required.
 * https://jdbc.postgresql.org/download.html
 *
 * take care of the variables usernamestring and passwordstring to use 
 * appropriate database credentials before you compile !
 *
**/

import java.sql.* ;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;


//Alisa Gagina
//260770497
class PatientObservations
{
    public static void main ( String [ ] args ) throws SQLException
    {
	
	String input = "";
    int sqlCode=0;      // Variable to hold SQLCODE
    String sqlState="00000";  // Variable to hold SQLSTATE
    String msg ="";

	if ( args.length == 0 ){
	    System.out.println("Need a personnel id");
	    System.exit(1);
	}
	else {
	    input += args[0];
	}
	
	
	//connection stuff
	// Register the driver.  You must register the driver before you can use it.
    try {
    DriverManager.registerDriver ( new org.postgresql.Driver() ) ;
    } catch (Exception cnfe){
    System.out.println("Class not found");
    }
	// This is the url you must use for Postgresql.
	//Note: This url may not valid now !
	String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
	Connection con = DriverManager.getConnection (url,"yourname", "passwrd") ;
	Statement statement = con.createStatement ( ) ;
	
	

	// Log in
	try {
		String querySQL = "select count(1) from healthcarep where hid="+input;
		System.out.println (querySQL) ;
		java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
		int res =-12;
		 while ( rs.next ( ) )
	    {res = rs.getInt(1);
	    }
		 
	    if (res==0) {
	    	System.out.println("Such personnel id doesn't exist");
	    	statement.close ( ) ;
	    	con.close ( ) ;
	    	System.exit(1);
	    }else { //res should be 1
	    	System.out.println ("Success logging in!");
	    	System.out.println ("To enter a patient observation, enter 1");
	    	System.out.println ("To exit, enter 2");
	    }
	}catch (SQLException e)
            {
                sqlCode = e.getErrorCode(); // Get SQLCODE
                sqlState = e.getSQLState(); // Get SQLSTATE
                
                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println("Error logging in hospital personnel");
                System.exit(1);
            }

	// Menu
	int x;
	Scanner scan = new Scanner(System.in);
	x= scan.nextInt();
	while (x==1) {
		try {
			//try to enter observation
			System.out.println ("Please enter patient number");
			int pid = scan.nextInt();
			System.out.println ("Please enter observation number");
			int num = scan.nextInt();
			System.out.println ("Please enter date as YYYY-MM-DD");
			scan.nextLine();
			String day = scan.nextLine();
			System.out.println ("Please enter hour as hh:mm:ss");
			String hour = scan.nextLine();
			System.out.println ("Please enter the observation as one paragraph");
			String note = scan.nextLine();
			
			 String insertSQL = "INSERT INTO observation VALUES ("+num+","+pid+","+input+","+
				 			"'"+day+"' , '" + hour + "', '"+note+" ' )";
			 System.out.println ( insertSQL ) ;
			 statement.executeUpdate ( insertSQL ) ;
			 System.out.println ( "Successful entry!" ) ;
		}
		 catch (SQLException e)
		{
		    sqlCode = e.getErrorCode(); // Get SQLCODE
		    sqlState = e.getSQLState(); // Get SQLSTATE
		    msg = e.getMessage();
		    
		    // Your code to handle errors comes here;
		    // something more meaningful than a print would be good
		    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		    System.out.println("Problem! " + msg +"\n Try again:( \n");
		}
		System.out.println ("To enter a patient observation, enter 1");
    	System.out.println ("To exit, enter 2");
    	x= scan.nextInt();
	}
	scan.close();
	
	// Finally but importantly close the statement and connection
	statement.close ( ) ;
	con.close ( ) ;
    }
}