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

#### POST

-  `https://benevent-esgi.herokuapp.com/signin/admin` : Allows an administrator to log in
  - **Body :** 
    - Login
    - Password