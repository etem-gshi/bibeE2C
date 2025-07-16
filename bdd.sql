/*
se connecter en root windows
mysql -h localhost -u root -p

en root sous linux
sudo synql
*/


/* créer un utilisateur*/ 
 CREATE USER 'pn_livres_admin'@'localhost' IDENTIFIED BY "t=GcF7!,3mQv54";

/*lui donner droits*/ 
GRANT ALL PRIVILEGES ON pn_livres.* TO 'pn_livres_admin'@'localhost';


 /* une fois qu'on est dans une base de donnees*/

 /* voir les tables */
 SHOW TABLES;

 /* création de table*/
 CREATE TABLE IF NOT EXISTS user (
    id SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT PRIMARY KEY,  
    pseudo  VARCHAR(24)  NOT NULL UNIQUE, 
    mdp VARCHAR(27) NOT NULL,
    avatar VARCHAR(255),
    mail VARCHAR(255)NOT NULL UNIQUE 
 )ENGINE=InnoDB;

 INSERT INTO user (pseudo, mdp, mail)
 VALUES("azerty", "motdepasse", "noreply@nowhere.fr");

    INSERT INTO user (pseudo, mdp, mail)
    VALUES("00000", "Admin", "azer@nowhere.fr"),
            ("misterbear","groaaar", "me@misterbear.fr"),
            ("carambar", "Haribo", "sugar@hotmail.com");
SELECT * FROM user;
SELECT pseudo, mail, avatar FROM user;
SELECT pseudo, mail FROM user WHERE pseudo = "Haribo";
SELECT pseudo, mail, avatar FROM user ORDER BY mail DESC;

/*supprimer des données */
DELETE FROM user WHERE pseudo = "motdepasse";

/* modification de table*/
ALTER TABLE user
DROP COLUMN avatar; /* DROP -> supprimer une colonne mais peut être autre chose */

ALTER TABLE user
ADD COLUMN is_admin BOOLEAN NOT NULL DEFAULT 0; /* ADD -> ajouter une colonne ou autre , il faut définir
les éléments de la colonne , comme quand on créé une table */

ALTER TABLE user MODIFY id INT INSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY;/*Change les propriété d'une colonne*/

ALTER TABLE user CHANGE pseudo user_name VARCHAR(120) NOT NULL UNIQUE;/* Change le nom est propriété d'une colonne colonne*/

/*Modifier le donées*/
UPDATE user 
SET is_admin = 1
WHERE id = 2

CREATE TABLE IF NOT EXISTS site (
   id TINYINT UNSIGNED NOT NULL AUTP_INCREMENT PRIMARY KEY,
   City VARCHAR(50) NOT NULL UNIQUE 
)ENGINE=InnoDB;

INSERT INTO site (city)
VALUES("Roubaix"),("Lille"),("Armentière"),("Saint-omer");

/*créer une relation*/

ALTER TABLE user
ADD COLUMN site_id TINYINT UNSIGNED NOT NULL DEFAULT 1;

ALTER TABLE user 
ADD constraint fk_user_site
 FOREIGN KEY (site_id)
 REFERENCES site(id);

 UPDATE user 
 SET site_id = 2 
 WHERE id = 3;

 /*jointure*/
CREATE VIEW user_vw as (
 SELECT user.pseudo AS utilisateur, user.mail, site.city AS ville 
 FROM user 
 INNER JOIN  site 
 ON user.site_id = site.id
);

/* on s'attaque aux livres*/

CREATE TABLE IF NOT EXISTS genre(
   id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

INSERT INTO genre (name)
VALUES ("Roman"),("Fantasy"),("Manga"),("Science Fiction"),("Horreur"),("Romance"),("Policier"),("Magazine"),("BD"),("Histoir"),("Biographie"),("Politique"),("Scolaire");

CREATE TABLE IF NOT EXISTS book (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   titre VARCHAR(225) NOT NULL DEFAULT "Inconnu",
   auteur VARCHAR(100) NOT NULL DEFAULT "Inconnu",
   synopsis TEXT,
   page SMALLINT NOT NULL,
   year SMALLINT NOT NULL DEFAULT "0",
   genre_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
   site_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
   user_id SMALLINT UNSIGNED,
   CONSTRAINT fk_book_genre
   FOREIGN KEY (genre_id)
   REFERENCES genre (id),
   CONSTRAINT fk_book_site
   FOREIGN KEY (site_id)
   REFERENCES site (id),
   CONSTRAINT fk_book_user
   FOREIGN KEY (user_id)
   REFERENCES user(id)
)ENGINE=InnoDB;