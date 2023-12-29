<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.demo.bean.*, com.demo.dao.DemoDao , java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css">
 
<title>View Records</title>
</head>
<body>

<form>
<table class="table-striped" >
<tr>
<td  class="table-primary" >
<label> &nbsp&nbsp&nbsp From Date:</label>

</td>
<td>
<input class="form-control" type= "text" placeholder="From Date" id="fromDate" name="fromDate">
</td>
</tr>
<tr>
<td class="table-success">
<label> &nbsp&nbsp&nbsp To Date:</label>
</td>
<td>
<input class="form-control" type="text" placeholder="To Date" id="toDate" name="toDate" >
</td>
</tr>
<tr>
<td>
<input  type="hidden" name="hiddenField" value="hidden" />
</td>
</tr>
<br>
<tr>
<td colspan="2">
<br> 
&nbsp&nbsp&nbsp <input data-toggle="tooltip" title="Click to Search!" class="btn btn-secondary" type="submit" value="Search"/>
</td>
</tr>

<tr><td><br> 
 &nbsp&nbsp&nbsp <button class="btn btn-secondary" title="Click to download table into excel!" onclick="exportTableToExcel('tblData', 'Tour Details')">Export Table Data To Excel File</button>
</td></tr>
</table>
</form>
<br>
	<table class="table table-hover table-striped table-bordered " id="tblData">
	<tr>
		<td>Sr.No</td>	
		<td>Employee Id</td>
		<td>From Date</td>
		<td>To Date</td>
		<td>Reason</td>
		<td>Vehicle No</td>
		<td>Vehicle Name</td>
		<td>Rate</td>		
		<td>KM</td>
		<td>Rate x Km</td>

	<%
if(request.getParameter("hiddenField") != null){

	ResultSet rs = DemoDao.fetchTourMaster( request.getParameter("fromDate") , request.getParameter("toDate") );
	int i = 1;
		while(rs.next()){
			%>
			<tr>
				<td> <%=i++ %> </td>
				<td> <%=rs.getInt(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3)%> </td>
				<td> <%=rs.getString(4) %></td>
				<td> <%=rs.getString(5)%> </td>
				<td> <%=rs.getString(6) %> </td>
				<td> <%=rs.getFloat(7)%> </td>
				<td> <%=rs.getFloat(8) %> </td>
				<td> <%=(rs.getFloat(7) * rs.getFloat(8)) %></td>
				</tr>
<%
}
}
%>				
 
</table>
<script>
function exportTableToExcel (tableID , filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}
</script>

</body>
</html>