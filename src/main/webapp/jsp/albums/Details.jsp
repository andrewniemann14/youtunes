<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Artist" %>

<jsp:useBean id="artistDao" scope="application" class="dao.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Album Details</title>
</head>
<body>
<jsp:include page="../TopNav.jsp" />

	<h2>Album Details</h2>
	
	<%
	try {
		String artistId = request.getParameter("artistId");
		Artist artist = artistDao.find(Long.parseLong(artistId));
		
		if (artist != null) {
		%>
			<form>
				<input type="hidden" name="action" value="updateArtist" />
				<input type="hidden" name="artistId" value="<%=artist.getID() %>" />
				
				<div>
					<label for="name" class="">Name</label>
					<input type="text" class="" id="name" name="name" value="<%=artist.getName() %>" />
				</div>
				
				<button type="submit" class="">Save</button>
			</form>
		<%
		System.out.println(artist.getName());			
		}
	} catch (Exception ex) {
		System.out.println(ex.getMessage());
	}
	
	%>
	<br />
	<a href="store?action=showArtists">Back to artists</a>

<jsp:include page="../Footer.jsp" />
<jsp:include page="../ScriptFooter.jsp" />
</body>
</html>