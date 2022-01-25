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
	<link rel="stylesheet" href="css/style.css">
	<title>Artists</title>
</head>
<body>
<jsp:include page="../TopNav.jsp" flush="true" />

<div>
	<div class="section__intro">
		<h2 style="text-align: center;">Artists</h2>
		<a href="store?action=newArtist">New artist</a>
	</div>
	
	<div class="artist-list__section">
		<%
		List<Artist> artists = artistDao.list();
		Iterator<Artist> iterator = artists.iterator();
		while (iterator.hasNext()) {
			Artist artist = (Artist)iterator.next();
					
			System.out.println(artist.getID());
			System.out.println(artist.getName());
		%>
			<div class="artist-list__item">
				<span class="artist-list__item--id"><%=artist.getID() %></span>
				<span class="artist-list__item--name"><%=artist.getName() %></span>
				<span class="artist-list__item--actions">
					<a href="store?action=artistDetails&artistId=<%=artist.getID() %>"
						class="artist-list__item--link">Edit</a>
				</span>
			</div>
		<% } %>
		
	</div>
	

	
</div>

<jsp:include page="../Footer.jsp" />
<jsp:include page="../ScriptFooter.jsp" />
</body>
</html>