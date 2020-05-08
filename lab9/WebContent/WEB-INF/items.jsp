<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.Item"  %>   
    
    
     <%-- <%
if (request.getParameter("itemCode") != null)
{
session.setAttribute("itemCode", request.getParameter("itemCode"));
session.setAttribute("itemName", request.getParameter("itemName"));
session.setAttribute("itemPrice", request.getParameter("itemPrice"));
session.setAttribute("itemDesc", request.getParameter("itemDesc"));
}
    
%>   --%>








<%


session.setAttribute("statusMsg", "");
System.out.println("Trying to process.............");


if (request.getParameter("itemCode") != null)
{
Item itemObj = new Item();
String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "")
{
stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
request.getParameter("itemName"),
request.getParameter("itemPrice"),
request.getParameter("itemDesc"));
}
else//Update----------------------
{
stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
request.getParameter("itemCode"),
request.getParameter("itemName"),
request.getParameter("itemPrice"),
request.getParameter("itemDesc"));
}
session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null)
{
	Item itemObj = new Item();
String stsMsg =
itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
session.setAttribute("statusMsg", stsMsg);
}


%>












    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>
<meta charset="ISO-8859-1">





</head>
<body>


<div class="container">
<div class="row">
<div class="col-6">

<h1>Item Management v9</h1>
<form id="formItem" name="formItem" method="post" action="items.jsp">
Item code:
<input id="itemCode" name="itemCode" type="text"
class="form-control form-control-sm">
<br> Item name:
<input id="itemName" name="itemName" type="text"
class="form-control form-control-sm">
<br> Item price:
<input id="itemPrice" name="itemPrice" type="text"
class="form-control form-control-sm">
<br> Item description:
<input id="itemDesc" name="itemDesc" type="text"
class="form-control form-control-sm">
<br>
<input id="btnSave" name="btnSave" type="button" value="Save"
class="btn btn-primary">
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>


<div id="alertSuccess" class="alert alert-success">

  <%
  out.print(session.getAttribute("statusMsg"));
  
  %>


</div>

<div id="alertError" class="alert alert-danger"></div>
  
   <br>
   
   <%
   
      Item itemobj = new Item();
      out.print(itemobj.readItems());
   %>
   
   
   </div>
   </div>
   </div>


<%-- <br>

  
<table border="1">
<tr>
<th>Item Code</th>
<th>Item Name</th>
<th>Item Price</th>
<th>Item Description</th>
<th>Update</th>
<th>Remove</th>
</tr>
<tr>
<td><%out.print(session.getAttribute("itemCode")); %></td>
<td><%out.print(session.getAttribute("itemName")); %></td>
<td><%out.print(session.getAttribute("itemPrice")); %></td>
<td><%out.print(session.getAttribute("itemDesc")); %></td>
<td><input name="btnUpdate" type="button" value="Update"></td>
<td><input name="btnRemove" type="button" value="Remove"></td>
</tr>
</table>  
 --%>









</body>
</html>