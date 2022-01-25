<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Album"%>

<jsp:useBean id="albumDao" scope="application" class="dao.JdbcAlbumDao" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>YouTunes</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="TopNav.jsp" />


	<div class="section__intro">
		<h1 class="section__title">Welcome to YouTunes!</h1>
		<h3 class="section__subtitle">Definitely a fully functional website</h3>
	<a href="store?action=newAlbum">New album</a>
	</div>

	<div class="album-list__section">
		<%
		List<Album> albums = albumDao.list();
		Iterator<Album> iterator = albums.iterator();
		while (iterator.hasNext()) {
			Album album = (Album)iterator.next();
			%>
			<a href="store?action=albumDetails&albumId=<%=album.getAlbumId()%>">
			<div class="album-list__item">
				<img class="album-list__item--img" src="img/<%=album.getImgUrl() %>" />
				<div class="album-list__item--title"><%=album.getTitle() %></div>
				<div class="album-list__item--details">
					<span><%=album.getGenre() %></span>
					<span>$<%=String.format("%.2f", album.getPrice()) %></span>
				</div>
			</div>
			</a>
		<% } %>
	</div>
	



	<jsp:include page="Footer.jsp" />
	<jsp:include page="ScriptFooter.jsp" />
</body>
</html>