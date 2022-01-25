<!-- header, included on all pages -->

<%@page language="java" contentType="text/html"%>

  <div class="nav__section" id="top"> <!-- this is flex-row -->

    <div class="nav__item">
      <a href="/youtunes" class="nav__link nav__link--home">
        <span><img src="img/yt-logo.svg" class="nav__link--logo" /></span>
        <span>You<br/>Tunes</span>
      </a>
    </div>
  
    <div class="nav__item">
      <a href="store?action=showArtists" class="nav__link">Artists</a>
    </div>
  
    <div class="nav__item">
      <a href="store?action=showAboutUs" class="nav__link">About Us</a>
    </div>
  
    <div class="nav__item">
      <a href="store?action=showContactUs" class="nav__link">Contact</a>
    </div>
  
  </div>