#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        idu           Int  Auto_increment  NOT NULL ,
        name          Varchar (50) NOT NULL ,
        firstname     Varchar (50) NOT NULL ,
		age			Date NOT NULL,
        email         Varchar (100) NOT NULL UNIQUE,
		password      Varchar (50) NOT NULL,
        phone         Varchar(12) ,
        profilpicture Blob ,
        address       Text ,
        description   Varchar (250)         
	,CONSTRAINT user_PK PRIMARY KEY (idu)
)ENGINE=InnoDB;

INSERT INTO user(name,firstname,age,email,password) values("test","test","1998-03-19","test@test.fr","test");
INSERT INTO user(name,firstname,age,email,password) values("John","Doe","1988-05-28","jd@test.fr","JohnDoe");

#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE category(
        idcat Int  Auto_increment  NOT NULL ,
        name  Varchar (255) NOT NULL
	,CONSTRAINT category_PK PRIMARY KEY (idcat)
)ENGINE=InnoDB;
INSERT INTO category(name) values("festival");
INSERT INTO category(name) values("humanitary");
INSERT INTO category(name) values("homeless");

#------------------------------------------------------------
# Table: association
#------------------------------------------------------------

CREATE TABLE association(
        idas     Int  Auto_increment  NOT NULL ,
        name     Varchar (50) NOT NULL UNIQUE,
        logo     Blob ,
        acronym  Varchar (50) ,
        email    Varchar (50) NOT NULL UNIQUE,
        phone    Varchar (12) ,
        website  Varchar (50) ,
        support  Varchar (50) ,
        password Varchar (50) NOT NULL ,
        idcat    Int NOT NULL
	,CONSTRAINT association_PK PRIMARY KEY (idas)

	,CONSTRAINT association_category_FK FOREIGN KEY (idcat) REFERENCES category(idcat)
)ENGINE=InnoDB;

INSERT INTO association(name,email,password,idcat) values("test","test@test.fr","test",1);
INSERT INTO association(name,email,password,idcat) values("Benevolat","bene@test.fr","Benevolat",2);

#------------------------------------------------------------
# Table: event
#------------------------------------------------------------

CREATE TABLE event(
        idev        Int  Auto_increment  NOT NULL ,
        name        Varchar (30) NOT NULL ,
        description Varchar (255) NOT NULL ,
        date        Datetime NOT NULL ,
        location    Varchar (255) NOT NULL ,
        maxbenevole Int NOT NULL ,
        duration    Varchar (255) NOT NULL ,
        idcat       Int NOT NULL ,
        idas        Int NOT NULL
	,CONSTRAINT event_PK PRIMARY KEY (idev)

	,CONSTRAINT event_category_FK FOREIGN KEY (idcat) REFERENCES category(idcat)
	,CONSTRAINT event_association0_FK FOREIGN KEY (idas) REFERENCES association(idas)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: posts
#------------------------------------------------------------

CREATE TABLE posts(
        idpo    Int  Auto_increment  NOT NULL ,
        message Varchar (255) ,
        date    Datetime NOT NULL ,
        idu     Int ,
        idas    Int ,
        idev    Int NOT NULL
	,CONSTRAINT posts_PK PRIMARY KEY (idpo)

	,CONSTRAINT posts_user_FK FOREIGN KEY (idu) REFERENCES user(idu)
	,CONSTRAINT posts_association0_FK FOREIGN KEY (idas) REFERENCES association(idas)
	,CONSTRAINT posts_event1_FK FOREIGN KEY (idev) REFERENCES event(idev)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: media
#------------------------------------------------------------

CREATE TABLE media(
        idme    Int  Auto_increment  NOT NULL ,
        name    Varchar (255) NOT NULL ,
        element Blob NOT NULL ,
        idpo    Int NOT NULL
	,CONSTRAINT media_PK PRIMARY KEY (idme)

	,CONSTRAINT media_posts_FK FOREIGN KEY (idpo) REFERENCES posts(idpo)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type
#------------------------------------------------------------

CREATE TABLE type(
        idty Int  Auto_increment  NOT NULL ,
        name Varchar (20) NOT NULL
	,CONSTRAINT type_PK PRIMARY KEY (idty)
)ENGINE=InnoDB;
INSERT INTO type(name) values("bug");
INSERT INTO type(name) values("improvement");

#------------------------------------------------------------
# Table: admin
#------------------------------------------------------------

CREATE TABLE admin(
        ida      Int  Auto_increment  NOT NULL ,
        login    Varchar (20) NOT NULL ,
        password Varchar (50) NOT NULL ,
        email    Varchar (50) NOT NULL
	,CONSTRAINT admin_PK PRIMARY KEY (ida)
)ENGINE=InnoDB;

INSERT INTO admin(login,password,email) values("admin_01","corentin","cocun91@gmail.com");
INSERT INTO admin(login,password,email) values("admin_02","matthieu","habib.matthieu1@gmail.com");
INSERT INTO admin(login,password,email) values("admin_03","thomas","t.martin92500@hotmail.fr");

#------------------------------------------------------------
# Table: feedback
#------------------------------------------------------------

CREATE TABLE feedback(
        idfe    Int  Auto_increment  NOT NULL ,
        title   Varchar (50) NOT NULL ,
        content Text NOT NULL ,
        date    Datetime NOT NULL ,
        status  Varchar (50) NOT NULL ,
        idtrello Varchar (50) ,
        idas    Int ,
        idty    Int NOT NULL ,
        idu     Int ,
        ida     Int
	,CONSTRAINT feedback_PK PRIMARY KEY (idfe)

	,CONSTRAINT feedback_association_FK FOREIGN KEY (idas) REFERENCES association(idas)
	,CONSTRAINT feedback_type0_FK FOREIGN KEY (idty) REFERENCES type(idty)
	,CONSTRAINT feedback_user1_FK FOREIGN KEY (idu) REFERENCES user(idu)
	,CONSTRAINT feedback_admin2_FK FOREIGN KEY (ida) REFERENCES admin(ida)
)ENGINE=InnoDB;

INSERT INTO feedback(title,content,date,status,idty,idu) values("Launch Screen Bug","black screen during 5s on launching app",sysdate(),"",1,1);
INSERT INTO feedback(title,content,date,status,idty,idas) values("cannot remove my account","when i remove my account they said ok but i could again connect me",sysdate(),"",1,2);
INSERT INTO feedback(title,content,date,status,idty,idu) values("improvement of login screen","maybe that gonna be better if login button was bigger",sysdate(),"",2,2);

#------------------------------------------------------------
# Table: followers
#------------------------------------------------------------

CREATE TABLE followers(
        idas Int NOT NULL ,
        idu  Int NOT NULL
	,CONSTRAINT followers_PK PRIMARY KEY (idas,idu)

	,CONSTRAINT followers_association_FK FOREIGN KEY (idas) REFERENCES association(idas)
	,CONSTRAINT followers_user0_FK FOREIGN KEY (idu) REFERENCES user(idu)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: participation
#------------------------------------------------------------

CREATE TABLE participation(
        idev        Int NOT NULL ,
        idu         Int NOT NULL ,
        participate Bool NOT NULL ,
        status      Bool NOT NULL ,
        startdate   Datetime NOT NULL ,
        enddate     Datetime NOT NULL
	,CONSTRAINT participation_PK PRIMARY KEY (idev,idu)

	,CONSTRAINT participation_event_FK FOREIGN KEY (idev) REFERENCES event(idev)
	,CONSTRAINT participation_user0_FK FOREIGN KEY (idu) REFERENCES user(idu)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: interest
#------------------------------------------------------------

CREATE TABLE interest(
        idev Int NOT NULL ,
        idu  Int NOT NULL
	,CONSTRAINT interest_PK PRIMARY KEY (idev,idu)

	,CONSTRAINT interest_event_FK FOREIGN KEY (idev) REFERENCES event(idev)
	,CONSTRAINT interest_user0_FK FOREIGN KEY (idu) REFERENCES user(idu)
)ENGINE=InnoDB;


