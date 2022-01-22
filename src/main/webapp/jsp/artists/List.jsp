<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="model.Artist" %> <!-- youtunes.java.model.Artist -->

<jsp:useBean id="artistDao" scope="application" class="dao.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="../../css/style.css">
	<title>Artists</title>
</head>
<body>
<jsp:include page="../TopNav.jsp" flush="true" />

<div>
	<h2>h2 Heading</h2>
	
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<Artist> artists = artistDao.list();
				Iterator<Artist> iterator = artists.iterator();
				while (iterator.hasNext()) {
					Artist artist = (Artist)iterator.next();
					
					// necessary?
					System.out.println(artist.getID());
					System.out.println(artist.getName());
			%>
					<tr>
						<td><%=artist.getID() %></td>
						<td><%=artist.getName() %></td>
						<td>
							<a href="store?action=artistDetails&artistId=<%=artist.getID() %>">Edit</a>
							<a href="store?action=deleteArtist&artistId=<%=artist.getID() %>">Delete</a>
						</td>
					</tr>
				<% } %>
		</tbody>
	</table>
	

	<a href="store?action=newArtist">New artist</a>
</div>

<jsp:include page="../Footer.jsp" />
<jsp:include page="../ScriptFooter.jsp" />
</body>
</html>