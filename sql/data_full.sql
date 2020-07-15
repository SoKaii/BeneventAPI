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

#------------------------------------------------------------------------------------
# Data user
#------------------------------------------------------------------------------------

INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Gomez", "Marie", "1998-07-05", "mg@example.fr", "415c2b121ab5f8dfc454924e769a8", "https://randomuser.me/api/portraits/women/37.jpg", "0684512377");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Doe", "John", "1992-04-08", "jd@example.fr", "9fd9f63ed648753756975da85ac7f", "https://randomuser.me/api/portraits/men/79.jpg", "+33612141512");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Richeux", "Pierre", "1984-01-17", "pr@example.fr", "c461d7183f8e86309d3c6591246c87b", "https://randomuser.me/api/portraits/men/21.jpg", "0777455584");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Sylla", "Mohammed", "1994-04-07", "ms@example.fr", "dca1483260cb39fedb5bbbd0010e3", "https://randomuser.me/api/portraits/men/91.jpg", "+33664784313");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Vignaux", "Josephine", "1979-10-22", "jv@example.fr", "bb4046baebff7766a4b0a3e4525a0ae", "https://randomuser.me/api/portraits/women/61.jpg", "0114575646");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Marie", "Léa", "1992-12-30", "lm@example.fr", "385b96a277f1827fcca9cb08b5497e2", "https://randomuser.me/api/portraits/women/54.jpg", "0665544889");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Martin", "Stéphane", "2000-04-11", "sm@example.fr", "d9f38807fbd2e0a67269608f3e853e", "https://randomuser.me/api/portraits/men/1.jpg", "+33773135648");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Lescota", "Rachid", "1981-09-24", "rl@example.fr", "2b9b50cd274b9e31728d9417bf5a283", "https://randomuser.me/api/portraits/men/87.jpg", "0664444213");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Gilles", "Maurice", "1997-04-14", "mg1@example.fr", "dcf2ef4e6c637dac65f4dec6f4d83ce", "https://randomuser.me/api/portraits/men/50.jpg", "0764674821");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Thomas", "Habiba", "1979-07-23", "ht@example.fr", "cd86705e2855b3699c4056ca5479ef12", "https://randomuser.me/api/portraits/women/9.jpg", "0684566641");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Diouf", "Moussa", "1985-05-17", "md@example.fr", "38dcb0af434584bf027e763be32ddcf", "https://randomuser.me/api/portraits/women/9.jpg", "0778949193");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Sulemankhel", "Changiz", "1980-07-09", "cs@example.fr", "f530ba4bbad49d964137efcce9b17d", "https://randomuser.me/api/portraits/men/56.jpg", "0774599431");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Nasri", "Karima", "1984-04-04", "kn@example.fr", "5e65629c14703847ffffc3a3f2423b16", "https://randomuser.me/api/portraits/women/38.jpg", "0148488746");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Soverighncamapnh", "Vyacheslavovna", "1997-07-08", "vs@example.fr", "cae6ec8bd7d767e2ed67427b48c5669","https://randomuser.me/api/portraits/women/4.jpg", "0665570909");
INSERT INTO user(name,firstname,age,email,password,profilpicture,phone) values("Chambers", "Laurie", "1999-11-23", "lc@example.fr", "e2ec5cb128949e45d1de902e31bcec12", "https://randomuser.me/api/portraits/women/80.jpg", "0774486421");

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
# Data association
#------------------------------------------------------------------------------------

INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Société protectrice des animaux", "https://nsa40.casimages.com/img/2020/07/06/200706065034511321.png", "SPA", "spa@spa.fr", "0123456789", "https://www.la-spa.fr/", "https://soutenir.la-spa.fr/b/mon-don", "a2717b7a0bb58ebb98dcfecb16c7f040", 1);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Fonds Mondiale pour la Nature", "https://nsa40.casimages.com/img/2020/07/15/200715042554538391.png", "WWF", "wwf@wwf.fr", "+33171864060", "https://www.wwf.fr/", "https://faireundon.wwf.fr/b/mon-don", "baaff542ea06bcd1bdf90471d562e07d", 1);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Ligue Française de la Protection du Cheval", "https://nsa40.casimages.com/img/2020/07/15/200715043948914120.jpg", "LFPC", "lpfc@lfpc.fr", "0144933007", "http://lfpcheval.fr/", "http://lfpc.eu/", "abcacb5574a368c35990fcbcbae1732c", 1);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Bibliocité", "https://nsa40.casimages.com/img/2020/07/15/200715054938941872.png", "BBC", "bbc@bbc.fr", "+33144788050", "https://www.bibliocite.fr/", "https://www.bibliocite.fr/louer-une-exposition/", "84fcfe040a982921cf502a6f8889f95d", 2);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Agir pour l'environnement", "https://nsa40.casimages.com/img/2020/07/06/200706065034827123.png", "APE", "ape@ape.fr", "0140310237", "https://www.agirpourlenvironnement.org/", "https://soutenir.agirpourlenvironnement.org/b/mon-don", "52bc0bc76a691c245158ee9762a9d617", 3);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Planete Urgence", "https://nsa40.casimages.com/img/2020/07/15/200715051232544519.jpg", "PU", "pu@pu.fr", "0123456789", "https://planete-urgence.org/", "https://planete-urgence.org/planter-un-arbre/", "d21abf809078df7320f58886fd63958b", 3);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Les Amis de la Terre", "https://nsa40.casimages.com/img/2020/07/15/20071505163157981.jpg", "LAT", "lat@lat.fr", "0148513222", "https://www.amisdelaterre.org/", "https://don.amisdelaterre.org/adherer-web/~mon-don", "0275f3269f9ee4f518e6f024fdc700ab", 3);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Croix-Rouge", "https://nsa40.casimages.com/img/2020/06/25/20062511235323873.jpg", "CR", "cr@cr.fr", "0144431100", "https://www.croix-rouge.fr/", "https://donner.croix-rouge.fr/faire-un-don", "db8296239f907cabfeec7b105d7328fe", 4);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Medecin Sans Frontiere", "https://nsa40.casimages.com/img/2020/07/06/200706065034573482.png", "MSF", "msf@msf.fr", "+33140212929", "https://www.msf.fr/", "https://soutenir.msf.fr/b/mon-don", "18cd883fbd62ee8c55257f22bdacbc02", 4);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Fondation Abbé Pierre", "https://nsa40.casimages.com/img/2020/07/15/200715052309756559.jpg", "FAB", "fab@fab.fr", "0155563700", "https://www.fondation-abbe-pierre.fr/", "https://don.fondationabbepierre.org/b/mon-don", "bf5f775aa2510cd1fa494472fb4ea6b7", 4);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("Musique Pour Tous", "https://nsa40.casimages.com/img/2020/07/15/200715053104754852.jpg", "MPT", "mpt@mpt.fr", "0617576218", "https://www.musique-pour-tous.org/", "https://www.musique-pour-tous.org/faq/", "591ab32d078b3f2f1d2b8a9c64d0321e", 5);
INSERT INTO association(name, logo, acronym, email, phone, website, support, password, idcategory) values("France Esports", "https://nsa40.casimages.com/img/2020/07/15/200715054054149554.jpg", "FE", "fe@fe.fr","0123456789", "https://www.france-esports.org/", "https://www.france-esports.org/adherer/demande-adhesion-en-tant-que-sympathisant/", "2f4ca8ed540bbaa71b4fab2f118599eb", 6);

#------------------------------------------------------------------------------------
# Data event
#------------------------------------------------------------------------------------

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Marche contre l'abandon", "L’abandon sur la voie publique ou dans la nature est puni par la loi. Pourtant, en France la SPA recueille près de 42 k animaux par an dont environ 10 k l’été. Venez marcher avec nous cet été pour lutter contre ces abandons !", "2020-06-15 10:00:00", "2020-06-15 21:00:00", "Place de la République, Paris 11ème", 2000, 1, 1, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Journée de la sensibilisation", "Avec environ 42 000 animaux abandonnés chaque année, de nombreux animaux sont délaisser dans des états déplorables. Pour sensibiliser un maximum de monde, l'un de nos refuges vous ouvres ces portes !", "2020-06-30 13:00:00", "2020-06-30 18:00:00", "30, avenue du Général de Gaulle, 92230", 100, 1, 1, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Journée en immersion (Vaux-Le-Pénil)", "La SPA oeuvre depuis plus de 170 ans pour la protection animal. Vous avez toujours rêver de faire parti de cette grande oeuvre ? La SPA propose une journée en immersion avec nos professionnels !", "2020-07-22 08:00:00", "2020-07-22 18:00:00", "Lieu dit Les Près Neufs, 77000, Refuge de Vaux Le Pénil", 10, 1, 1, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Journée en immersion (Genevilliers)", "La SPA oeuvre depuis plus de 170 ans pour la protection animal. Vous avez toujours rêver de faire parti de cette grande oeuvre ? La SPA propose une journée en immersion avec nos professionnels !", "2020-07-22 08:00:00", "2020-07-22 18:00:00", "30, avenue du Général de Gaulle, 92230, Refuge Grammont", 10, 1, 1, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Récoltes de dons (Niort)", "Avec ses 62 refuges dans la France et ses 42 000 animaux, la SPA à besoin de ressources pour subvenir aux besoins de nos amis à poils. Pour cela nous faisait appel à votre générosité pour donner sans compter !", "2020-08-15 08:00:00", "2020-08-16 20:00:00", "22, avenue Jacques Bujault, 79000, Maison SPA de Niort", 500, 1, 1, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("Récoltes de dons (Bordeaux)", "Avec ses 62 refuges dans la France et ses 42 000 animaux, la SPA à besoin de ressources pour subvenir aux besoins de nos amis à poils. Pour cela nous faisait appel à votre générosité pour donner sans compter !", "2020-08-17 08:00:00", "2020-08-18 22:00:00", "64, rue Fondaudege, 33000, Maison SPA de Bordeaux", 500, 1, 1, false);

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES('Conférence "Mieux agir ensemble"', "Alimentation, transport, énergie, il n'existe pas de petits changements, seulement de bonnes habitudes. Nos choix en tant que consommateur, chef d'entreprise, employé ou citoyen responsable peuvent faire la différence. Nous avons le pouvoir d'agir !", "2020-05-31 14:00:00", "2020-05-31 17:00:00", "55 Rue de la Chapelle, 75018, Deskéo La chapelle", 130, 1, 2, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("PANDATHLON ALPE D'HUEZ 2020", "Une course outdoor ET fun ET écolo ET solidaire. Rien que ça. En 2020, nous vous donnons rendez-vous le 27 et 28 juin à l'Alpe du Huez pour une course d'orientation en pleine montagne.", "2020-06-27 08:00:00", "2020-06-28 18:00:00", "Place Joseph Paganon, 38750, Station Alpe d'Huez", 1500, 1, 2, false);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();

INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES();


INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 1, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 2, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 3, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 4, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 5, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 6, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 7, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 8, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 9, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 10, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 11, true);
INSERT INTO event(name,description,dateDeb,dateFin,location,maxBenevole,idcategory,idassociation,fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 12, true);

#------------------------------------------------------------------------------------
# Data post
#------------------------------------------------------------------------------------

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

INSERT INTO type(name) values("bug");
INSERT INTO type(name) values("note");

INSERT INTO admin(login,password,email) values("admin_01","corentin","cocun91@gmail.com");
INSERT INTO admin(login,password,email) values("admin_02","matthieu","habib.matthieu1@gmail.com");
INSERT INTO admin(login,password,email) values("admin_03","thomas","t.martin92500@hotmail.fr");

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