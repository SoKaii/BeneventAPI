#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        iduser           Int  Auto_increment  NOT NULL ,
        name          Varchar (50) NOT NULL ,
        firstname     Varchar (50) NOT NULL ,
		    age			      Date NOT NULL ,
        email         Varchar (100) NOT NULL UNIQUE ,
		    password      Varchar (50) NOT NULL ,
        phone         Varchar (12) ,
        profilpicture Varchar (255) 
        ,CONSTRAINT user_PK PRIMARY KEY (iduser)
)ENGINE=InnoDB;

INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Gomez","Aubree","1998-03-19","aubree.gomez@example.com","celeste","https://randomuser.me/api/portraits/women/23.jpg","0655443322");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("John","Doe","1992-04-08","jd@test.fr","JohnDoe","https://randomuser.me/api/portraits/men/79.jpg","+33612141512");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Jacobs","Adrian","2000-05-02","adrian.jacobs@example.com","ring","https://randomuser.me/api/portraits/lego/6.jpg","+33612345678");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Brandie","Mason","1988-01-28","brandie.mason@example.com","sandrine","https://randomuser.me/api/portraits/women/3.jpg","0678901234");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Maurice","Barnett","1981-05-28","maurice.barnett@example.com","angus1","https://randomuser.me/api/portraits/men/3.jpg","0611223344");

#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE category(
        idcategory Int  Auto_increment  NOT NULL ,
        name  Varchar (255) NOT NULL
	,CONSTRAINT category_PK PRIMARY KEY (idcategory)
)ENGINE=InnoDB;

INSERT INTO category(name) values("Animalière");
INSERT INTO category(name) values("Culturelle");
INSERT INTO category(name) values("Environnementale");
INSERT INTO category(name) values("Humanitaire");
INSERT INTO category(name) values("Musicale");
INSERT INTO category(name) values("Sportive");
INSERT INTO category(name) values("Autre");


#------------------------------------------------------------
# Table: association
#------------------------------------------------------------

CREATE TABLE association(
        idassociation     Int  Auto_increment  NOT NULL ,
        name     Varchar (50) NOT NULL UNIQUE,
        logo     Varchar (255) ,
        acronym  Varchar (50) ,
        email    Varchar (50) NOT NULL UNIQUE,
        phone    Varchar (12) ,
        website  Varchar (250) ,
        support  Varchar (250) ,
        password Varchar (50) NOT NULL ,
        idcategory    Int NOT NULL
	,CONSTRAINT association_PK PRIMARY KEY (idassociation)

	,CONSTRAINT association_category_FK FOREIGN KEY (idcategory) REFERENCES category(idcategory)
)ENGINE=InnoDB;

INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values('Croix-Rouge', 'https://nsa40.casimages.com/img/2020/06/25/20062511235323873.jpg', 'CR', 'cr@cr.fr', '0123456789', 'https://www.croix-rouge.fr/', 'www.donner.croix-rouge.fr', '324d8a1d3f81e730d5099a48cee0c5b6', 4);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values('Medecin Sans Frontiere', 'https://nsa40.casimages.com/img/2020/07/06/200706065034573482.png', 'MSF', 'msf@msf.fr', '0123456789', 'https://www.msf.fr/', 'soutenir.msf.fr/b/mon-don', '2cf79e8f137b5429d1c5a5351e00c5de', 4);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values('Société protectrice des animaux', 'https://nsa40.casimages.com/img/2020/07/06/200706065034511321.png', 'SPA', 'spa@spa.fr', '0123456789', 'https://www.la-spa.fr/', 'soutenir.la-spa.fr/b/mon-don', 'cc91e646ffef196e61f25dce2ada9ae5', 1);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values('Agir pour l\'environnement', 'https://nsa40.casimages.com/img/2020/07/06/200706065034827123.png', 'APE', 'ape@ape.fr', '0123456789', 'https://www.agirpourlenvironnement.org/', 'soutenir.agirpourlenvironnement.org/b/mon-don', '180031a348c14d401143be02fe7708f5', 3);


#------------------------------------------------------------
# Table: event
#------------------------------------------------------------

CREATE TABLE event(
        idevent        Int  Auto_increment  NOT NULL ,
        name        Varchar (30) NOT NULL ,
        description Varchar (255) NOT NULL ,
        dateDeb        Datetime NOT NULL ,
        dateFin        Datetime NOT NULL,
        location    Varchar (255) NOT NULL ,
        maxBenevole Int NOT NULL ,
        idcategory       Int NOT NULL ,
        idassociation        Int NOT NULL ,
        fakeevent   Bool
	,CONSTRAINT event_PK PRIMARY KEY (idevent)

	,CONSTRAINT event_category_FK FOREIGN KEY (idcategory) REFERENCES category(idcategory)
	,CONSTRAINT event_association0_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
)ENGINE=InnoDB;

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Jour de la Nuit","Le Jour de la Nuit est une opération annuelle de sensibilisation à la pollution lumineuse, à la protection de la biodiversité nocturne et du ciel étoilé",'2020-06-26 20:00:00','2020-06-27 01:00:00',"Paris,",150,3,4,false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Jour de Demain","Le Jour de Demain est une opération annuelle de sensibilisation à la pollution, à la protection de la biodiversité de notre futur",'2020-07-22 09:00:00','2020-07-22 23:00:00',"Paris,",250,3,4,false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Des cantines bio","Avec 10 millions de personnes servies par jour, la restauration collective est un levier pour asseoir la transition écologique et l’ancrage territorial de l’alimentation",'2020-07-26 19:00:00','2020-07-26 21:00:00',"Paris,",15,3,4,false);

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Reunion Informative","Régulièrement, MSF organise des réunions d’information. Organisées autour du témoignage d’un volontaire revenant de mission, il est recommandé d'y assister avant de postuler en ligne.",'2020-06-26 20:00:00','2020-06-26 23:00:00',"Fontainebleau",150000,4,2,false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Conférence","Vous êtes intéressé/e par le travail de MSF et souhaitez en savoir plus? Vous envisagez peut-être de travailler sur un projet MSF et avez des questions?",'2020-06-10 12:00:00','2020-06-11 01:30:00',"Poissy",15000,4,2,false);

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Journée Portes Ouvertes","Le refuge vous ouvre ses portes le samedi 8 et dimanche 9 février de 10h00 à 18h00 sous le thème de l'amour.",'2020-02-14 11:00:00','2020-02-16 22:00:00',"Creteil,",150,3,4,false);

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("La Balade Engagée","La Balade Engagée est le nouveau festival dédié à l’engagement solidaire,",'2020-06-26 20:00:00','2020-06-27 01:00:00',"Lille,",500,2,1,false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Festival Tous Engagés","Le Festival Tous Engagés est le 1er Grand événement sur l'innovation sociale organisé par la Croix-Rouge française.",'2020-06-22 20:00:00','2020-06-24 01:00:00',"Paris,",50000,2,1,false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("","",'2000-01-01 00:00:00','2000-01-01 00:00:00',"",0,7,1,true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("","",'2000-01-01 00:00:00','2000-01-01 00:00:00',"",0,7,2,true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("","",'2000-01-01 00:00:00','2000-01-01 00:00:00',"",0,7,3,true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("","",'2000-01-01 00:00:00','2000-01-01 00:00:00',"",0,7,4,true);


#------------------------------------------------------------
# Table: posts
#------------------------------------------------------------

CREATE TABLE post(
        idpost    Int  Auto_increment  NOT NULL ,
        message Varchar (255) ,
        date    Datetime NOT NULL ,
        iduser     Int ,
        idassociation    Int ,
        idevent    Int NOT NULL
	,CONSTRAINT post_PK PRIMARY KEY (idpost)

	,CONSTRAINT post_user_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
	,CONSTRAINT post_association0_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
	,CONSTRAINT post_event1_FK FOREIGN KEY (idevent) REFERENCES event(idevent) ON DELETE CASCADE
)ENGINE=InnoDB;

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,4,1);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Super",'2020-06-27 08:57:44',2,NULL,1);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Vraiment top!",'2020-06-27 08:57:44',1,NULL,1);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Pensez a venir ",'2020-06-27 08:57:44',NULL,4,2);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,4,2);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Cela manque de préparation",'2020-06-27 08:57:44',4,NULL,2);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("probleme de presentation mais agreable quand meme",'2020-06-27 08:57:44',1,NULL,2);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,4,3);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à vous pour cet événement riches en rencontres!",'2020-06-27 08:57:44',2,NULL,3);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Hesitez pas a préparer des questions ",'2020-06-27 08:57:44',NULL,2,4);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("En esperant avoir plus de moyens une prochaine fois pour que cela se déroule mieux",'2020-06-27 08:57:44',1,NULL,4);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,2,5);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Justement ce genre d'événement est ce qu'il manque",'2020-06-27 08:57:44',5,NULL,5);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Un grand MERCI a vous!",'2020-06-27 08:57:44',4,NULL,5);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,3,6);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Que dire de plus",'2020-06-27 08:57:44',3,NULL,6);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Le personnel nous accompagne vraiment bien!",'2020-06-27 08:57:44',2,NULL,6);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Whoaaaaaaa !",'2020-06-27 08:57:44',5,NULL,6);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,1,7);

INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Merci à tous pour votre participation !",'2020-06-27 08:57:44',NULL,1,8);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Incroyable!",'2020-06-27 08:57:44',1,NULL,8);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("J\'en perds mes mots !",'2020-06-27 08:57:44',2,NULL,8);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Quel Travail pour cet événement!",'2020-06-27 08:57:44',3,NULL,8);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("J\'espere qu'il y aura d'autre événement du meme style!",'2020-06-27 08:57:44',4,NULL,8);
INSERT INTO post (message, date, iduser, idassociation, idevent) VALUES("Regardez comment ca fonctionne bien !",'2020-06-27 08:57:44',5,NULL,8);


#------------------------------------------------------------
# Table: type
#------------------------------------------------------------

CREATE TABLE type(
        idtype Int  Auto_increment  NOT NULL ,
        name Varchar (20) NOT NULL
	,CONSTRAINT type_PK PRIMARY KEY (idtype)
)ENGINE=InnoDB;

INSERT INTO type(name) values("bug");
INSERT INTO type(name) values("note");

#------------------------------------------------------------
# Table: admin
#------------------------------------------------------------

CREATE TABLE admin(
        idadmin      Int  Auto_increment  NOT NULL ,
        login    Varchar (20) NOT NULL ,
        password Varchar (50) NOT NULL ,
        email    Varchar (50) NOT NULL
	,CONSTRAINT admin_PK PRIMARY KEY (idadmin)
)ENGINE=InnoDB;

INSERT INTO admin(login,password,email) values("admin_01","corentin","cocun91@gmail.com");
INSERT INTO admin(login,password,email) values("admin_02","matthieu","habib.matthieu1@gmail.com");
INSERT INTO admin(login,password,email) values("admin_03","thomas","t.martin92500@hotmail.fr");

#------------------------------------------------------------
# Table: feedback
#------------------------------------------------------------

CREATE TABLE feedback(
        idfeedback        Int  Auto_increment  NOT NULL ,
        title       Varchar (50) ,
        content     Text NOT NULL ,
        date        Datetime NOT NULL ,
        status      Varchar (50) ,
        idtrello    Varchar (50) ,
	      plateform   Varchar (50),
        note        Int,
        idassociation        Int ,
        idtype        Int NOT NULL ,
        iduser         Int ,
        idadmin         Int
	,CONSTRAINT feedback_PK PRIMARY KEY (idfeedback)

	,CONSTRAINT feedback_association_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
	,CONSTRAINT feedback_type0_FK FOREIGN KEY (idtype) REFERENCES type(idtype)
	,CONSTRAINT feedback_user1_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
	,CONSTRAINT feedback_admin2_FK FOREIGN KEY (idadmin) REFERENCES admin(idadmin)
)ENGINE=InnoDB;

INSERT INTO feedback(title,content,date,plateform,status,idtype,iduser) values("Launch Screen Bug","black screen during 5s on launching app",'2020-05-14 ',"ANDROID","",1,1);
INSERT INTO feedback(title,content,date,plateform,status,idtype,idassociation) values("cannot remove my account","when i remove my account they said ok but i could again connect me",'2020-02-11 08:14:56',"FLUTTER","",1,2);
INSERT INTO feedback(content,date,plateform,status,note,idtype,iduser) values("maybe that gonna be better if login button was bigger",'2020-03-11 19:54:20',"ANDROID","",4,2,2);
INSERT INTO feedback(title,content,date,plateform,status,idtype,idassociation) values("Improve the design","texts are too small",'2020-01-14 15:21:21',"ANDROID","",1,2);
INSERT INTO feedback(title,content,date,plateform,status,idtype,iduser) values("no content","no content loading on each page",'2020-04-21 22:14:45',"FLUTTER","",1,2);
INSERT INTO feedback(content,date,plateform,status,note,idtype,iduser) values("for the feedback, the submit buttom is over the screen",'2020-04-22 14:22:06',"IOS","",5,2,2);
INSERT INTO feedback(content,date,plateform,status,note,idtype,iduser) values("set a dark mode pls",'2020-06-01 17:53:51',"IOS","",4,2,3);
INSERT INTO feedback(title,content,date,plateform,status,idtype,idassociation) values("Detail asso","the detail doesn\'t display content",'2020-06-05 11:20:10',"FLUTTER","",1,2);
INSERT INTO feedback(content,date,plateform,status,note,idtype,iduser) values("colors are not the same",'2020-07-05 09:54:12',"IOS","",5,2,2);
INSERT INTO feedback(content,date,plateform,status,note,idtype,iduser) values("change the font",'2020-02-11 18:15:12',"ANDROID","",3,2,1);

#------------------------------------------------------------
# Table: follower
#------------------------------------------------------------

CREATE TABLE follower(
        idassociation Int NOT NULL ,
        iduser  Int NOT NULL
	,CONSTRAINT follower_PK PRIMARY KEY (idassociation,iduser)

	,CONSTRAINT follower_association_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
	,CONSTRAINT follower_user0_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: participation
#------------------------------------------------------------

CREATE TABLE participation(
        idevent        Int NOT NULL ,
        iduser         Int NOT NULL ,
        participate Bool ,
        status      Bool ,
        startdate   Datetime ,
        enddate     Datetime
	,CONSTRAINT participation_PK PRIMARY KEY (idevent,iduser)

	,CONSTRAINT participation_event_FK FOREIGN KEY (idevent) REFERENCES event(idevent) ON DELETE CASCADE
	,CONSTRAINT participation_user0_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
)ENGINE=InnoDB;

INSERT INTO participation(idevent,iduser,status) VALUES(1,1,1);
INSERT INTO participation(idevent,iduser,status) VALUES(1,2,1);

INSERT INTO participation(idevent,iduser,status) VALUES(2,1,1);
INSERT INTO participation(idevent,iduser,status) VALUES(2,4,1);

INSERT INTO participation(idevent,iduser,status) VALUES(3,2,1);
INSERT INTO participation(idevent,iduser,status) VALUES(3,1,1);

INSERT INTO participation(idevent,iduser,status) VALUES(4,1,1);
INSERT INTO participation(idevent,iduser,status) VALUES(4,3,1);
INSERT INTO participation(idevent,iduser,status) VALUES(4,2,1);

INSERT INTO participation(idevent,iduser,status) VALUES(5,5,1);
INSERT INTO participation(idevent,iduser,status) VALUES(5,4,1);

INSERT INTO participation(idevent,iduser,status) VALUES(6,3,1);
INSERT INTO participation(idevent,iduser,status) VALUES(6,2,1);
INSERT INTO participation(idevent,iduser,status) VALUES(6,5,1);

INSERT INTO participation(idevent,iduser,status) VALUES(8,1,1);
INSERT INTO participation(idevent,iduser,status) VALUES(8,2,1);
INSERT INTO participation(idevent,iduser,status) VALUES(8,3,1);
INSERT INTO participation(idevent,iduser,status) VALUES(8,4,1);
INSERT INTO participation(idevent,iduser,status) VALUES(8,5,1);
