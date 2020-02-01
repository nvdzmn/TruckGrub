import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class QueryDatabase {
	
	private static QueryDatabase instance;
	private Connection conn = null;
	private String url = "jdbc:mysql://localhost:3306/TruckFindr?user=root&password=root";
	
	public QueryDatabase() {
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection(url);
			
		} catch (SQLException e) { 
	    	System.out.println(e.getMessage());
	    } catch(ClassNotFoundException cnfe) {
	    	System.out.println(cnfe.getMessage());
		}
	}
	
	public static QueryDatabase getInstance() throws SQLException {
		if (instance == null) {
			instance = new QueryDatabase();
		} else if (instance.getConnection().isClosed()) {
			instance = new QueryDatabase();
		}
		return instance;
	}

	public Connection getConnection() {
		return conn;
	}
	
	public int getUserID(String username) {
		
		int resultID = 0;
		java.sql.PreparedStatement ps = null;
		try {
			//Gets table of usernames that match a certain ID
			ps = conn.prepareStatement("SELECT userID FROM Users WHERE username=?;");
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next())
				resultID = rs.getInt("userID");
			else
				System.out.println("Could not find username");
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
			
		return resultID;
	}
	
	public String getUserName(int id)
	{
		String username = "";
		java.sql.PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("SELECT username FROM Users WHERE userID=?;");
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				username = rs.getString("username");
			else
				System.out.println("Could not find ID");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			 
		}
			
		return username;
	}
	
	public boolean validateLogin(String username, String password) {	
		int doesUserExist = getUserID(username);
		boolean valid = false;
		if (doesUserExist == 0) {
			return false;
		}
		else {
			
			try {
				java.sql.PreparedStatement ps = this.conn.prepareStatement("SELECT t.username, t.password FROM Users t WHERE username= ? AND password= ?");
				ps.setString(1,username);
				ps.setString(2, password);
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()){
					System.out.println("rs is " + rs.getString("username") + " " + rs.getString("password"));
					valid = true;
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				valid = false;
				e.printStackTrace();
			}
				
			
		}
		return valid;
	}
	
	public boolean addUser(String username, String password) {
		int doesUserExist = getUserID(username);
		boolean valid = false;
		
		if (doesUserExist > 0) {  //If user exists
			System.out.println("User already exists");
			return false; 
		}
		else {
			try {
				System.out.println("about to insert");
				java.sql.PreparedStatement ps = this.conn.prepareStatement("INSERT INTO Users (username,password) VALUES(?,?);");
				ps.setString(1,username);
				ps.setString(2,password);
				int result = ps.executeUpdate();
				
				if (result == 1) {
					valid = true;
				}
				
		    } catch (SQLException e) {
		    	System.out.println("sql exception " + e.getMessage());
		    	valid = false;
		    	
		    }

		}
		return valid;

	}
	
	public boolean addTruck(String username, String name, String menu, String bevs, String hours, String address, float latitude, float longitude) {
		int user = getUserID(username);
		
		if (user == 0) {  //If user exists
			System.out.println("User doesn't exist, could not update TruckName in DB");
			return false; 
		}
		else {
			try {
				System.out.println("about to insert");
				java.sql.PreparedStatement ps = this.conn.prepareStatement("INSERT INTO TruckInfo "
						+ "(truckID, truckName, foodMenu, beverages, hours, address, latitude, longitude, rating) VALUES(?,?,?,?,?,?,?,?,?);");
				ps.setInt(1,user);
				ps.setString(2,name);
				ps.setString(3,menu);
				ps.setString(4,bevs);
				ps.setString(5,hours);
				ps.setString(6,address);
				ps.setFloat(7,latitude);
				ps.setFloat(8,longitude);
				ps.setFloat(9, (float) -1.0);
				int result = ps.executeUpdate();
				
				if (result == 1) {
					System.out.println("Truck added to DB!");
					return true;
				}
				else
					return false;
				
		    } catch (SQLException e) {
		    	System.out.println("sql exception " + e.getMessage());	    	
		    }

		}
		return true;
	}
	
	public void updateRating(float newRating , String username) {
		int userID = getUserID(username);
		
		if(userID == 0) {
			System.out.println("User doesn't exist, could not update rating in DB");
			return; 
		}
		else {
			try {
				System.out.println("Updating rating for " + username);
				java.sql.PreparedStatement ps = this.conn.prepareStatement("UPDATE TruckInfo SET rating=? WHERE truckID=?");
				ps.setFloat(1,newRating);
				ps.setInt(2, userID);
				int result = ps.executeUpdate();
				
				if(result == 1) {
					System.out.println("Rating update executed!");
					return;
				}
			} catch (SQLException e) {
		    	System.out.println("SQL exception in QueryDatabase.updateRating() : " + e.getMessage());	    	
		    }
		}
	}
	
	public void updateLocation(float lat, float longi, String username) {
		int userID = getUserID(username);
		
		if(userID == 0) {
			System.out.println("User doesn't exist, could not update location in DB");
			return; 
		}
		else {
			try {
				System.out.println("Updating location for " + username);
				java.sql.PreparedStatement ps = this.conn.prepareStatement("UPDATE TruckInfo SET latitude=?, longitude=? WHERE truckID=?");
				ps.setFloat(1,lat);
				ps.setFloat(2,longi);
				ps.setInt(3, userID);
				int result = ps.executeUpdate();
				
				if(result == 1) {
					System.out.println("Location update executed!");
					return;
				}
			} catch (SQLException e) {
		    	System.out.println("SQL exception in QueryDatabase.updateLocation() : " + e.getMessage());	    	
		    }
		}
	}
	
	public void updateHours(String hours, String username) {
		int userID = getUserID(username);
		
		if(userID == 0) {
			System.out.println("User doesn't exist, could not update rating in DB");
			return; 
		}
		else {
			try {
				System.out.println("Updating hours for " + username);
				java.sql.PreparedStatement ps = this.conn.prepareStatement("UPDATE TruckInfo SET hours=? WHERE truckID=?");
				ps.setString(1,hours);
				ps.setInt(2, userID);
				int result = ps.executeUpdate();
				
				if(result == 1) {
					System.out.println("Hours update executed!");
					return;
				}
			} catch (SQLException e) {
		    	System.out.println("SQL exception in QueryDatabase.updateHours() : " + e.getMessage());	    	
		    }
		}
	}
	public static void main(String[] args) {
		QueryDatabase qb = new QueryDatabase();
		System.out.println("INSERTING 5 FOOD TRUCKS");

		//Adds 5 users to the database
		qb.addUser("Andrew", "password1");
		qb.addUser("Mari", "password2");
		qb.addUser("Madhuri", "password3");

		//Adds 5 food trucks to the database
		qb.addTruck("Andrew", "DrewCrew", "hotdog-3.75-burger-4.00-beef-2.00", "water-2.75-soda-3.75", "7:00am-8:00pm-7:00am-8:00pm-7:00am-8:00pm-7:00am-8:00pm-7:00am-8:00pm-7:00am-8:00pm-7:00am-8:00pm", "3131 McClintock Ave.", (float)123.712, (float) 289.479);
		qb.addTruck("Mari", "ILOVETACOS", "chilli-6.99-fries-1.55-chicken-3.50", "water-2.75-soda-3.75-lemonade-2.50", "6:00am-9:30pm-6:00am-9:30pm-6:00am-9:30pm-6:00am-9:30pm-6:00am-9:30pm-6:00am-9:30pm-6:00am-9:30pm", "1743 Vermont Ave.", (float)223.724, (float) 276.849);
		qb.addTruck("Madhuri", "CaleFreak", "lollipop-0.99-onionrings-5.00-beef-2.00-pork-3.69", "water-2.00-icedtea-3.75-coke-12.00-beer-3.50", "5:30am-8:30pm", "1902 Exposition Blvd.", (float)234.234, (float) 123.123);
		qb.updateRating((float)5.0, "mari");
		}
}
