# Benevent API

This is the reference for the Benevent Node.js API, a project carried out as part of the annual 3MOC project at ESGI

Benevent is a platform of participation in associative life composed of 5 applications :

- Java
- Android
- iOS
- Flutter Web
- Node.js (This API)

This repository is running on a [Heroku](https://www.heroku.com/) server accessible at the address : [Benevent API](https://benevent-esgi.herokuapp.com/) and linked to a MySQL database hosted on a [Hostinger](https://www.hostinger.fr/) server 

## Prerequisites

- An internet connection
- https://benevent-esgi.herokuapp.com/

## Routes

### Admin

|  Field   |                     Description                     |
| :------: | :-------------------------------------------------: |
| idadmin  | The administrator unique id. :closed_lock_with_key: |
|  login   |               The administrator login               |
| password |             The administrator password              |
|  Email   |           The administrator mail address            |



#### POST

-  `https://benevent-esgi.herokuapp.com/signin/admin` : Allows an administrator to log in
  - **Body :** 
    - ``Login``
    - ``Password``



### Association

|     Field     |                    Description                    |
| :-----------: | :-----------------------------------------------: |
| idassociation | The association unique id. :closed_lock_with_key: |
|     name      |               The association name.               |
|     logo      |               The association logo.               |
|    acronym    |             The association acronym.              |
|     email     |           The association mail address.           |
|     phone     |           The association phone number.           |
|    website    |             The association website.              |
|    support    |    The association support link for donations.    |
|   password    |             The association password.             |
|  Idcategory   |       ID of the category of the association       |



#### GET

-  `https://benevent-esgi.herokuapp.com/associations` : Get all associations of the database
-  `https://benevent-esgi.herokuapp.com/association/:idassociation` : Get the association by idAssociation
-  `https://benevent-esgi.herokuapp.com/associations` : Get all associations of the database
-  `https://benevent-esgi.herokuapp.com/associations` : Get all associations of the database