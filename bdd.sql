CREATE database temp;
USE temp;

CREATE TABLE user(
        id_user          Int  Auto_increment  NOT NULL ,
        nom              Varchar (50) NOT NULL ,
        prenom           Varchar (50) NOT NULL ,
        email            Varchar (150) NOT NULL ,
        password         Varchar (50) NOT NULL ,
        inscription_date Date NOT NULL ,
        admin            Bool NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (id_user)
)