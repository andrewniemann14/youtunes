	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.Artist" %>
    
<jsp:useBean id="artistDao" scope="application" class="dao.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Artist Details</title>
</head>

<body>
<jsp:include page="../TopNav.jsp" flush="true" />

<div>
	<h2>New Artist</h2>
		<form>
			<input type="hidden" name="action" value="createArtist" />
					
				<div>
					<label for="artistName">Name</label>
					<input type="text" id="artistName" name="artistName" />
				</div>
					
				<button type="submit">Save</button>
		</form>
	<br />
	<br />
	<a href="store?action=showArtists">Return to artists</a>
</div>
<jsp:include page="../Footer.jsp" flush="true" />
<jsp:include page="../ScriptFooter.jsp" flush="true" />

</body>
</html>