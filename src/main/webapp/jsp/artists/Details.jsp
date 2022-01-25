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
	<div class="section__intro">
		<h2>Artist Details</h2>
	</div>
	
	<% 
		try {
			String artistId = request.getParameter("artistId");
			Artist artist = artistDao.find(Long.parseLong(artistId)); 
			
			if (artist != null) {
			%>
				<form class="form">
					<input type="hidden" name="action" value="updateArtist" />
					<input type="hidden" name="artistId" value="<%=artist.getID() %>" />
					
					<div class="mb-3">
						<label for="artistName" >Name</label>
						<input type="text" id="artistName" name="artistName" value="<%=artist.getName() %>" />
					</div>
					
					<button class="btn" type="submit" >Save</button>
				</form>
				<form id="artistForm">
					<input type="hidden" name="action" value="deleteArtist" />
					<input type="hidden" name="artistId" value="<%=artist.getID()%>" />
					
					<button class="btn btn--delete" id="btnSubmit" type="submit">Delete</button>
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
	<a class="link-back" href="store?action=showArtists">Return to artists</a>
</div>

<jsp:include page="../ScriptFooter.jsp" flush="true" />

</body>
</html>