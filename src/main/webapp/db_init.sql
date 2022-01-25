-- drop youtunes_user if exists 
DROP USER IF EXISTS 'youtunes_user'@'localhost';


-- create youtunes_user and grant them all privileges to the pysports database 
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL5IsGreat!';


-- grant all privileges to the youtunes database to user youtunes_user on localhost 
GRANT ALL PRIVILEGES ON youtunes.* TO'youtunes_user'@'localhost';


-- Drop the foreign key
ALTER TABLE album DROP FOREIGN KEY fk_artist;


-- drop tables if they are present
DROP TABLE IF EXISTS artist; 
DROP TABLE IF EXISTS album; 


-- create artist table 
CREATE TABLE artist (
	artist_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(75) NOT NULL,
	PRIMARY KEY(artist_id)
);

-- create album table 
CREATE TABLE album (album_id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(150) NOT NULL,
	price DECIMAL(5, 2) NOT NULL,
	genre VARCHAR(75) NOT NULL,
	img_url VARCHAR(150) NOT NULL,
	artist_id INT NOT NULL,
	PRIMARY KEY(album_id),
	CONSTRAINT fk_artist
	FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
); 


-- insert artist statements 
	
INSERT INTO artist(name)
	VALUES("Beyonce");
	
INSERT INTO artist(name)
	VALUES("Britney Spears");
	
INSERT INTO artist(name)
	VALUES("Coldplay");
	
INSERT INTO artist(name)
	VALUES("Eminem");
	
INSERT INTO artist(name)
	VALUES("Jay-Z");
	
INSERT INTO artist(name)
	VALUES("Justin Timberlake");
	
INSERT INTO artist(name)
	VALUES("The Killers");
	
INSERT INTO artist(name)
	VALUES("Kylie Minogue");
	
INSERT INTO artist(name)
	VALUES("Linkin Park");
	
INSERT INTO artist(name)
	VALUES("Nickelback");

INSERT INTO artist(name)
	VALUES("Radiohead");
	
INSERT INTO artist(name)
	VALUES("Timbaland");
	
	

-- insert album statements
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Dangerously in Love", 10, "Pop", "dangerouslyinlove.jpg", (SELECT artist_id FROM artist WHERE name = "Beyonce"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("I Am... Sasha Fierce", 10, "Pop", "sashafierce.png", (SELECT artist_id FROM artist WHERE name = "Beyonce"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Oops!... I Did It Again", 10, "Pop", "oops.png", (SELECT artist_id FROM artist WHERE name = "Britney Spears"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Circus", 10, "Pop", "circus.jpeg", (SELECT artist_id FROM artist WHERE name = "Britney Spears"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Viva la Vida", 10, "Rock", "viva.jpg", (SELECT artist_id FROM artist WHERE name = "Coldplay"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("The Marshall Mathers LP", 10, "Rap", "marshallmathers.jpg", (SELECT artist_id FROM artist WHERE name = "Eminem"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Encore", 10, "Rap", "encore.jpg", (SELECT artist_id FROM artist WHERE name = "Eminem"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Kingdom Come", 10, "Rap", "kingdomcome.jpg", (SELECT artist_id FROM artist WHERE name = "Jay-Z"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("American Gangster", 10, "Rap", "americangangster.jpg", (SELECT artist_id FROM artist WHERE name = "Jay-Z"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Justified", 10, "R&B", "justified.jpg", (SELECT artist_id FROM artist WHERE name = "Justin Timberlake"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Collaborations", 10, "R&B", "collaborations.jpg", (SELECT artist_id FROM artist WHERE name = "Justin Timberlake"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Hot Fuss", 10, "Alternative", "hotfuss.png", (SELECT artist_id FROM artist WHERE name = "The Killers"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Day & Age", 10, "Alternative", "dayage.png", (SELECT artist_id FROM artist WHERE name = "The Killers"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Fever", 10, "Pop", "fever.jpg", (SELECT artist_id FROM artist WHERE name = "Kylie Minogue"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Body Language", 10, "Pop", "bodylanguage.jpg", (SELECT artist_id FROM artist WHERE name = "Kylie Minogue"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Meteora", 10, "Rock", "meteora.jpg", (SELECT artist_id FROM artist WHERE name = "Linkin Park"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Minutes to Midnight", 10, "Rock", "minutestomidnight.jpg", (SELECT artist_id FROM artist WHERE name = "Linkin Park"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("The Long Road", 10, "Rock", "longroad.jpg", (SELECT artist_id FROM artist WHERE name = "Nickelback"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Dark Horse", 10, "Rock", "darkhorse.jpg", (SELECT artist_id FROM artist WHERE name = "Nickelback"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Amnesiac", 10, "Rock", "amnesiac.jpg", (SELECT artist_id FROM artist WHERE name = "Radiohead"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("In Rainbows", 10, "Rock", "inrainbows.png", (SELECT artist_id FROM artist WHERE name = "Radiohead"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Shock Value", 10, "Hip-hop", "shockvalue.jpg", (SELECT artist_id FROM artist WHERE name = "Timbaland"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Shock Value II", 10, "Hip-hop", "shockvalue2.jfif", (SELECT artist_id FROM artist WHERE name = "Timbaland"));