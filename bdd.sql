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
        email         Varchar (100) NOT NULL ,
		password	  Varchar (50) NOT NULL ,
        phone         Varchar (12) ,
        profilpicture Blob ,
        address       Text NOT NULL ,
        description   Text NOT NULL 
	,CONSTRAINT user_PK PRIMARY KEY (idu)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE category(
        idcat Int  Auto_increment  NOT NULL ,
        name  Varchar (255) NOT NULL
	,CONSTRAINT category_PK PRIMARY KEY (idcat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: association
#------------------------------------------------------------

CREATE TABLE association(
        idas    	Int  Auto_increment  NOT NULL ,
        name    	Varchar (50) NOT NULL ,
        logo    	Blob ,
        acronym 	Varchar (50) ,
        email       Varchar (100) NOT NULL ,
		password	Varchar (50) NOT NULL ,
        phone   	Varchar (50) NOT NULL ,
        website 	Varchar (50) NOT NULL ,
        support 	Varchar (50) NOT NULL ,
        idcat   	Int NOT NULL
	,CONSTRAINT association_PK PRIMARY KEY (idas)

	,CONSTRAINT association_category_FK FOREIGN KEY (idcat) REFERENCES category(idcat)
)ENGINE=InnoDB;


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


#------------------------------------------------------------
# Table: feedback
#------------------------------------------------------------

CREATE TABLE feedback(
        idfe    Int  Auto_increment  NOT NULL ,
        title   Varchar (50) NOT NULL ,
        content Text NOT NULL ,
        date    Datetime NOT NULL ,
        idas    Int ,
        idty    Int NOT NULL ,
        idu     Int
	,CONSTRAINT feedback_PK PRIMARY KEY (idfe)

	,CONSTRAINT feedback_association_FK FOREIGN KEY (idas) REFERENCES association(idas)
	,CONSTRAINT feedback_type0_FK FOREIGN KEY (idty) REFERENCES type(idty)
	,CONSTRAINT feedback_user1_FK FOREIGN KEY (idu) REFERENCES user(idu)
)ENGINE=InnoDB;


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
        status      Bool NOT NULL
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

