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