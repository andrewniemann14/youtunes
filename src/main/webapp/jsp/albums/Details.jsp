<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Artist"%>
    
<%@page import="model.Album" %>

<jsp:useBean id="albumDao" scope="application" class="dao.JdbcAlbumDao" />
<jsp:useBean id="artistDao" scope="application" class="dao.JdbcArtistDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Album Details</title>



</head>
<body>
<jsp:include page="../TopNav.jsp" flush="true" />

<div>
	<div class="section__intro">
		<h2 class="section__title">Album Details</h2>
	</div>
	<% 
		try 
		{
			String albumId = request.getParameter("albumId");
			Album album = albumDao.find(Long.parseLong(albumId));
			System.out.println(album.toString());
			
			if (album != null) {
			%>
				<form class="form album__form" id="albumForm">
					<input type="hidden" name="action" value="updateAlbum" />
					<input type="hidden" name="albumId" value="<%=album.getAlbumId()%>" />
					
					<div>
						<label for="title">Album title</label>
						<input type="text" id="title" name="title" value="<%=album.getTitle() %>" />
					</div>
					
					<div>
						<label for="price" >Price</label>
						<input type="text" id="price" name="price" value="<%=album.getPrice() %>" />
					</div>
					
					<div>
						<label for="url" >Image URL</label>
						<input type="text" id="img_url" name="img_url" value="<%=album.getImgUrl()%>" />
					</div>
		
					<div>
						<label for="genre" >Genre</label>
						<select id="genre" name="genre">
							<option value="0">--Select--</option>
							<% System.out.println("Selected Genre: " + album.getGenre()); %>
							
							<option value="Alternative" <% if (album.getGenre().equals("Alternative")) { %> selected <% } %> >Alternative</option>
							<option value="Classical" <% if (album.getGenre().equals("Classical")) { %> selected <% } %> >Classical</option>
							<option value="Hip-hop" <% if (album.getGenre().equals("Hip-hop")) { %> selected <% } %> >Hip-hop</option>
							<option value="Jazz" <% if (album.getGenre().equals("Jazz")) { %> selected <% } %> >Jazz</option>
							<option value="Pop" <% if (album.getGenre().equals("Pop")) { %> selected <% } %> >Pop</option>
							<option value="Rap" <% if (album.getGenre().equals("Rap")) { %> selected <% } %> >Rap</option>
							<option value="R&B" <% if (album.getGenre().equals("R&B")) { %> selected <% } %> >R&B</option>
							<option value="Rock" <% if (album.getGenre().equals("Rock")) { %> selected <% } %> >Rock</option>
						</select>
					</div>
		
					<div>
						<label for="artist" >Artist</label>
						<select id="artist" name="artist">
							<option value="0" selected>--Select--</option>
							
							<%
								List<Artist> artists = artistDao.list();
								Iterator<Artist> iterator = artists.iterator();
								while (iterator.hasNext())
								{
									Artist artist = (Artist)iterator.next();
								
							%>
									<option value="<%=artist.getID()%>" <% if (album.getArtistId() == artist.getID()) { %> selected <% } %> >
										<%=artist.getName()%>
									</option>
								<% } %>
						</select>
					</div>
					
					<button class="btn btn--save" id="btnSubmit" type="submit" >Save</button>
				</form>
				<form id="albumForm">
					<input type="hidden" name="action" value="deleteAlbum" />
					<input type="hidden" name="albumId" value="<%=album.getAlbumId()%>" />
					
					<button class="btn btn--delete" id="btnSubmit" type="submit">Delete</button>
				</form>
				
				<br /><br />
				<a class="link-back" href="store?action=showAlbums">Return to Albums</a>
			<% 	
			}
		}
		catch (Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
	%>
</div>


</body>
</html>