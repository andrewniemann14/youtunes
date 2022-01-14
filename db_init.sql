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
	first_name VARCHAR(75) NOT NULL,
	last_name VARCHAR(75),
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
INSERT INTO artist(first_name)
	VALUES("Timbaland");

INSERT INTO artist(first_name)
	VALUES("Eminem");
	
INSERT INTO artist(first_name)
	VALUES("Coldplay");
	
INSERT INTO artist(first_name, last_name)
	VALUES("Kanye", "West");
	
INSERT INTO artist(first_name, last_name)
	VALUES("Radiohead");
	
INSERT INTO artist(first_name, last_name)
	VALUES("Jay-Z");	
	
INSERT INTO artist(first_name)
	VALUES("The White Stripes");
	
INSERT INTO artist(first_name)
	VALUES("Green Day");
	
INSERT INTO artist(first_name, last_name)
	VALUES("Justin", "Timberlake");
	
INSERT INTO artist(first_name)
	VALUES("Outkast");
	
INSERT INTO artist(first_name)
	VALUES("Linkin Park");
		
INSERT INTO artist(first_name)
	VALUES("Linkin Park");
	
INSERT INTO artist(first_name)
	VALUES("The Killers");
	
INSERT INTO artist(first_name)
	VALUES("Beyonce");
	
INSERT INTO artist(first_name, last_name)
	VALUES("Avril", "Lavigne");
	
INSERT INTO artist(first_name, last_name)
	VALUES("Kylie", "Minogue");
	
INSERT INTO artist(first_name)
	VALUES("Nickelback");
	
	
	
-- insert album statements
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Shock Value", 10, "Hip-hop", "", (SELECT artist_id FROM artist WHERE first_name = "Timbaland"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Shock Value II", 10, "Hip-hop", "", (SELECT artist_id FROM artist WHERE first_name = "Timbaland"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("The Marshall Mathers LP", 10, "Rap", "", (SELECT artist_id FROM artist WHERE first_name = "Eminem"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("The Eminem Show", 10, "Rap", "", (SELECT artist_id FROM artist WHERE first_name = "Eminem"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Encore", 10, "Rap", "", (SELECT artist_id FROM artist WHERE first_name = "Eminem"));
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES("Get the Guns", 10, "Rap", "", (SELECT artist_id FROM artist WHERE first_name = "Eminem"));

	