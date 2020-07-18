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

## Routes

### Admin

|  Field   |                     Description                     |  Type  |
| :------: | :-------------------------------------------------: | :----: |
| idadmin  | The administrator unique id. :closed_lock_with_key: |  Int   |
|  login   |               The administrator login               | String |
| password |             The administrator password              | String |
|  Email   |           The administrator mail address            | String |



##### POST

 `https://benevent-esgi.herokuapp.com/signin/admin`  Allows an administrator to log in :

- **Body :** 
  - ``Login``
  - ``Password``



### Association

|     Field     |                     Description                      |  Type  |
| :-----------: | :--------------------------------------------------: | :----: |
| idassociation |  The association unique id. :closed_lock_with_key:   |  Int   |
|     name      |                The association name.                 | String |
|     logo      |                The association logo.                 | String |
|    acronym    |               The association acronym.               | String |
|     email     |            The association mail address.             | String |
|     phone     |            The association phone number.             | String |
|    website    |               The association website.               | String |
|    support    |     The association support link for donations.      | String |
|   password    |              The association password.               | String |
|  idcategory   | Category ID of the category of the association :key: |  Int   |



##### GET

 `https://benevent-esgi.herokuapp.com/associations`  Get all associations of the database

 `https://benevent-esgi.herokuapp.com/association/:idassociation`  Get the association by idAssociation

 `https://benevent-esgi.herokuapp.com//association/details/:idassociation`  Get an association by idAssociation (Stringifyed)

 `https://benevent-esgi.herokuapp.com/associations/category/:idcategory`  Get associations by a category



##### POST

 `https://benevent-esgi.herokuapp.com/signup/association` Create an association :

- **Body :** 
  - ``Name``
  - ``Email``
  - ``Password``
  - ``Logo``
  - ``idcategory``

 `https://benevent-esgi.herokuapp.com/signin/association` Allows an association to log in:

- **Body :** 

  - ``Email``
  - ``Password

  

##### PATCH

 `https://benevent-esgi.herokuapp.com/association/:idassociation` Update an association by idAssociation :

- **Body :** 
  - ``Name``
  - ``Email``
  - ``Phone``
  - ``Website``
  - ``Support``
  - ``Acronym``
  - ``Logo``



##### DELETE

 `https://benevent-esgi.herokuapp.com/association/:idassociation`  Delete an association by idAssociation



### Category

|   Field    |                      Description                      |  Type  |
| :--------: | :---------------------------------------------------: | :----: |
| idcategory | The unique id of the category. :closed_lock_with_key: |  Int   |
|    name    |               The name of the category.               | String |

##### GET

 `https://benevent-esgi.herokuapp.com/categories`  Get all categories of the database

 `https://benevent-esgi.herokuapp.com/category/:idcategory`  Get a category by idCategory



### Event

|     Field     |                    Description                     |  Type  |
| :-----------: | :------------------------------------------------: | :----: |
|    Idevent    | The unique id of the event. :closed_lock_with_key: |  Int   |
|     name      |               The name of the event.               | String |
|  description  |           The description of the event.            | String |
|    dateDeb    |            The start date of the event.            |  Date  |
|    dateFin    |             The end date of the event.             |  Date  |
|   location    |             The location of the event.             | String |
|  maxBenevole  |   The maximum number of volunteers of the event    |  Int   |
|   fakeevent   |      ``true`` if the event is fake (No event)      |  Bool  |
|  idcategory   |       ID of the category of the event. :key:       |  Int   |
| idassociation |  ID of the association owner of the event. :key:   |  Int   |



##### GET

 `https://benevent-esgi.herokuapp.com/event/:idevent`  Get an event by idEvent

 `https://benevent-esgi.herokuapp.com/events/user/:iduser`  Get all events where the user is concerned by idUser

 `https://benevent-esgi.herokuapp.com/events/association/:idassociation`  Get all events of an association by idAssociation



##### POST

 `https://benevent-esgi.herokuapp.com/event` Create an event :

- **Body :** 
  - ``Name``
  - ``Description``
  - ``dateDeb``
  - ``dateFin``
  - ``Location``
  - ``maxBenevole``
  - ``idcategory``
  - `ìdassociation`

##### PATCH

 `https://benevent-esgi.herokuapp.com/event/:idevent` Update an event by idEvent :

- **Body :** 
  - ``Name``
  - ``Description``
  - ``dateDeb``
  - ``dateFin``
  - ``Location``
  - ``maxBenevole``



##### DELETE

 `https://benevent-esgi.herokuapp.com/event/:idevent`  Delete an event by idEvent



### Feedback

|     Field     |                         Description                          |  Type  |
| :-----------: | :----------------------------------------------------------: | :----: |
|  idfeedback   |    The unique id of the feedback. :closed_lock_with_key:     |  Int   |
|     title     |     The title of the feedback. *(Only for bug feedback)*     | String |
|    content    |                 The content of the feedback.                 | String |
|     date      |                  The date of the feedback.                   |  Date  |
|    status     |                The progress of the feedback.                 | String |
|   idtrello    |             The Trello Card ID of the feedback.              | String |
|   platform   |      Identify from wich application the feedback comes.      | String |
|     note      |     Rating of the app on 5 *(Only for rating feedback)*      |  Int   |
| idassociation | ID of the association wich makes the feedback *(Only for iOS & Flutter platform)* :key: |  Int   |
|    idtype     |            ID of the type of the feedback. :key:             |  Int   |
|    iduser     | ID of the user wich makes the feedback *(Only for Android & Flutter platform) :key:* |  Int   |
|    idadmin    |  ID of the administrator who processed the feedback. :key:   |  Int   |



##### GET

 `https://benevent-esgi.herokuapp.com/feedback/:idtype`  Get all feedback of a type by idType



##### POST

 `https://benevent-esgi.herokuapp.com/feedback/bug` Create a new bug feedback

- **Body :** 
  - ``Title``
  - ``Content``
  - ``Date``
  - ``Platform``
  - ``idType``
  - ``idUser``
  - `idAssociation`

 `https://benevent-esgi.herokuapp.com/feedback/rating` Create a new rating feedback

- **Body :** 
  - ``Content``
  - ``Date``
  - ``Platform``
  - ``idType``
  - ``idUser``
  - `idAssociation`
  - `Note`

##### PUT

 `https://benevent-esgi.herokuapp.com/feedback/:idfeedback` Update a feedback by idFeeback :

- **Body :** 
  - ``Status``



### Follow

|     Field     |              Description               | Type |
| :-----------: | :------------------------------------: | :--: |
| idassociation | ID of the followed association.  :key: | Int  |
|    Iduser     |       ID of the follower. :key:        | Int  |



##### GET

 `https://benevent-esgi.herokuapp.com/follow/:idassociation/:iduser` Get all associations followed by an user by idUser and idAssociation



##### POST

 `https://benevent-esgi.herokuapp.com/follow` Allows an user to follow an association

- **Body :** 
  - ``idAssociation``
  - ``idUser``



##### DELETE

 `https://benevent-esgi.herokuapp.com/unfollow` Allows an user to unfollow an association

- **Body :** 
  - ``idAssociation``
  - ``idUser``



### News

|  Field  |                Description                 |  Type  |
| :-----: | :----------------------------------------: | :----: |
| idnews  | The news unique id. :closed_lock_with_key: |  Int   |
|  title  |               The news title               | String |
| content |          The content of the news           | String |



##### POST

 `https://benevent-esgi.herokuapp.com/news`  Allows an admin to create a news :

- **Body :** 
  - ``Title``
  - ``Content``
  - ``Date``



### Participation

|    Field    |                   Description                   | Type |
| :---------: | :---------------------------------------------: | :--: |
|   idevent   |             ID of the event.  :key:             | Int  |
|   iduser    |              ID of the user :key:               | Int  |
| participate | ``true`` if the user is registered to the event | Bool |
|   status    |       ``true``if the user is on the event       | Bool |
|  startdate  |       Enter date of the user on the event       | Date |
|   enddate   |       Exit date of the user on the event        | Date |



##### GET

 `https://benevent-esgi.herokuapp.com/participate/:idevent/:iduser` Get the participation of an user on an event

`https://benevent-esgi.herokuapp.com/participants/:idevent` Get all users on an event



##### POST

 `https://benevent-esgi.herokuapp.com/participate` Allows an user to register to an event

- **Body :** 
  - ``idEvent``
  - ``idUser``
  - ``participate``
  - ``status``



##### PATCH

 `https://benevent-esgi.herokuapp.com/participate/refuse` Allows an user to unregistered him from an event

- **Body :** 
  - ``idEvent``
  - ``idUser``
  - ``participate``
  - ``status``

 `https://benevent-esgi.herokuapp.com/participate/status` Allows an user to enter on an event

- **Body :** 
  - ``idEvent``
  - ``idUser``
  - ``participate``
  - ``status``
  - ``startDate``
  - ``endDate``



### Post

|     Field     |                   Description                   |  Type  |
| :-----------: | :---------------------------------------------: | :----: |
|    idpost     |     ID of the post.  :closed_lock_with_key:     |  Int   |
|    message    |               Content of the post               | String |
|     date      |                Date of the post.                |  Date  |
|    iduser     |  ID of the user who's publish the post. :key:   |  Int   |
| idassociation | ID of the association owner of the event. :key: |  Int   |
|    idevent    |        ID of the event of the post :key:        |  Int   |



##### GET

 `https://benevent-esgi.herokuapp.com/posts/:iduser` Get all posts wich concerns an user

`https://benevent-esgi.herokuapp.com/posts/association/:idassociation` Get all posts wich concerns an association

`https://benevent-esgi.herokuapp.com/posts/:idassociation` Get all posts of an association



##### POST

 `https://benevent-esgi.herokuapp.com/post/association` Allows an association to create a post

- **Body :** 
  - ``idEvent``
  - ``idAssociation``
  - ``Message``
  - ``Date``

 `https://benevent-esgi.herokuapp.com/post/user`  Allows an user to create a post

- **Body :** 
  - ``idEvent``
  - ``idUser``
  - ``Message``
  - ``Date``



##### DELETE

 `https://benevent-esgi.herokuapp.com/post/:idpost` Delete a post by idPost



### User

|     Field     |               Description               |  Type  |
| :-----------: | :-------------------------------------: | :----: |
|    iduser     | ID of the user.  :closed_lock_with_key: |  Int   |
|     name      |            Name of the user             | String |
|   firstname   |         First name of the user          | String |
|      age      |         Birth date of the user          |  Date  |
|     email     |        Mail address of the user         | String |
|   password    |          Password of the user           | String |
|     phone     |        Phone number of the user         | String |
| profilpicture |       Profil picture of the user        | String |



##### GET

 `https://benevent-esgi.herokuapp.com/users` Get all users in the database

`https://benevent-esgi.herokuapp.com/user/:iduser` Get an user by idUser

`https://benevent-esgi.herokuapp.com/user/detail/:iduser` Get an user by idUser (Stringifyed)

`https://benevent-esgi.herokuapp.com/users/association/:idassociation` Get all users concerned by an association by idAssociation



##### POST

 `https://benevent-esgi.herokuapp.com/signup/user` Allows an association create an account 

- **Body :** 

  - ``Name``

  - ``FirstName``

  - ``Age``

  - ``Email``

  - ``Password``

  - ``Phone``

  - ``ProfilPicture``

    

 `https://benevent-esgi.herokuapp.com/signin/user` Allows an user to log in

- **Body :** 
  - ``Email``
  - ``Password



##### PATCH

 `https://benevent-esgi.herokuapp.com/user/:iduser` Update an user by idUser

- **Body :** 

  - ``Name``

  - ``FirstName``

  - ``Phone``

  - ``ProfilPicture``

    

##### DELETE

 `https://benevent-esgi.herokuapp.com/user/:iduser` Delete an user by idUser



