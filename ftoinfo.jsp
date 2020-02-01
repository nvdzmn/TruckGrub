<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>More Info</title>
</head>
	<body>
	<p>All fields required*</p>
		<div id = "moreinfo div">
		  	<form action = "getInfo" method = "GET">
	            <table style="width: 22%" id = "moreinfotable">
	            	<tr>
	            		<td>Username</td>
	            		<td><input type="text" name="username"></td>
	            	</tr>
	                <tr>
	                    <td>Food Truck Name</td>
	                    <td>Address OR</td>
	                    
	                    <td>Latitude</td>
	                    <td>Longitude</td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="food truck name" /></td>
	                    <td><input type="text" name="food truck address" /></td>
	                </tr>
	                <tr>
	                	 <td>Hours</td>
	                </tr>
	                <tr>
	                    <td>Sunday<input type = "text" id = "Sunday" name = "Sunday" placeholder = "9:00am-5:00pm"><input></td>
	                    <td>Monday<input type = "text" id = "Monday" name = "Monday" placeholder = "9:00am-5:00pm"><input></td>
	                    <td>Tuesday<input type = "text" id = "Tuesday" name = "Tuesday" placeholder = "9:00am-5:00pm"><input></td>
	                    <td>Wednesday<input type = "text" id = "Wednesday" name = "Wednesday" placeholder = "9:00am-5:00pm"><input></td>
	                    <td>Thursday<input type = "text" id = "Thursday" name = "Thursday" placeholder = "9:00am-5:00pm"><input></td>
	                    <td>Friday<input type = "text" id = "Friday" name = "Friday" placeholder = "9:00am-5:00pm"><input></td>
	                    <td>Saturday<input type = "text" id = "Saturday" name = "Saturday" placeholder = "9:00am-5:00pm"><input></td> 
	                </tr>
	                <tr>
	                	 <td>Menu Items: Food</td>
	                	 <td>Menu Items: Beverage</td>
	                	 
	                </tr>
	                <tr>
	                	 <td>Click the blue + to add a food menu item.</td>
	                	 <td><button id = "plus button" onClick = "return addMenuItem();"> + </button></td>
	                	 <td>Click the red + to add a beverage menu item</td>
	                	 <td><button id = "bplus button" onClick = "return addBMenuItem();"> + </button></td>
	                </tr>
	                <tr>
	                	 <td>Food Item (Item name, price)</td>
	                	 <td></td>
	                	 <td>Beverage Item (Item name, price)</td>
	                	 <td></td>
	                </tr>
	                <tr>
	                	<td>Food Item Name:<input type = "text" id="fooditem" name = "fooditem" placeholder = "Fish Tacos"><input></td>
	                	<td>Price: $<input type = "number" id = "price" name = "foodprice" placeholder = "6.99"><input></td> 
	                	<td>Beverage Item Name:<input type = "text" id="bevitem" name = "bevitem"  placeholder = "Water"><input></td>
	                	<td>Price: $<input type = "number" id = "bprice" name = "bevprice" placeholder = "1.99"><input></td> 
	                </tr>
				</table>
				
	             <button type="submit" id = "registersubmission" name = "registersubmission">Submit Info!</button> 
	          
        	</form>
        	
	  	</div>
	  <div><%=session.getAttribute("error")%></div>
	<script>
		function addMenuItem()
		{
			console.log("made it here in addMenuItem");
			var table = document.getElementById("moreinfotable");
			// var table = document.getElementById("moreinfotable");
			
		
			var tablelength = document.getElementById("moreinfotable").rows.length;
			console.log("Status of table is " + tablelength);
			var lastRow = tablelength - 1;
		
	
			var incompleteRow = document.getElementById("moreinfotable").rows[7];
			console.log(incompleteRow.cells.length);
			var insertCellHere = incompleteRow.cells.length;
			console.log("Here and " + insertCellHere);
			console.log((incompleteRow.cells[0].innerHTML == "" && incompleteRow.cells[1].innerHTML == ""));
		
			var x = table.rows.length;
			for(i = 7; i < x; i++)
			{
				if (insertCellHere == 4 && (incompleteRow.cells[0].innerHTML == "a" && incompleteRow.cells[1].innerHTML == "a"))
				{
					console.log("potential to add a row " + i);
				}
			}
			
			
			console.log("8 to " + x);
			for(i = 7; i < x; i++)
			{
				if (insertCellHere == 4 && (incompleteRow.cells[0].innerHTML == "" && incompleteRow.cells[1].innerHTML == ""))
				{
						console.log("potential to fill in row " + i);
						
						console.log("here filling in the beginning of the row ");
						
						incompleteRow.cells[0].innerHTML = "Food Item Name:<input type = \"text\" id = \"fooditem\" name = \"fooditem\" placeholder = \"Fish Tacos\"><input>";
						incompleteRow.cells[1].innerHTML = "Price: $<input type = \"number\" id = \"price\" name = \"foodprice\" placeholder = \"6.99\"><input>";
						break;
				}
				else//we are here and the first two cells are full
				{
					console.log("HERERERERERER");
					var row = table.insertRow(lastRow + 1);
					var dataFI = row.insertCell(0);
					var dataPr = row.insertCell(1);
					var data2 = row.insertCell(2);
					var data3 = row.insertCell(3);
					dataFI.innerHTML = "Food Item Name:<input type = \"text\" id = \"fooditem\" name = \"fooditem\" placeholder = \"Fish Tacos\"><input>";
					dataPr.innerHTML = "Price: $<input type = \"number\" id = \"price\" name = \"foodprice\" placeholder = \"6.99\"><input>";
					break;
				}
				
			}
			return false; 
			/* var table = document.getElementById("moreinfotable");
			var row = table.insertRow(8);
			var dataFI = row.insertCell(0);
			var dataPr = row.insertCell(1);
			dataFI.innerHTML = "Food Item Name:<input type = \"text\" id = \"fooditem\" placeholder = \"Fish Tacos\"><input>";
			dataPr.innerHTML = "Price: $<input type = \"number\" id = \"price\" placeholder = \"6.99\"><input>";
			console.log("hereaosrjoij");
			 */
			
			
			 /* document.getElementById("newrows").innerHTML += 
				"<td>Food Item Name:<input type = \"text\" id = \"fooditem\" placeholder = \"Fish Tacos\"><input></td>"
				+ "<td>Price: $<input type = \"number\" id = \"price\" placeholder = \"6.99\"><input></td>"
				; // + "</tr>";
			 */
			 
			 
		}
		function addBMenuItem()
		{
			var table = document.getElementById("moreinfotable");
			//ar x = document.getElementById("myTable").rows.length;
			var tablelength = document.getElementById("moreinfotable").rows.length;
			console.log("Status of bev table is " + tablelength);
			var lastRow = tablelength - 1;
			
			var row1;
			for(i = 7; i < tablelength; i++)
			{
				console.log("checking");
				if (document.getElementById("moreinfotable").rows[i].cells[2]=="" && document.getElementById("moreinfotable").rows[i].cells[3] == "")
				{
					console.log("inside on " + i);
					row1 = i;
					break;
				}
				
				
			}
			console.log("the first aviaable row is " + i + " but instead I am insering here " + lastRow);
		
	
			var incompleteRow = document.getElementById("moreinfotable").rows[lastRow];
			
			var insertCellHere = incompleteRow.cells.length;
			console.log("made it here " + insertCellHere);
			if (insertCellHere == 4)
			{
				
				console.log("inside");
				var newRow = table.insertRow(lastRow + 1);
				console.log("here made a new row");
				var x = newRow.insertCell(0);
				var y = newRow.insertCell(1);
				var dataBitem = newRow.insertCell(2);
				dataBitem.innerHTML = "Beverage Item Name:<input type = \"text\" id = \"bevitem\" name = \"bevitem\" placeholder = \"Water\"><input>";
				var dataPr = newRow.insertCell(3);
				dataPr.innerHTML = "Price: $<input type = \"number\" id = \"bprice\" name = \"bevprice\" placeholder = \"1.99\"><input>";
				//break;
			}
			 if (insertCellHere == 2)
			{
				console.log("here adding to an exisitng row ");
				var dataBitem = incompleteRow.insertCell(2);
				dataBitem.innerHTML = "Beverage Item Name:<input type = \"text\" id = \"bevitem\" name = \"bevitem\" placeholder = \"Water\"><input>";
				var dataPr = incompleteRow.insertCell(3);
				dataPr.innerHTML = "Price: $<input type = \"number\" id = \"bprice\" name = \"bevprice\" placeholder = \"1.99\"><input>"; 
				
				
			} 
		 
				
			

			return false;
		}
	
	
	</script>
	
	
	
	</body>
</html>