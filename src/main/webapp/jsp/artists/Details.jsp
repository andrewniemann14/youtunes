<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="model.Artist" %>
    
<jsp:useBean id="artistDao" scope="application" class="dao.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artist Details</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body>
<jsp:include page="../TopNav.jsp" flush="true" />

<div>
	<h2>Artist Details</h2>
	
	<% 
		try {
			String artistId = request.getParameter("artistId");
			Artist artist = artistDao.find(Long.parseLong(artistId)); 
			
			if (artist != null) {
			%>
				<form>
					<input type="hidden" name="action" value="updateArtist" />
					<input type="hidden" name="artistId" value="<%=artist.getID() %>" />
					
					<div class="mb-3">
						<label for="artistName" >Name</label>
						<input type="text" id="artistName" name="artistName" value="<%=artist.getName() %>" />
					</div>
					
					<button type="submit" >Save</button>
				</form>
				<%
				System.out.println(artist.getName());
			}
		}
		catch (Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
	%>
	<br />
	<br />
	<a href="store?action=showArtists">Return to artists</a>
</div>

<jsp:include page="../ScriptFooter.jsp" flush="true" />

</body>
</html>