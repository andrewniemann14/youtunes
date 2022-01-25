<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Artist"%>

<jsp:useBean id="artistDao" scope="application"
	class="dao.JdbcArtistDao" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Album</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />



</head>
<body>
<jsp:include page="../TopNav.jsp" flush="true" />

<div>
	<div class="section__intro">
		<h2 class="section__title">New Album</h2>
	</div>

	<form class="album__form" id="albumForm">
		<input type="hidden" name="action" value="createAlbum" />
					
		<div class="mb-3">
			<label for="title" class="form-label">Album title</label>
			<input type="text" class="form-control" id="title" name="title" />
		</div>
					
		<div>
			<label for="price" class="form-label">Price</label>
			<input type="text" class="form-control" id="price" name="price" />
		</div>
		
		<div>
			<label for="img" class="form-label">Image URL</label>
			<input type="text" class="form-control" id="img_url" name="img_url" />
		</div>
		
		<div>
			<label for="genre" class="form-label">Genre</label>
			<select class="form-select" id="genre" name="genre">
				<option value="0" selected>--Select--</option>
				<option value="Alternative">Alternative</option>
				<option value="Classical">Classical</option>
				<option value="R&B">R&B</option>
				<option value="Hip-hop">Hip-hop</option>
				<option value="Jazz">Jazz</option>
				<option value="Pop">Pop</option>
				<option value="Rap">Rap</option>
				<option value="Rock">Rock</option>
			</select>
		</div>
		
		<div>
			<label for="artist" class="form-label">Artist</label>
			<select class="form-select" id="artist" name="artist">
				<option value="0" selected>--Select--</option>
				
				<%
					List<Artist> artists = artistDao.list();
					Iterator<Artist> iterator = artists.iterator();
					while (iterator.hasNext())
					{
						Artist artist = (Artist)iterator.next();
					
				%>
						<option value="<%=artist.getID()%>"><%=artist.getName()%></option>
					<% } %>
			</select>
		</div>
		
					
		<button class="album__btn album__btn--save" id="btnSubmit" type="submit" >Save</button>
	</form>
	
	<br /><br />
	<a class="link-back" href="store">Return home</a>
</div>


<jsp:include page="../Footer.jsp" flush="true" />
<jsp:include page="../ScriptFooter.jsp" flush="true" />
</body>
</html>