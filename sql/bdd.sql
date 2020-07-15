#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        iduser        Int  Auto_increment NOT NULL ,
        name          Varchar (50) NOT NULL ,
        firstname     Varchar (50) NOT NULL ,
	age	      Date NOT NULL ,
        email         Varchar (100) NOT NULL UNIQUE ,
	password      Varchar (50) NOT NULL ,
        phone         Varchar (12) ,
        profilpicture Varchar (255)
        ,CONSTRAINT user_PK PRIMARY KEY (iduser)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE category(
        idcategory    Int  Auto_increment  NOT NULL ,
        name          Varchar (255) NOT NULL
	,CONSTRAINT category_PK PRIMARY KEY (idcategory)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: association
#------------------------------------------------------------

CREATE TABLE association(
        idassociation Int  Auto_increment  NOT NULL ,
        name          Varchar (50) NOT NULL UNIQUE,
        logo          Varchar (255) ,
        acronym       Varchar (50) ,
        email         Varchar (50) NOT NULL UNIQUE,
        phone         Varchar (12) ,
        website       Varchar (250) ,
        support       Varchar (250) ,
        password      Varchar (50) NOT NULL ,
        idcategory    Int NOT NULL
	,CONSTRAINT association_PK PRIMARY KEY (idassociation)

	,CONSTRAINT association_category_FK FOREIGN KEY (idcategory) REFERENCES category(idcategory)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: event
#------------------------------------------------------------

CREATE TABLE event(
        idevent       Int  Auto_increment  NOT NULL ,
        name          Varchar (30) NOT NULL ,
        description   Varchar (255) NOT NULL ,
        dateDeb       Datetime NOT NULL ,
        dateFin       Datetime NOT NULL,
        location      Varchar (255) NOT NULL ,
        maxBenevole   Int NOT NULL ,
        idcategory    Int NOT NULL ,
        idassociation Int NOT NULL ,
        fakeevent     Bool
	,CONSTRAINT event_PK PRIMARY KEY (idevent)

	,CONSTRAINT event_category_FK FOREIGN KEY (idcategory) REFERENCES category(idcategory)
	,CONSTRAINT event_association0_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: posts
#------------------------------------------------------------

CREATE TABLE post(
        idpost        Int  Auto_increment  NOT NULL ,
        message       Varchar (255) ,
        date          Datetime NOT NULL ,
        iduser        Int ,
        idassociation Int ,
        idevent       Int NOT NULL
	,CONSTRAINT post_PK PRIMARY KEY (idpost)

	,CONSTRAINT post_user_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
	,CONSTRAINT post_association0_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
	,CONSTRAINT post_event1_FK FOREIGN KEY (idevent) REFERENCES event(idevent) ON DELETE CASCADE
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: type
#------------------------------------------------------------

CREATE TABLE type(
        idtype        Int  Auto_increment  NOT NULL ,
        name          Varchar (20) NOT NULL
	,CONSTRAINT type_PK PRIMARY KEY (idtype)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: admin
#------------------------------------------------------------

CREATE TABLE admin(
        idadmin      Int  Auto_increment  NOT NULL ,
        login        Varchar (20) NOT NULL ,
        password     Varchar (50) NOT NULL ,
        email        Varchar (50) NOT NULL
	,CONSTRAINT admin_PK PRIMARY KEY (idadmin)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: feedback
#------------------------------------------------------------

CREATE TABLE feedback(
        idfeedback   Int  Auto_increment  NOT NULL ,
        title        Varchar (50) ,
        content      Text NOT NULL ,
        date         Datetime NOT NULL ,
        status       Varchar (50) ,
        idtrello     Varchar (50) ,
	plateform    Varchar (50),
        note         Int,
        idassociation Int ,
        idtype       Int NOT NULL ,
        iduser       Int ,
        idadmin      Int
	,CONSTRAINT feedback_PK PRIMARY KEY (idfeedback)

	,CONSTRAINT feedback_association_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
	,CONSTRAINT feedback_type0_FK FOREIGN KEY (idtype) REFERENCES type(idtype)
	,CONSTRAINT feedback_user1_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
	,CONSTRAINT feedback_admin2_FK FOREIGN KEY (idadmin) REFERENCES admin(idadmin)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: follower
#------------------------------------------------------------

CREATE TABLE follower(
        idassociation Int NOT NULL ,
        iduser       Int NOT NULL
	,CONSTRAINT follower_PK PRIMARY KEY (idassociation,iduser)

	,CONSTRAINT follower_association_FK FOREIGN KEY (idassociation) REFERENCES association(idassociation) ON DELETE CASCADE
	,CONSTRAINT follower_user0_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: participation
#------------------------------------------------------------

CREATE TABLE participation(
        idevent      Int NOT NULL ,
        iduser       Int NOT NULL ,
        participate  Bool ,
        status       Bool ,
        startdate    Datetime ,
        enddate      Datetime
	,CONSTRAINT participation_PK PRIMARY KEY (idevent,iduser)

	,CONSTRAINT participation_event_FK FOREIGN KEY (idevent) REFERENCES event(idevent) ON DELETE CASCADE
	,CONSTRAINT participation_user0_FK FOREIGN KEY (iduser) REFERENCES user(iduser) ON DELETE CASCADE
)ENGINE=InnoDB;