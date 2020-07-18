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
# Data user
#------------------------------------------------------------------------------------
 
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Gomez", "Marie", "1998-07-05", "mg@example.fr", "415c2b121ab5f8dfc454924e769a8", "https://randomuser.me/api/portraits/women/37.jpg", "0684512377");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Doe", "John", "1992-04-08", "jd@example.fr", "9fd9f63ed648753756975da85ac7f", "https://randomuser.me/api/portraits/men/79.jpg", "+33612141512");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Richeux", "Pierre", "1984-01-17", "pr@example.fr", "c461d7183f8e86309d3c6591246c87b", "https://randomuser.me/api/portraits/men/21.jpg", "0777455584");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Sylla", "Mohammed", "1994-04-07", "ms@example.fr", "dca1483260cb39fedb5bbbd0010e3", "https://randomuser.me/api/portraits/men/91.jpg", "+33664784313");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Vignaux", "Josephine", "1979-10-22", "jv@example.fr", "bb4046baebff7766a4b0a3e4525a0ae", "https://randomuser.me/api/portraits/women/61.jpg", "0114575646");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Marie", "Léa", "1992-12-30", "lm@example.fr", "385b96a277f1827fcca9cb08b5497e2", "https://randomuser.me/api/portraits/women/54.jpg", "0665544889");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Martin", "Stéphane", "2000-04-11", "sm@example.fr", "d9f38807fbd2e0a67269608f3e853e", "https://randomuser.me/api/portraits/men/1.jpg", "+33773135648");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Lescota", "Rachid", "1981-09-24", "rl@example.fr", "2b9b50cd274b9e31728d9417bf5a283", "https://randomuser.me/api/portraits/men/87.jpg", "0664444213");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Gilles", "Maurice", "1997-04-14", "mg1@example.fr", "dcf2ef4e6c637dac65f4dec6f4d83ce", "https://randomuser.me/api/portraits/men/50.jpg", "0764674821");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Thomas", "Habiba", "1979-07-23", "ht@example.fr", "cd86705e2855b3699c4056ca5479ef12", "https://randomuser.me/api/portraits/women/9.jpg", "0684566641");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Diouf", "Moussa", "1985-05-17", "md@example.fr", "38dcb0af434584bf027e763be32ddcf", "https://randomuser.me/api/portraits/women/9.jpg", "0778949193");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Sulemankhel", "Changiz", "1980-07-09", "cs@example.fr", "f530ba4bbad49d964137efcce9b17d", "https://randomuser.me/api/portraits/men/56.jpg", "0774599431");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Nasri", "Karima", "1984-04-04", "kn@example.fr", "5e65629c14703847ffffc3a3f2423b16", "https://randomuser.me/api/portraits/women/38.jpg", "0148488746");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Soverighncamapnh", "Vyacheslavovna", "1997-07-08", "vs@example.fr", "cae6ec8bd7d767e2ed67427b48c5669","https://randomuser.me/api/portraits/women/4.jpg", "0665570909");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Chambers", "Laurie", "1999-11-23", "lc@example.fr", "e2ec5cb128949e45d1de902e31bcec12", "https://randomuser.me/api/portraits/women/80.jpg", "0774486421");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Newman", "Jenny", "1988-07-02", "jn@example.fr", "7b3a8e15aab279893affcae2342e5e24", "https://nsa40.casimages.com/img/2020/07/16/200716062542845204.jpg", "0777648131");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Payne", "Erik", "1984-02-02", "ep@example.fr", "54286784a64fdb7d05a4bcb9384d7fc", "https://nsa40.casimages.com/img/2020/07/16/200716062803897485.jpg", "06484687416");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Murray", "Ricky", "1991-07-07", "rm@example.fr", "6db6a732447dad54dc2786e62ce1b740", "https://nsa40.casimages.com/img/2020/07/16/200716062936666326.jpg", "0486126874");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Howard", "Valerie", "1976-06-03", "vh@example.fr", "cf4347d79a1ad76b27d2ba35a41c4a", "https://nsa40.casimages.com/img/2020/07/16/20071606312151599.jpg", "+33654894215");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Ortiz", "Nora", "1975-06-09", "no@example.fr", "6bcf041eb9db73bf6a4949cbe7af9ab", "https://www.casimages.com/codes_ano_multi.php?img=20071606354384251.jpg", "+33765467463");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) values("Carlson", "Gabe", "1974-06-07", "gc@example.fr", "ffa7c3b3995a7bb36af6645d9cdb17", "https://nsa40.casimages.com/img/2020/07/16/20071606374139936.jpg", "+33486978488");
INSERT INTO user(name, firstname, birthdate, email, password, profilpicture, phone) Values("Fisher", "Lili", "1996-06-01", "lf@example.fr", "f33025c4db499323cae62a367ac5fae", "https://nsa40.casimages.com/img/2020/07/16/200716063910637186.jpg", "0745986511");
 
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

INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Marche contre l'abandon", "La SPA recherche des personnes pour encadrer la marche de ce lundi ! Organisation et encadrement des autres participants, voila en quoi consistera votre mission !", "2020-06-15 10:00:00", "2020-06-15 21:00:00", "place de la République, 75011", 50, 1, 1, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Récoltes de dons en nature (Niort)", "Pour sa grande récolte annuelle, la SPA à besoin de vous ! Nous rechercons plusieurs bénévoles pour la gestion de l'organisation, des finances, et de l'encadrement de l'évènement !", "2020-08-15 08:00:00", "2020-08-16 20:00:00", "22, avenue Jacques Bujault, 79000, Maison SPA de Niort", 25, 1, 1, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Récoltes de dons en nature (Bordeaux)", "Après une première récolte réussis nous réitérons la chose en lancant une seconde récolte sur Bordeaux. Comme la fois précédente nous avons besoin de vous !", "2020-08-17 08:00:00", "2020-08-18 22:00:00", "64, rue Fondaudege, 33000, Maison SPA de Bordeaux", 25, 1, 1, false);
       
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES('Conférence "Mieux agir ensemble"', "Alimentation, transport, énergie, il n'existe pas de petits changements ! Si vous êtes regisseur, ingénieur son ou lumière, vous pouvez nous être utile !", "2020-05-31 14:00:00", "2020-05-31 17:00:00", "55, rue de la Chapelle, 75018, Deskéo La chapelle", 25, 1, 2, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("PANDATHLON ALPE D'HUEZ 2020", "Une course outdoor ET fun ET écolo ET solidaire. Moniteurs de ski ou tout simplement débutant, nous en appelons à vous pour venir nous aider à organiser ce GRAND événements annuel !", "2020-06-27 08:00:00", "2020-06-28 20:00:00", "Place Joseph Paganon, 38750, Station Alpe d'Huez", 50, 1, 2, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Operation de ramassages des dêchets", "L'avenue des Champs Elysée à Paris est l'un des lieux les plus fréquentés au monde, malgré les nombreux eboueurs qui y travaillent chaque jour, les dêchets s'entassent. C'est pourquoi WWF s'engage, avec votre aide, à nettoyer cette belle avenue !", "2020-07-22 14:00:00", "2020-07-22 22:00:00", "1, avenue des Champs Elysée, 75008", 40, 1, 2, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Filez un coup de patte au Lynx Boréal !", "Venez en aide au Lynx Boréal, marché avec nous pour augmenter la visibilité de notre prochain PANDATHLON. Recherche encadrent bénévoles !", "2020-07-28 12:00:00", "2020-07-28 18:00:00", "Place de la Nation, 75012", 50, 1, 2, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES('Conférence "Consoguide poisson ou comment consommer du poisson différemment"', "Afin de diminuer la pression exercée sur les espèces maritimes. Nous recherchons des régisseurs ainsi que des transporteurs de matériel !", "2020-08-05 15:00:00", "2020-08-05 17:00:00", "18, rue de Bellechasse, 75007, Espace Bellechasse", 11, 1, 2, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Tournoi d'équitation contre l'abattage", "Pour lutter contre l'abatage excessif des équidés nous organisons un tournoi semi-amateur. Si vous êtes titulaire d'une licence d'équitation, nous faisons appel a vous pour gerer le bon déroulement des épreuves !", "2020-01-15 08:00:00", "2020-01-15 19:00:00", "D35, rue du Souvenir Français, 41600, Parc Equestre Fédéral", 14, 1, 3, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES('Recherche bénévoles "L’Europe du polar"', "Dans le cadre du programme européen DETECT Bibliocité et ses partenaires présentent une exposition intitulée « L’Europe du Polar »  destinée à tous les publics. Pour cela nous rechercons des accompagnateurs bénévoles pour nos visiteurs !", "2020-07-01 08:00:00", "2020-07-04 18:00:00", "48/50, rue du Cardinal Lemoine, 75005, Bibliothèque des littératures policères", 12, 2, 4, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Cities for freedom. 10 ans de l’ICORN", "Bibliocité, à la demande de la Maire de Paris, a développé à l’occasion des 10 ans de l’ICORN qui se déroulaient au sein de l’Hôtel de Ville, une programmation culturelle. Nous recherchons 2 ingénieurs du son !", "2020-07-22 15:00:00", "2020-07-24 18:00:00", "place de l'Hôtel de Ville, 75004, Hôtel de Ville", 4, 2, 4, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Prix Premier Roman", "Ce prix, mis en place en 2017, permet de fédérer des bibliothèques et des lecteurs autour de l’actualité éditoriale de premiers romans des rentrées littéraires de septembre et de janvier. Participez vous aussi au jury de cette année !", "2020-09-01 08:00:00", "2020-09-01 21:00:00", "2, rue Perrée, 75003, Carreau du Temple", 5, 2, 4, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("PÉTITION Pesticides", "Stop aux pesticides de synthèse à proximité des habitations ! Nous recherchons des agriculteurs, qui viendraient présenter l'inconvenient de ce poison !", "2020-06-11 14:00:00", "2020-06-11 18:00:00", "place de la République, 75011", 6, 3, 5, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("PÉTITION Plastiques", "Interdisons le plastique à usage unique ! Nous recherchons un photographe bénévole pour la publication de photo de l'évènement !", "2020-07-15 14:00:00", "2020-07-15 18:00:00", "place de la République, 75011", 1, 3, 5, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("PÉTITION Miel", "MIEL : mettons fin à l'opacité ! A quand un étiquetage de l'origine géographique du miel ? Vous etes apiculteur ? Venez présentez vos produits locaux !", "2020-07-22 14:00:00", "2020-07-22 18:00:00", "place de la République, 75011", 15, 3, 5, false);

INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Accompagnement à la définition et développement d’une stratégie marketing", "Le volontaire devra animer un processus de réflexion avec l’équipe de Escuela para el Desarrollo afin des les amener à réfléchir sur leur offre de services actuelle, analyser leur forces et faiblesse.", "2020-06-11 08:00:00", "2020-06-12 18:00:00", "76-78, rue Saint-Lazare, 75009, Le Créatif", 1, 3, 6, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Formation en technologie électrique et numérique", "Terre, Paille et Compagnie dispose d’une maison autonome qui est un endroit de démonstration sur des pratiques de permaculture. L’objectif du projet est d’optimiser le système électronique du centre en utilisant une de ces technologies.", "2020-07-01 08:00:00", "2020-07-15 18:00:00", "La Courdemière, 86160, Terre Paille & Compagnie", 1, 3, 6, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Soutien à la conception d’un plan de gestion d’eau et irrigation", "Soutenir l’association à concevoir un système leur permettant d’optimiser la gestion d’eau de manière mécanique.", "2020-07-30 08:00:00", "2020-08-13 18:00:00", "La Courdemière, 86160, Terre Paille & Compagnie", 1, 3, 6, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Soutien en comptabilité et pilotage financier", "La ferme Ahalen Lurrak souhaite l’aide d’un.e volontaire afin de mettre en place une comptabilité et un pilotage financier adaptés pour l’association", "2020-08-15 08:00:00", "2020-08-29 18:00:00", "Arla, 64120, Ferme Ahalen Lurrak", 1, 3, 6, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Soutien à la maintenance d’un systèmes solaire thermique", "Terre, Paille et Compagnie dispose d’un système de chauffage qui n’est pas optimal. L’amélioration du système de chauffage d’eau et d’installation des panneaux solaires permettrait une meilleure exploitation.", "2020-09-10 08:00:00", "2020-09-24 18:00:00", "La Courdemière, 86160, Terre Paille & Compagnie", 1, 3, 6, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Aide alimentaire", "La Croix-Rouge a besoin de renforts pour mener à bien ses activités essentielles et accompagner les plus vulnérables. Participer à la distribution alimentaire sur différentes activités. Aidez-nous à maintenir l’aide alimentaire aux plus vulnérables !", "2020-07-16 08:00:00", "2020-07-16 22:00:00", "90, avenue Jean Jaurès, 93120, Unité Locale Bobigny/Aubervilliers/La Courneuve/Stains", 25, 4, 8, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Accueil santé social", "En cette période, la Croix-Rouge a besoin de renforts pour mener à bien ses activités. La mission consiste à apporter un renfort aux équipes de l’accueil santé social sur différentes activités. Aidez-nous à maintenir l’accès à la santé !", "2020-07-16 08:00:00", "2020-07-16 22:00:00", "allée Louis de Broglie, 95200, Unité Locale Val de France", 25, 4, 8, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Soutien psychologique par téléphone", "Mission nécessitant un diplôme de professionnel de santé mentale reconnu par l'ARS. Le bénévole recevra des appels de personnes qui sollicitent le dispositif Croix Rouge Ecoute. L'écoutant devra assurer une écoute contenante et bienveillante.", "2020-07-14 08:00:00", "2020-07-21 19:00:00", "45, avenue Verdier, 92120, Unité Locale Montrouge", 5, 4, 8, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Chargé de communication", "Nous recherchons une personne pour nous aider créer un site web pour notre structure. Vous aurez également en charge de faire vivre les pages présentes sur les réseaux sociaux. Vous serez en charge des relations avec les médias locaux et nationaux.", "2020-07-22 08:00:00", "2020-08-22 18:00:00", "allée Louis de Broglie, 95200, Unité Locale Val de France", 1, 4, 8, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Envoyer des cartes postales solidaires", "A l'aide de votre sens artistique et créatif, envoyez un courrier positif et solidaire à une personne en situation de vulnérabilité et/ou d’isolement (personne détenue, résident.e en EHPAD, en établissement médico-éducatif, etc.)", "2020-07-30 08:00:00", "2020-07-31 18:00:00", "45, avenue Verdier, 92120, Unité Locale Montrouge", 10, 4, 8, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Médecin et infirmier anesthésiste", "MSF recherche en urgence des anesthésistes pédiatriques pour ses projets sur le terrain", "2020-07-16 08:00:00", "2021-01-10 20:00:00", "Monde", 10, 4, 9, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Pédiatre", "Le médecin pédiatre projette, organise et évalue les activités pédiatriques en étroite collaboration avec le personnel des offices de la santé du pays tels que les centres de soins de santé primaire, les cliniques, les hôpitaux où intervient MSF.", "2020-07-01 08:00:00", "2021-01-01 20:00:00", "Monde", 10, 4, 9, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Urgentiste", "Face aux besoins actuels accrus sur nos terrains d’intervention et dans le but de renforcer notre pool de médecins, nous recrutons pour cet été des urgentistes disponibles immédiatement.", "2020-08-01 08:00:00", "2020-11-01 20:00:00", "Monde", 10, 4, 9, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Médecin", "Le médecin projette, organise et évalue les activités dans le secteur médical en collaboration avec le personnel des offices de la santé du pays tels que les centres de soins de santé primaire et les cliniques.", "2020-05-01 08:00:00", "2020-09-01 20:00:00", "Monde", 15, 4, 9, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Cadre infirmier", "Le cadre infirmier définit et met en œuvre les moyens humains, matériels et organisationnels nécessaires pour garantir la continuité, la qualité et la sécurité des soins infirmiers.", "2020-06-22 08:00:00", "2020-09-22 20:00:00", "Monde", 20, 4, 9, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Coordinateur de projet", "Le coordinateur de projet coordonne le ou les programmes sur le terrain dont il est responsable. Il définit les priorités et objectifs. Il suit la situation sanitaire et humanitaire de la population représente MSF auprès des interlocuteurs locaux.", "2020-07-22 08:00:00", "2020-08-22 20:00:00", "Monde", 5, 4, 9, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES('"Allo Prévention Expulsions" : la Fondation recherche des bénévoles.', 'La plateforme téléphonique "allo prévention expulsion" répond aux appels du grand public, des travailleurs sociaux ou des associations sollicitant un appui face à une menace d’expulsion ou une situation d’impayé de loyer.', "2020-07-16 14:00:00", "2020-07-16 17:00:00", "3/5, rue de Romainville, 75019, Fondation Abbé Pierre", 5, 4, 10, false);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Bénévolat à l'Espace Solidarité Habitat", "La Fondation Abbé Pierre recherche des bénévoles pour son Espace Solidarité Habitat situé à Paris afin de participer à l’accueil et à l’orientation des personnes mal logées en vue de les accompagner dans la résolution de leurs difficultés.", "2020-08-12 09:00:00", "2020-08-12 14:30:00", "3/5, rue de Romainville, 75019, Fondation Abbé Pierre", 10, 4, 10, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("Tournoi Valorant", "Vous êtes régisseur ? Technicien Réseau ? Ingénieur Son ? Ou vous êtes juste un passioné d'e-sport ? Venez nous aider à organiser le plus gros évènement valorant de l'année 2020 !", "2020-06-21 9:30:00", "2020-06-21 21:00:00", "28, boulevard des Capucines, 75009, l'Olympia", 6, 6, 12, false);
        
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 1, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 2, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 3, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 4, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 5, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 6, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 7, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 8, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 9, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 10, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 11, true);
INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("", "", '2000-01-01 00:00:00', '2000-01-01 00:00:00', "", 0, 7, 12, true);

#------------------------------------------------------------------------------------
# Data post asso
#------------------------------------------------------------------------------------

#----Asso 1----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Marche contre l'abandon.\n Il se déroulera du 15/06/2020 10:00 au 15/06/2020 21:00.\n Nous aurons besoin de 50 bénévoles, inscrivez vous sur Benevent", "2020-05-23 10:41:55", NULL, 1, 1);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("La marche est en route ! Venez vite nous rejoindre !!.", "2020-06-15 09:55:23", NULL, 1, 1);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Merci pour la marche ! Plus de 1500 personnes étaient présentes, on espère que la prochaine aura autant de succès !", "2020-06-16 09:23:55", NULL, 1, 1);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Récoltes de dons en nature (Niort).\n Il se déroulera du 15/08/2020 08:00 au 16/08/2020 20:00.\n Nous aurons besoin de 25 bénévoles, inscrivez vous sur Benevent", "2020-07-20 11:41:47", NULL, 1, 2);;

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Récoltes de dons en nature (Bordeaux).\n Il se déroulera du 17/08/2020 08:00 au 18/08/2020 22:00.\n Nous aurons besoin de 25 bénévoles, inscrivez vous sur Benevent", "2020-07-16 20:17:33", NULL, 1, 3);

#----Asso 2----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES('Un nouvel événement est organisé: Conférence "Mieux agir ensemble".\n Il se déroulera du 31/05/2020 14:00 au 31/05/2020 17:00.\n Nous aurons besoin de 25 bénévoles, inscrivez vous sur Benevent', "2020-05-20 11:00:12", NULL, 2, 4);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Merci pour cette journée, vous étiez nombreux ! Nous en organiseront une autre bientôt !", "2020-05-31 19:11:48", NULL, 2, 4);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: PANDATHLON ALPE D'HUEZ 2020.\n Il se déroulera du 27/06/2020 08:00 au 28/06/2020 20:00.\n Nous aurons besoin de 50 bénévoles, inscrivez vous sur Benevent", "2020-05-31 14:43:22", NULL, 2, 5);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("LE PANDATHLON EST LANCÉ ! C'est parti pour 2 jours de folie pour proteger nos amis les lynx !", "2020-06-27 08:36:44", NULL, 2, 5);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Le pandathlon est officiellement terminé ! Comme chaque année c'était la folie, on vous attend avec impatience l'année prochaine, bénévoles comme participants !", "2020-06-28 21:54:06", NULL, 2, 5);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Operation de ramassages des dêchets.\n Il se déroulera du 22/07/2020 14:00 au 22/07/2020 22:00.\n Nous aurons besoin de 40 bénévoles, inscrivez vous sur Benevent", "2020-07-19 14:01:22", NULL, 2, 6);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Bravo à vous, c'est plus de 50 kilos de dêchets que l'on aura récupérer aujourd'hui, et ce grâce a vous ! Vous pouvez être fier !", "2020-07-22 22:41:33", NULL, 2, 6);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Filez un coup de patte au Lynx Boréal.\n Il se déroulera du 28/07/2020 12:00 au 28/07/2020 18:00.\n Nous aurons besoin de 50 bénévoles, inscrivez vous sur Benevent", "2020-06-27 11:41:02", NULL, 2, 7);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES('Un nouvel événement est organisé: Conférence "Consoguide poisson ou comment consommer du poisson différemment".\n Il se déroulera du 05/08/2020 15:00 au 05/08/2020 17:00.\n Nous aurons besoin de 11 bénévoles, inscrivez vous sur Benevent', "2020-07-01 18:35:11", NULL, 2, 8);

#----Asso 3----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Tournoi d'équitation contre l'abattage.\n Il se déroulera du 15/01/2020 08:00 au 15/01/2020 19:00.\n Nous aurons besoin de 14 bénévoles, inscrivez vous sur Benevent", "2020-01-10 11:41:13", NULL, 3, 9);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Bravo à tous pour cette journée, le tournoi est une reussite, grâce à vous nous avons pu augmenter notre visibilité. Bravo aux gagnants et merci à nos bénévoles qui ont assurer la sécurité et le bon fonctionnement de l'événement", "2020-01-16 21:32:04", NULL, 3,9);

#----Asso 4----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES('Un nouvel événement est organisé: Recherche bénévoles "L’Europe du polar".\n Il se déroulera du 01/07/2020 08:00 au 04/07/2020 18:00.\n Nous aurons besoin de 12 bénévoles, inscrivez vous sur Benevent', "2020-06-20 17:36:44", NULL, 4, 10);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("L'Europe du polar à été un succès et ce grâce a vous. Nous referons d'autres événements de ce type, et nous auront encore une fois besoin de vous ! Milles merci !", "2020-07-05 12:34:22", NULL, 4, 10);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Cities for freedom. 10 ans de l’ICORN.\n Il se déroulera du 22/07/2020 15:00 au 24/07/2020 18:00.\n Nous aurons besoin de 4 bénévoles, inscrivez vous sur Benevent", "2020-07-03 02:45:47", NULL, 4, 11);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Prix Premier Roman.\n Il se déroulera du 01/09/2020 08:00 au 01/09/2020 21:00.\n Nous aurons besoin de 5 bénévoles, inscrivez vous sur Benevent", "2020-07-07 04:47:44", NULL, 4, 12);

#----Asso 5----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: PÉTITION Pesticides.\n Il se déroulera du 11/06/2020 14:00 au 11/06/2020 18:00.\n Nous aurons besoin de 6 bénévoles, inscrivez vous sur Benevent", "2020-06-01 02:41:11", NULL, 5, 13);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Grâce à votre aide et à celle de nos bénévoles, nous avons pu reunir plus de 1200 signatures ! MERCI ! Un prochain événement sera bientot là !", "2020-06-12 11:45:06", NULL, 5, 13);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: PÉTITION Plastiques.\n Il se déroulera du 15/07/2020 14:00 au 15/07/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-07-12 09:28:39", NULL, 5, 14);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Nous avons pu reunir plus de 600 signatures !", "2020-06-12 11:45:06", NULL, 5, 14);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: PÉTITION Miel.\n Il se déroulera du 22/07/2020 14:00 au 22/07/2020 18:00.\n Nous aurons besoin de 15 bénévoles, inscrivez vous sur Benevent", "2020-07-19 07:49:34", NULL, 5, 15);

#----Asso 6----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Accompagnement à la définition et développement d’une stratégie marketing.\n Il se déroulera du 11/06/2020 08:00 au 12/06/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-06-04 14:12:33", NULL, 6, 16);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Suite aux retour des deux journées d'accompagnement, nous pouvons vous dire qu'il y en aura d'autres ! Merci à notre bénévole !", "2020-06-13 17:34:55", NULL, 6, 16);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Formation en technologie électrique et numérique.\n Il se déroulera du 01/07/2020 08:00 au 15/07/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-05-21 11:29:44", NULL, 6, 17);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Après ses deux semaines de formation, notre bénévole est de retour ! Merci à lui pour ces deux semaines incroyables ! Le prochain, sera peut-être vous !", "2020-07-16 15:44:12", NULL, 6, 17);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Soutien à la conception d’un plan de gestion d’eau et irrigation.\n Il se déroulera du 30/07/2020 08:00 au 13/08/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-06-24 23:16:12", NULL, 6, 18);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Soutien en comptabilité et pilotage financier.\n Il se déroulera du 15/08/2020 08:00 29/08/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-07-21 18:15:49", NULL, 6, 19);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Soutien à la maintenance d’un systèmes solaire thermique.\n Il se déroulera du 10/09/2020 08:00 au 24/09/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-07-11 17:22:33", NULL, 6, 20);

#----Asso 7----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Aide alimentaire.\n Il se déroulera du 16/07/2020 08:00 au 16/07/2020 22:00.\n Nous aurons besoin de 25 bénévoles, inscrivez vous sur Benevent", "2020-07-11 16:37:41", NULL, 7, 21);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Merci à vous ! Nous avons pu fournir notre aide à 55 personnes hier, et c'est entièrement grâce à vous ! C'est gens ne vous oublieront pas et nous non plus merci !", "2020-07-17 07:44:23", NULL, 7, 21);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Accueil santé social.\n Il se déroulera du 16/07/2020 08:00 au 16/07/2020 22:00.\n Nous aurons besoin de 25 bénévoles, inscrivez vous sur Benevent", "2020-07-12 14:41:33", NULL, 7, 22);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Bravo à nos 25 bénévoles qui se sont relayer aujourd'hui pour assurer le service de notre centre en continue de 08h à 22h ! Revenez quand vous voulez !", "2020-07-16 23:54:02", NULL, 7, 22);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Soutien psychologique par téléphone.\n Il se déroulera du 14/07/2020 08:00 au 21/07/2020 19:00.\n Nous aurons besoin de 5 bénévoles, inscrivez vous sur Benevent", "2020-07-11 17:11:55", NULL, 7, 23);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Merci à nos psychologue bénévoles qui ont assuré pendant une semaine, le service de soutien psychologique téléphonique de jour ! Vous avez surement sauvez de nombreuses vies et aider certaines personnes !", "2020-07-22 08:44:12", NULL, 7, 23);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Chargé de communication.\n Il se déroulera du 22/07/2020 08:00 au 22/08/2020 18:00.\n Nous aurons besoin de 1 bénévoles, inscrivez vous sur Benevent", "2020-07-11 16:58:16", NULL, 7, 24);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Envoyer des cartes postales solidaires.\n Il se déroulera du 30/07/2020 08:00 au 31/07/20 18:00.\n Nous aurons besoin de 10 bénévoles, inscrivez vous sur Benevent", "2020-07-22 17:44:33", NULL, 7, 25);

#----Asso 8----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Médecin et infirmier anesthésiste.\n Il se déroulera du 16/07/2020 08:00 au 10/01/2021 20:00.\n Nous aurons besoin de 10 bénévoles, inscrivez vous sur Benevent", "2020-06-01 07:31:22", NULL, 8, 26);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Pédiatre.\n Il se déroulera du 01/07/2020 08:00 au 01/01/2021 20:00.\n Nous aurons besoin de 10 bénévoles, inscrivez vous sur Benevent", "2020-05-22 06:11:54", NULL, 8, 27);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Urgentiste.\n Il se déroulera du 01/08/2020 08:00 au 01/11/2020 20:00.\n Nous aurons besoin de 10 bénévoles, inscrivez vous sur Benevent", "2020-07-01 16:57:44", NULL, 8, 28);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Médecin.\n Il se déroulera du 01/05/2020 08:00 au 01/09/20 20:00.\n Nous aurons besoin de 15 bénévoles, inscrivez vous sur Benevent", "2020-04-01 14:01:06", NULL, 8, 29);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Cadre infirmier.\n Il se déroulera du 22/06/2020 08:00 au 22/09/2020 20:00.\n Nous aurons besoin de 20 bénévoles, inscrivez vous sur Benevent", "2020-05-15 23:45:47", NULL, 8, 30);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Coordinateur de projet.\n Il se déroulera du 22/07/2020 08:00 au 22/08/2020 20:00.\n Nous aurons besoin de 5 bénévoles, inscrivez vous sur Benevent", "2020-06-11 14:11:12", NULL, 8, 31);

#----Asso 9----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES('Un nouvel événement est organisé: "Allo Prévention Expulsions" : la Fondation recherche des bénévoles.\n Il se déroulera du 16/07/2020 14:00 au 16/07/2020 17:00.\n Nous aurons besoin de 5 bénévoles, inscrivez vous sur Benevent', "2020-07-10 20:34:50", NULL, 9, 32);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Merci à nos 5 bénévoles qui ont participé activement à cette après-midi !", "2020-07-16 19:41:31", NULL, 9, 32);

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Bénévolat à l'Espace Solidarité Habitat.\n Il se déroulera du 12/08/2020 09:00 au 12/08/2020 14:30.\n Nous aurons besoin de 10 bénévoles, inscrivez vous sur Benevent", "2020-07-01 06:44:56", NULL, 9, 33);

#----Asso 10----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Un nouvel événement est organisé: Tournoi Valorant.\n Il se déroulera du 21/06/2020 09:30 au 21/06/2020 21:00.\n Nous aurons besoin de 6 bénévoles, inscrivez vous sur Benevent", "2020-06-12 11:27:56", NULL, 10, 34);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Merci à nos bénévoles pour ce tournoi et bravo à nos gagnants !", "2020-06-22 09:44:56", NULL, 10, 34);

#----Asso 1 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("À partir du mercredi 10 juin, la Société Protectrice des Animaux (SPA) lance une campagne de sensibilisation inédite pour lutter contre l’abandon !", "2020-06-01 20:14:22", NULL, 1, 35);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("La France, championne européenne de l'abandon d'animaux. Avec 100 000 animaux abandonnés chaque année, dont 60 000 durant l'été ! Luttons contre ces abandons ensemble !", "2020-07-19 11:45:33", NULL, 1, 35);

#----Asso 2 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Indispensables à l'équilibre des écosystèmes marins, les requins et les raies sont aujourd'hui gravement menacés en Méditerranée par la Pêche illégale. Il est temps d'agir !", "2020-07-14 11:02:33", NULL, 2, 36);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Le WWF plaide pour une relance verte qui représente deux fois plus d’emplois soutenus qu’un plan de relance plus classique d'ici 2022.", "2020-07-10 10:15:00", NULL, 2, 36);

#----Asso 3 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("L’Avef et la LFPC alertent, une nouvelle fois, sur les dérives de l’endurance équestre en matière de bien-être animal et de dopage !", "2020-06-11 21:41:22", NULL, 3, 37);

#----Asso 4 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES('Cette année encore, Bibliocité et les bibliothèques de Paris sont partenaires de "Partir en Livre" et du CNL pour un été placé sous le signe de la lecture et des histoires, avec plein de surprises à découvrir !', "2020-07-07 12:42:35", NULL, 4, 38);

#----Asso 5 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Quelle est la source scientifique vous permettant d’affirmer que la 5G n’est pas dangereuse ? L’ Anses reconnaît humblement ne rien en savoir car les fréquences utilisées non jamais été évaluées et que nous ne pouvons extrapoler les données 4G à la 5G.", "2020-07-14 22:45:02", NULL, 5, 39);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("L'agriculture bio est présente sur 2,3 millions d'hectares en France, soit 8,5% des terres cultivées.", "2020-07-10 14:24:33", NULL, 5, 39);

#----Asso 6 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("20 ans de solidarité internationale, à travailler avec des femmes et des hommes pour un impact positif sur l'environnement grâce à des actions de volontariat, de restauration de forêts et de sensibilisation.", "2020-07-02 10:05:33", NULL, 6, 40);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Grâce à vos dons, 9 000 #arbres seront plantés à Madagascar Drapeau de Madagascar dans le cadre de notre projet de reforestation TAPIA ! Un grand merci à tous pour vos dons en ligne.", "2020-07-16 10:36:22", NULL, 6, 40);

#----Asso 8 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Au conseil européen ce jour, nous devons soutenir le budget de l'aide alimentaire et obtenir un plan de relance pour lutter contre la pauvreté et faire face à une crise sociale inédite.", "2020-07-17 11:36:33", NULL, 8, 42);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("64% des Français se sentent incapables d'appliquer les gestes de premier secours. Et Vous ? Vous savez ?", "2020-07-15 07:01:51", NULL, 8, 42);

#----Asso 9 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Cela fait 18 jours que des mineurs survivent dans des tentes à la vue de tous, en plein Paris. Combien de temps avant qu’une solution digne leur soit proposée ?", "2020-07-17 10:00:11", NULL, 9, 43);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("A Marseille, hier des mineurs non-accompagnés ont été expulsés d’un squat et menottés. Le departement 13 doit les protéger !", "2020-07-11 18:59:04", NULL, 9, 43);

#----Asso 10 - FAKE----

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Zéro personne sans domicile en Europe, c’est possible ! La Fondation AbbePierre présentent le 5e Regard sur le Mal Logement Europe le 23 juillet 2020.", "2020-07-16 13:52:33", NULL, 10, 44);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Fin de la trêve des expulsions le 10 juillet : la Fondation AbbePierre requiert des mesures plus fortes pour éviter des drames humains ! ", "2020-07-07 14:31:01", NULL, 10, 44);

#------------------------------------------------------------------------------------
# Data post user
#------------------------------------------------------------------------------------

INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Vraiment Hâte de pouvoir participer à l'évènement !", "2020-07-11 17:21:33", 1, NULL, 33);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("WOUAH Quel événement incroyable !", "2020-06-16 11:45:26", 2, NULL, 1);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("L'événement c'est super bien passer je suis content !!!", "2020-07-22 07:41:46", 2, NULL, 23);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("J'attend cet évènement avec impatience !", "2020-04-15 14:37:08", 4, NULL, 29);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Je m'amuse comme un fou !", "2020-07-19 12:46:06", 4, NULL, 30);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Une de mes participations préférée !", "2020-06-01 23:54:01", 4, NULL, 4);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Je suis pressé d'aller participer à cette longue mission qui m'attend", "2020-06-11 14:33:27", 5, NULL, 26);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Je suis sûr que je vais adorer participer !", "2020-07-22 18:00:00", 7, NULL, 25);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Déçu de l'évènement ainsi que de l'association :(", "2020-06-13 21:32:00", 7, NULL, 16);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("J'ai adoré participer à cet incroyable expérience humaine !", "2020-07-16 11:02:34", 7, NULL, 17);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Vivement l'évènement !", "2020-07-11 23:57:33", 9, NULL, 8);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Je suis impatiennnnnnnnnt !!!!!!!", "2020-07-12 08:56:04", 9, NULL, 14);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Eya quel évènement passionnant cela va être !", "2020-07-09 04:37:44", 14, NULL, 14);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("J'espère pouvoir participer à la mission !", "2020-06-05 11:23:54", 19, NULL, 26);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Evenement pas ouf... Heureusement que c'était pour la bonne cause", "2020-07-04", 21, NULL, 10);
INSERT INTO post(message, date, iduser, idassociation, idevent) VALUES("Pouah, vivement que sa se termine", "2020-07-20 11:12:33", 21, NULL, 30);

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

#------------------------------------------------------------------------------------
# Data feedback
#------------------------------------------------------------------------------------

INSERT INTO feedback(title, content, date, platform, status, idtype, iduser) VALUES("Bug Ecran de démarrage", "Ecran noir pendant 5 secondes au démarrage de l'application", "2020-06-11 04:56:33", "ANDROID", "", 1, 1);
INSERT INTO feedback(title, content, date, platform, status, idtype, iduser) VALUES("Probleme suppresion de compte", "Quand je supprime mon compte, il y a marqué OK mais je peux encore me connecter avec après", "2020-07-01 11:32:56", "FLUTTER", "", 1, 2);
INSERT INTO feedback(title, content, date, platform, status, idtype, iduser) VALUES("Pas de contenue", "Le contenue n'arrive pas à se charger sur chaque page", "2020-05-23 23:33:12", "ANDROID", "", 1, 3);
INSERT INTO feedback(title, content, date, platform, status, idtype, idassociation) VALUES("Pas de bouton", "Dans l'onglet amélioration le bouton est a moitié en dehors de l'écran", "2020-07-22 14:55:06", "IOS", "", 1, 6);
INSERT INTO feedback(title, content, date, platform, status, idtype, iduser) VALUES("Details sur l'association", "L'onglet détails des associations n'affiche pas d'informations", "2020-07-05 11:33:56", "ANDROID", "", 1, 8);

INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("La note pourrait être meilleure si le button de login était plus stylisé", "2020-06-11 20:37:59", "ANDROID", "", 4, 2, 8);
INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("Ameliorer le design, les textes sont trop petits pour moi", "2020-05-14 15:21:21", "ANDROID", "", 4, 2, 11);
INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("Les informations sur les évènements sont imprécises", "2020-07-11 06:33:56", "ANDROID", "", 1, 2, 5);
INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("NUL", "2020-05-26 11:27:58", "ANDROID", "", 0, 2, 7);
INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("La meilleure application !!!!", "2020-07-19 18:57:01", "ANDROID", "", 5, 2, 4);
INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("Surement un des meilleurs moyen de se tenir informé des événements de ses associations favorites !", "2020-07-05 23:57:38", "ANDROID", "", 5, 2, 12);
INSERT INTO feedback(content, date, platform, status, note, idtype, iduser) VALUES("L'application web est très pratique ! Dommage que le style soit un peu moyen", "2020-07-22 11:00:58", "FLUTTER", "", 3, 2, 1);
INSERT INTO feedback(content, date, platform, status, note, idtype, idassociation) VALUES("L'application est bien et permet de passer moins de temps à gérer les bénévoles présents !", "2020-06-15 17:54:23", "IOS", "", 4, 2, 8);
INSERT INTO feedback(content, date, platform, status, note, idtype, idassociation) VALUES("Cool, dommage que les posts et les descriptions d'évènements soit si court !", "2020-06-22 18:05:22", "IOS", "", 4, 2, 10);
INSERT INTO feedback(content, date, platform, status, note, idtype, idassociation) VALUES("VRAIMENT LA PIRE APPLICATION DU MONDE !!!!!!", "2020-05-29", "IOS", "", 0, 2, 5);
INSERT INTO feedback(content, date, platform, status, note, idtype, idassociation) VALUES("Trop peu d'informations sur les bénévoles", "2020-06-27 11:54:06", "IOS", "", 3, 2, 12);

#-----------------------------------------------------------------------------------
# Data follower
#-----------------------------------------------------------------------------------

INSERT INTO follower(idassociation, iduser) VALUES(8, 7);
INSERT INTO follower(idassociation, iduser) VALUES(6, 7);
INSERT INTO follower(idassociation, iduser) VALUES(9, 5);
INSERT INTO follower(idassociation, iduser) VALUES(8, 17);
INSERT INTO follower(idassociation, iduser) VALUES(5, 17);
INSERT INTO follower(idassociation, iduser) VALUES(1, 2);
INSERT INTO follower(idassociation, iduser) VALUES(8, 2);
INSERT INTO follower(idassociation, iduser) VALUES(4, 21);
INSERT INTO follower(idassociation, iduser) VALUES(9, 21);
INSERT INTO follower(idassociation, iduser) VALUES(8, 19);
INSERT INTO follower(idassociation, iduser) VALUES(1, 19);
INSERT INTO follower(idassociation, iduser) VALUES(6, 19);
INSERT INTO follower(idassociation, iduser) VALUES(9, 19);
INSERT INTO follower(idassociation, iduser) VALUES(9, 4);
INSERT INTO follower(idassociation, iduser) VALUES(2, 4);
INSERT INTO follower(idassociation, iduser) VALUES(10, 1);
INSERT INTO follower(idassociation, iduser) VALUES(2, 9);
INSERT INTO follower(idassociation, iduser) VALUES(5, 9);
INSERT INTO follower(idassociation, iduser) VALUES(8, 11);
INSERT INTO follower(idassociation, iduser) VALUES(8, 16);
INSERT INTO follower(idassociation, iduser) VALUES(9, 18);
INSERT INTO follower(idassociation, iduser) VALUES(10, 6);
INSERT INTO follower(idassociation, iduser) VALUES(10, 10);
INSERT INTO follower(idassociation, iduser) VALUES(6, 12);
INSERT INTO follower(idassociation, iduser) VALUES(5, 14);
INSERT INTO follower(idassociation, iduser) VALUES(12, 3);
INSERT INTO follower(idassociation, iduser) VALUES(7, 3);
INSERT INTO follower(idassociation, iduser) VALUES(11, 8);
INSERT INTO follower(idassociation, iduser) VALUES(7, 13);
INSERT INTO follower(idassociation, iduser) VALUES(3, 15);
INSERT INTO follower(idassociation, iduser) VALUES(12, 20);
INSERT INTO follower(idassociation, iduser) VALUES(3, 22);

#------------------------------------------------------------------------------------
# Data participation
#------------------------------------------------------------------------------------

INSERT INTO participation(idevent, iduser, status) VALUES(25, 7, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(26, 5, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(23, 17, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(1, 2, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(10, 21, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(23, 19, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(29, 4, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(3, 19, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(30, 21, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(33, 1, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(8, 9, 1); 
INSERT INTO participation(idevent, iduser, status) VALUES(16, 7, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(17, 19, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(24, 11, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(17, 7, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(26, 19, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(24, 16, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(29, 18, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(33, 6, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(33, 10, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(29, 19, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(27, 18, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(30, 4, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(27, 19, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(19, 12, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(14, 9, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(23, 2, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(15, 14, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(4, 4, 1);
INSERT INTO participation(idevent, iduser, status) VALUES(15, 17, 1);

#------------------------------------------------------------------------------------
# Data news
#------------------------------------------------------------------------------------

INSERT INTO news(title, content, date) VALUES("Benevent La SORTIE !!!", "Merci a vous d'être si nombreux pour le lancement des systèmes Benevent ! On espère vous satisfaire !", "2020-04-20");
INSERT INTO news(title, content, date) VALUES("BENEVENT SE REFAIT UNE BEAUTÉ !", "Suite à vos messages, l'application BenEvent-BEN se refait une beauté graphique avec une refont visuelle !", "2020-06-11");
INSERT INTO news(title, content, date) VALUES("Benevent M.A.J", "Merci pour tout vos retours !, Nous avons intégrer un système de notation à étoiles dans l'application pour simplifier les retours !", "2020-06-25");
INSERT INTO news(title, content, date) VALUES("Crash des serveurs...", "Vous avez du le remarquer ses derniers jours ont été compliqué suite à des crashs de nos serveurs, heureusement le problème est maintenant résolue !!!!", "2020-07-01");
INSERT INTO news(title, content, date) VALUES("le Web change de look", "Vous avez été nombreux à nous signaler que vous n'aimiez pas l'apparence du site web de BenEvent, c'est pourquoi nous avons décider de le refaire intégralement !", "2020-07-20");