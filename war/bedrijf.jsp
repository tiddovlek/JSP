<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="autobedrijf.Auto"%>
<%@page import="autobedrijf.AutoLijst"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP</title>
</head>

<body>
	<form>
		<label>Kies Merk</label> <select name="merk" id="merk">
		<option value="alle">alle merken </option>
		
		<%
		AutoLijst autos = new AutoLijst();
		ArrayList<Auto> autolijst = autos.getLijst();
		ArrayList<String>  merklijst = autos.getMerken();
		
		for (String b : merklijst) {
		%>
			<option value="<%=b%>"><%=b %></option>
		<%} %>
				</select>
		<br>
		<label>Minimum prijs</label>
		<input type="text" name="lageprijs" id="minprijs">
		<label>Maximum prijs</label>
		<input type="text" name="maxprijs" id="maxprijs">
		<br>
		1
	</form>
	
	<%
	
		if (request.getParameter("ok") != null)  {
			for (Auto a : autolijst) {
				System.out.println(a.getPrijs());
				if (
						(
							a.getMerk().equalsIgnoreCase(request.getParameter("merk"))
							|| request.getParameter("merk").equalsIgnoreCase("alle")
						)
						&& (
							request.getParameter("lageprijs") == null
							|| request.getParameter("lageprijs").equals("")
							|| Double.parseDouble(request.getParameter("lageprijs")) <= a.getPrijs()
						)
						&& (
							request.getParameter("maxprijs") == null
							|| request.getParameter("maxprijs").equals("")
							|| Double.parseDouble(request.getParameter("maxprijs")) >= a.getPrijs()
						)
					) {
					%>
					<div id="autoselectie">
						<div class="autokader">
							<p class="merktype">
								<%=a.getMerk()%>
								<%=a.getType()%>
							</p>
							<p class="prijs">
								&euro;
								<%=a.getPrijsFormat()%>
							</p>
							<img src="<%=a.getFoto() %>" >
						</div>
					</div>
					<%
				}
			}
		} else {
			for (Auto a : autolijst) {
				%>
				<div id="autoselectie">
					<div class="autokader">
						<p class="merktype">
							<%=a.getMerk()%>
							<%=a.getType()%>
						</p>
						<p class="prijs">
							&euro;
							<%=a.getPrijsFormat()%>
					
						</p>
						<img
							src="<%=a.getFoto() %>" >
					</div>
				</div>
				<%
			}
		}
	%>



	</div>

	</div>
</body>
</html>