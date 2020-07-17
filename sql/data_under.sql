DELETE FROM user;
ALTER TABLE user AUTO_INCREMENT = 1;
DELETE FROM association;
ALTER TABLE association AUTO_INCREMENT = 1;
DELETE FROM feedback;
ALTER TABLE feedback AUTO_INCREMENT = 1;
DELETE FROM post;
ALTER TABLE post AUTO_INCREMENT = 1;
DELETE FROM admin;
ALTER TABLE admin AUTO_INCREMENT = 1;
DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1;
DELETE FROM event;
ALTER TABLE event AUTO_INCREMENT = 1;
DELETE FROM follower;
ALTER TABLE follower AUTO_INCREMENT = 1;
DELETE FROM participation;
ALTER TABLE participation AUTO_INCREMENT = 1;
DELETE FROM type;
ALTER TABLE type AUTO_INCREMENT = 1;
DELETE FROM news;
ALTER TABLE news AUTO_INCREMENT = 1;

#------------------------------------------------------------------------------------
# Data category
#------------------------------------------------------------------------------------

INSERT INTO category(name) values("Animalière");
INSERT INTO category(name) values("Culturelle");
INSERT INTO category(name) values("Environnementale");
INSERT INTO category(name) values("Humanitaire");
INSERT INTO category(name) values("Musicale");
INSERT INTO category(name) values("Sportive");
INSERT INTO category(name) values("Autre");

#------------------------------------------------------------------------------------
# Data type
#------------------------------------------------------------------------------------

INSERT INTO type(name) values("bug");
INSERT INTO type(name) values("note");

#------------------------------------------------------------------------------------
# Data admin
#------------------------------------------------------------------------------------

INSERT INTO admin(login,password,email) values("admin_01","corentin","cocun91@gmail.com");
INSERT INTO admin(login,password,email) values("admin_02","matthieu","habib.matthieu1@gmail.com");
INSERT INTO admin(login,password,email) values("admin_03","thomas","t.martin92500@hotmail.fr");