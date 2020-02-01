<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet,java.sql.SQLException,java.sql.Statement, 
java.util.List, java.util.ArrayList, java.util.StringTokenizer"%>
<!DOCTYPE html>
<%

/* request.getSession().setAttribute("sunday", sunday);
request.getSession().setAttribute("monday", monday);
request.getSession().setAttribute("tuesday", tuesday);
request.getSession().setAttribute("wednesday", wednesday);
request.getSession().setAttribute("thursday", thursday);
request.getSession().setAttribute("friday", friday);
request.getSession().setAttribute("saturday", saturday);
request.getSession().setAttribute("truckname", truckname);
request.getSession().setAttribute("address", address);
request.getSession().setAttribute("lat", latitude);
request.getSession().setAttribute("lon", longitude);
request.getSession().setAttribute("rating", rating);
request.getSession().setAttribute("foodItemArr", foodItems);
request.getSession().setAttribute("bevItemArr", bevItems);
request.getSession().setAttribute("foodPriceArr", foodPrices);
request.getSession().setAttribute("bevPriceArr", bevPrices); */
String truckname = (String)session.getAttribute("truckname");
String address = (String)session.getAttribute("address");
Float latitude = (Float)session.getAttribute("lat");
Float longitude = (Float)session.getAttribute("lon");
Float rating = (Float)session.getAttribute("rating");
String monday = (String)session.getAttribute("monday");
String tuesday = (String)session.getAttribute("tuesday");
String wednesday = (String)session.getAttribute("wednesday");
String thursday = (String)session.getAttribute("thursday");
String friday = (String)session.getAttribute("friday");
String sunday = (String)session.getAttribute("sunday");
String saturday = (String)session.getAttribute("saturday");
/* @SuppressWarnings("unchecked")
List<String> foodItems = (ArrayList<String>)session.getAttribute("foodItemArr"); */
@SuppressWarnings("unchecked")
List<String> foodPrices = (ArrayList<String>)session.getAttribute("foodPriceArr");
@SuppressWarnings("unchecked")

List<String> bevItems = (ArrayList<String>)session.getAttribute("bevItemArr");
@SuppressWarnings("unchecked")
List<String> bevPrices = (ArrayList<String>)session.getAttribute("bevPriceArr");

//List<String> bevItems = new ArrayList<>();
//List<String> hrs = new ArrayList<>();

%>
<html>
<head>
<meta charset="UTF-8">
<title>Edit My Truck Information</title>
</head>
	<body>
		<p>Your current truck info is: </p>
		<p>Name:<%=truckname %></p>
		<p>Address:<%=address%></p>
		<p>Hours:</p>
		<p>Sunday: <%=sunday%> Monday:<%=monday%> Tuesday:<%=tuesday %> Wednesday:<%=wednesday %> Thursday:<%=thursday%> Friday:<%=friday %> Saturday:<%=saturday %></p>
		<%
		@SuppressWarnings("unchecked")
		List<String> foodItems = (ArrayList<String>)session.getAttribute("foodItemArr");
		if(foodItems==null){
		System.out.println("LIST IS NULL");
			
		}
		else
		{
			System.out.println("food items " + foodItems.size());
		}
			for (int i = 0; i < foodItems.size(); i++)
			{
				 if (i%2==0){
		%>
			<p>Food Item: <%=foodItems.get(i)%> Price: <%=foodPrices.get(i/2)%></p>
		<%
				 }
			}
			for (int i = 0; i < bevItems.size(); i++)
			{
				if (i%2 == 0)
				{
		
		%>
			<p>Beverage Item: <%=bevItems.get(i)%> Price: <%=bevPrices.get(i/2)%></p>
			
		<% 
		
				}
			} 
		%>
		  <button type="submit" id = "getinfo" name = "getinfo">Submit Info!</button> 
		
			<%-- <%
				System.out.println("HERE");
				if (request.getSession(false)== null)
				{
					System.out.println("Here");
				}
				else
				{
					String truckname = "";
					String foodMenu = "";
					String beverages = "";
					String hours = "";
					String address = "";
					Float latitude = .01f;
					Float longitude = .01f;
					Float rating = .01f;
					String monday = "";
					String tuesday = "";
					String wednesday = "";
					String thursday = "";
					String friday = "";
					String sunday = "";
					String saturday = "";
					List<String> foodItems = new ArrayList<>();
					List<String> bevItems = new ArrayList<>();
					List<String> hrs = new ArrayList<>();
					QueryDatabase db = (QueryDatabase) request.getAttribute("db");
					if (db.getUserID(request.getParameter("username")) > 0)
					{
						Connection conn = db.getConnection();
						java.sql.PreparedStatement ps = conn.prepareStatement("SELECT * FROM TruckInfo");
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
						truckname = rs.getString("truckName");
						foodMenu = rs.getString("foodMenu");
						beverages = rs.getString("beverages");
						hours = rs.getString("hours");
						}
						
						foodItems = new ArrayList<>();
						StringTokenizer st = new StringTokenizer(foodMenu);
					     while (st.hasMoreTokens()) {
					         foodItems.add(st.nextToken());
					     }
					     
						
						bevItems = new ArrayList<>();
						StringTokenizer st2 = new StringTokenizer(beverages);
					     while (st2.hasMoreTokens()) {
					         bevItems.add(st2.nextToken());
					     }
					     
						
						hrs = new ArrayList<>();
						StringTokenizer st3 = new StringTokenizer(beverages);
					     while (st3.hasMoreTokens()) {
					         hrs.add(st3.nextToken());
					     }
					    sunday = hrs.get(0);
					    monday = hrs.get(1);
					    tuesday = hrs.get(2);
					    wednesday = hrs.get(3);
					    thursday = hrs.get(4);
					    friday = hrs.get(5);
					    saturday = hrs.get(6);
						address = rs.getString("address");
						latitude = rs.getFloat("latitude");
						longitude = rs.getFloat("longitude");
						rating = rs.getFloat("rating");
					
						
					}
					
				}
				
			%> --%>
				<%-- <p>Your current truck information: </p>
				<p>Name: <%=truckname%> </p>
				<p>Address: <%=address %></p>
				<p>Latitudes: <%=latitude %></p>
				<p>Longitude: <%=longitude %></p>
				<p>Rating: <%=rating %></p>
				<p>Hours:</p>
				<p>Sunday: <%=sunday%> </p>
				<p>Monday: <%=monday%> </p>
				<p>Tuesday: <%=tuesday%> </p>
				<p>Wednesday: <%=wednesday%> </p>
				<p>Thursday: <%=thursday%> </p>
				<p>Friday: <%=friday%> </p>
				<p>Saturday: <%=saturday%> </p>
				<p>Food Items:</p> --%>
		 
		<%-- 	<%
			
				for(int i = 0; i < foodItems.size()/2; i++)
				{
			%>
					<p>Item:<%=foodItems.get(i)%> Price: <%=foodItems.get(i+1)%></p>
			<%
					
				}
			
			%>
				<p>Beverage Items:</p>
				
				
			<% 
				for (int i = 0; i < bevItems.size()/2; i++)
				{
			%>
				  <p>Item:<%=bevItems.get(i)%> Price: <%=bevItems.get(i+1)%></p>
				  
			<% 
				}
			  
			}
			
			
			%> --%>
		
	
	
	</body>
</html>