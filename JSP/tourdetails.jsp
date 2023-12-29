<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.demo.bean.*, com.demo.dao.DemoDao , java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css"> 

<title>Tour Details</title>
<style type="text/css">
body{
background-color: ; }
</style>
</head>

<body>

<%
if(request.getParameter("hiddenField") != null){
	%>
	<jsp:useBean id="obj" class="com.demo.bean.DemoBean" />
				<jsp:setProperty property="*" name="obj" />
	
	<%

	if(request.getParameter("submit").equals("Save")){	
		obj.setRegStatus(1);	
		int prog = DemoDao.insertTourDetails(obj) ;
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Update")){
		obj.setRegStatus(1);			
		int progress = DemoDao.updateTourDetails(obj);
		if(progress == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Delete")){
		obj.setRegStatus(0);		  
		int progress = DemoDao.updateTourDetails(obj);
		if(progress == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
}
ResultSet rsVehicle  = DemoDao.fetchVehicleMaster();
 %>	

	<form>
	<table class="table-striped">
		<tr>
			<td class="table-primary">
&nbsp &nbsp &nbsp 			Id
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Id" name="id" id="id"/>
			</td>
		</tr>
		<tr>
			<td class="table-success">
&nbsp &nbsp &nbsp			 Employee Id
			</td>
			<td>		
			<select class="btn btn-default dropdown-toggle" name="empId" id="empId">
				<option value="1">Onkar</option>
				<option value="2">Suyog</option>
				<option value="3">Sarvesh</option>
				<option value="4">Raj</option>
			</select>		
			</td>
		</tr>
		<tr>	
			<td class="table-warning">
&nbsp &nbsp &nbsp			From Date
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="From Date" name="fromDate" id="fromDate" />
			</td>
		</tr>		
		<tr>	
			<td class="table-danger">
&nbsp &nbsp &nbsp 			To Date
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="To Date" name="toDate" id="toDate"/>
			</td>
		</tr>
		<tr>	
			<td class="table-info">
&nbsp &nbsp &nbsp 			Along With
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Along With" name="alongWith" id="alongWith" />
			</td>
		</tr>
		<tr>	
			<td class="table-primary">
&nbsp &nbsp &nbsp 			Reason
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Reason" name="reason" id="reason"/>
			</td>
		</tr>
		<tr>	
			<td class="table-success">
&nbsp &nbsp &nbsp 			Vehicle Id
			</td>
			<td>				
				<select class="btn btn-default dropdown-toggle" name="vehicleId" id="vehicleId">
				<%
				while(rsVehicle.next()){
				%>
				<option value="<%=rsVehicle.getLong(1)%>"><%=rsVehicle.getString(2) +" "+ rsVehicle.getString(3) %></option>
				<%} %>
			    </select>		

			</td>
		</tr>
		<tr>	
			<td class="table-warning">
&nbsp &nbsp &nbsp			Bill Number
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Bill Number" name="billNo" id="billNo"/>
			</td>
		</tr>
		<tr>	
			<td class="table-danger">
&nbsp &nbsp &nbsp			 KM
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="KM" name="km" id="km"/>
			</td>
		</tr>
		<tr>	
			<td class="table-info">
&nbsp &nbsp &nbsp			 Registration By
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Registration By" name="regBy" id="regBy"/>
			</td>
		</tr>
		<tr>	
			<td class="table-primary">
&nbsp &nbsp &nbsp			 Registration Date Time 
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Registration Date Time" name="regDateTime" id="regDateTime" />
			</td>
		</tr>		
		<tr>	
			<td>
			 
			</td>
			<td>				
				<input class="form-control" type="hidden" name="hiddenField" value="hidden" />
			</td>
		</tr>

		<tr>
		<br>		
		<td colspan="2">
		
&nbsp &nbsp &nbsp		
			<input class="btn btn-secondary" title="Click to save!" type="submit" name="submit" value="Save"/>
			<input class="btn btn-secondary" title="Click to update!" type="submit" name="submit"  value="Update"/>
			<input class="btn btn-secondary" title="Click to delete!" type="submit" name="submit"  value="Delete"/>
		</td>
		</tr>
		</table>
	</form>	
<br>

	<table class="table table-hover table-striped table-bordered ">

	<thead>
	<tr>
		<td>Sr.No</td>	
		<td>Id</td>
		<td>Employee Id</td>
		<td>From Date</td>
		<td>To Date</td>
		<td>Along With</td>
		<td>Reason</td>
		<td>Vehicle Id</td>
		<td>Bill No</td>
		<td>K.M.</td>
		<td>Registration By</td>
		<td>Registration Date Time</td>

	</tr>
	</thead>	
	<%
		ResultSet rs = DemoDao.fetchTourDetails();
	int i = 1;
		while(rs.next()){
			%>
			<tbody><tr>
				<td> <%=i++ %> </td>
				<td> <%=rs.getInt(1) %> </td>
				<td> <%=rs.getInt(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=rs.getString(4)%> </td>
				<td> <%=rs.getString(5) %></td>
				<td> <%=rs.getString(6)%> </td>
				<td> <%=rs.getInt(7) %></td>
				<td> <%=rs.getString(8)%> </td>
				<td> <%=rs.getFloat(9) %></td>
				<td> <%=rs.getInt(10) %></td>
				<td> <%=rs.getString(11) %></td>
			
				
				<td> <button class="btn btn-warning" title="Click to set this values in above table!"  onclick="myFunction( <%=rs.getInt(1) %> ,'<%=rs.getInt(2) %> ',' <%=rs.getString(3) %> ','<%=rs.getString(4)%>',' <%=rs.getString(5) %>',' <%=rs.getString(6)%> ',<%=rs.getInt(7) %>,'<%=rs.getString(8)%>',' <%=rs.getFloat(9) %>', <%=rs.getInt(10) %>,'<%=rs.getString(11) %>')"> SET </button> </td>
			</tr>			
		</tbody>
			<% } 
			%>
</table>						
</body>
<script>
function myFunction(id,empId,fromDate,toDate,alongWith,reason,vehicleId,billNo,km,regBy,regDateTime){
	document.getElementById("id").value =id ;
	document.getElementById("empId").value =empId ;
	document.getElementById("fromDate").value =fromDate ;
	document.getElementById("toDate").value =toDate ;
	document.getElementById("alongWith").value =alongWith ;
	document.getElementById("reason").value =reason ;
	document.getElementById("vehicleId").value =vehicleId ;
	document.getElementById("billNo").value =billNo ;
	document.getElementById("km").value =km ;
	document.getElementById("regBy").value =regBy ;
	document.getElementById("regDateTime").value =regDateTime ;
}
</script>



</body>
</html>