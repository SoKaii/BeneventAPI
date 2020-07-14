const express = require('express');
const mysql = require('mysql');
const fetch = require('node-fetch');

const app = express();
const PORT = process.env.PORT || 3000;
const config = require('./config.js');
const con = mysql.createConnection({
    host: config.host,
    user: config.user, //user mysql
    password: config.password, //password mysql
    database: config.database, //database mysql
   // socketPath: config.socketPath
});

app.use(express.json());

con.connect( function(err) {
    if (err) throw err;
    console.log('Connected !');
});

app.get('/', function (req, res) {
    res.send('Hello World !')
});

// USER ROUTES

app.post('/signup/user', async function (req, res) {
    const { name } = req.body;
    const { firstname } = req.body;
    const { age } = req.body;
    const { email } = req.body;
    const { password } = req.body;
    const { phone } = req.body;
    const { profilpicture } = req.body;

    await con.query({
        sql: 'INSERT INTO `user` (`name`, `firstname`, `age`, `email`, `password`,`phone`,`profilpicture`) VALUES (?,?,?,?,?,?,?)',
        values: [name, firstname, age, email, password, phone, profilpicture]
    }, function (err, result, fields) {
        if (err) {
            if (err.code == "ER_DUP_ENTRY") {
                res.status(400).send({error: "email already exist"});
            } else {
                res.status(400).send(err);
            }
        } else {
            console.log(result);
            res.status(201).send();
        }
    });
}); // créer un nouveau user dans la bdd

app.post('/signin/user', async function (req, res) {
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM `user` WHERE `email` = ? AND `password` = ?',
        values: [email, password]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        if (result.length > 0) {
            console.log(result);
            res.status(200).send(result);
        } else {
            console.log(result);
            res.status(401).send({error: "Email or password is incorrect"});
        }
    });
}); // permet aux users de se connecter

app.get('/users', function (req, res) {
    con.query({
        sql: 'SELECT idu,name,firstname,age,profilpicture FROM `user`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les users de la bdd

app.get('/user/:idu', function (req, res) {
    const { idu } = req.params;

    con.query({
        sql: 'SELECT idu,name,firstname,age,profilpicture,phone FROM `user` WHERE `idu` = ?',
        values: [idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer le user d'id

app.get('/user/byasso/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT user.* FROM `posts`,`user`,`association`,`event` WHERE user.idu = posts.idu and posts.idev = event.idev and event.idas = association.idas and association.idas = ?',
        values: [idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.get('/userdetail/:id', function (req, res) {
    const { id } = req.params;

    con.query({
        sql: 'SELECT * FROM `user` WHERE `idu` = ?',
        values: [id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result[0]));
    });
});

app.patch('/user/:idu', function (req, res) {
    const { name } = req.body;
    const { firstname } = req.body;
    const { phone } = req.body;
    const { profilpicture } = req.body;
    const { idu } = req.params;

    con.query({
        sql: 'UPDATE `user` SET `name` = ?, `firstname` = ?, `phone` = ?, `profilpicture` = ? WHERE `idu` = ?',
        values: [name, firstname, phone, profilpicture, idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send();
    });
}); // modifier le user d'id

app.delete('/user/:idu', function (req, res) {
    const { idu } = req.params;

    con.query({
        sql: 'DELETE FROM `user` WHERE `idu` = ?',
        values: [idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // supprimer le user d'id

// ASSOCIATION ROUTES

app.post('/signup/association', async function (req, res) {
    const { name } = req.body;
    const { email } = req.body;
    const { password } = req.body;
    const { logo } = req.body;
    const { idcat } = req.body;

    await con.query({
        sql: 'INSERT INTO `association` (`name`, `email`, `password`, `logo`, `idcat`) VALUES (?,?,?,?,?)',
        values: [name, email, password, logo, idcat]
    }, function (err, result, fields) {
        if (err) {
            if (err.code == "ER_DUP_ENTRY") {
                res.status(400).send({error: "Email/Name already exist"});
            } else {
                res.status(400).send(err);
            }
        } else {
            console.log(result.insertId);
          const idas = result.insertId;
          con.query({
              sql: 'INSERT INTO event(`name`,`description`,`dateDeb`,`dateFin`,`location`,`maxBenevole`,`idcat`,`idas`,`fakeevent`) VALUES("","",\'2000-01-01 00:00:00\',\'2000-01-01 00:00:00\',"",0,7,?,true)',
              values: [idas]
          }, function (err, result, fields) {
              if (err) {
                  res.status(400).send(err);
              } else {
                  console.log(result);
                  res.status(201).send(result);
              }
          });
        }
    });
}); // créer une nouvelle association

app.post('/signin/association', async function (req, res) {
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM `association` WHERE `email` = ? AND `password` = ?',
        values: [email, password]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        if (result.length > 0) {
            console.log(result);
            res.status(200).send(result);
        } else {
            console.log(result);
            res.status(401).send({error: "Email or password is incorrect"});
        }
    });
}); // permet aux associations de se connecter

app.get('/associations', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `association`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les users de la bdd

app.get('/association/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT * FROM `association` WHERE `idas` = ?',
        values: [idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer l'association d'id

app.get('/association/details/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT * FROM `association` WHERE `idas` = ?',
        values: [idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result[0]));
    });
}); // récupérer l'association sous json d'id

app.get('/associations/category/:idcat', function (req, res) {
    const { idcat } = req.params;

    con.query({
        sql: 'SELECT * FROM `association` WHERE `idcat` = ?',
        values: [idcat]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer toutes les associations d'une categorie

app.patch('/association/:id', function (req, res) {
    const { name } = req.body;
    const { email } = req.body;
    const { phone } = req.body;
    const { website } = req.body;
    const { support } = req.body;
    const { acronym } = req.body;
    const { logo } = req.body;
    const { id } = req.params;

    con.query({
        sql: 'Update `association` SET `name` = ?, `email` = ?, `phone` = ?, `website` = ?, `support` = ?, `acronym`= ?, `logo`= ? WHERE `idas` = ?',
        values: [name, email, phone, website, support, acronym, logo, id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // modifier l'association d'id

app.delete('/association/:id', function (req, res) {
    const { id } = req.params;

    con.query({
        sql: 'DELETE FROM `association` WHERE `idas` = ?',
        values: [id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
    });
}); // supprimer l'association d'id

// ADMIN ROUTES

app.post('/signin/admin', async function (req, res) {
    const { login } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM `admin` WHERE `login` = ? AND `password` = ?',
        values: [login, password]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        if (result.length > 0) {
            console.log(JSON.stringify(result[0]));
            res.status(200).send(JSON.stringify(result[0]));
        } else {
            console.log({error: "Login or password is incorrect"});
            res.status(401).send();
        }
    });
}); // permet aux admins de se connecter

// CATEGORY ROUTES

app.get('/categories', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `category` ORDER BY category.name ASC'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer toutes les categories

app.get('/category/:idcat', function (req, res) {
    const { idcat } = req.params;

    con.query({
        sql: 'SELECT * FROM `category` WHERE `idcat` = ?',
        values: [idcat]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer le categorie d'id

// FEEDBACK ROUTES

app.get('/feedback/:idty', function (req, res) {
    const { idty } = req.params;

    con.query({
        sql: 'SELECT * FROM `feedback` WHERE `idty` = ? ORDER BY `date` DESC',
        values: [idty]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(JSON.stringify(result));
        res.status(200).send(JSON.stringify(result));
    });
}); // récupérer tout les feedback d'un type

app.post('/feedback/bug', function (req, res) {
    const { title } = req.body;
    const { content } = req.body;
    const { date } = req.body;
    const { plateform } = req.body;
    const { idty } = req.body;
    const { idu } = req.body;
    const { idas } = req.body;

    if(idas == null){
      con.query({
          sql: 'INSERT INTO `feedback` (`title`, `content`, `date`, `idty`, `plateform`, `idu`) VALUES (?,?,?,?,?,?)',
          values: [title, content, date, idty, plateform, idu]
      }, function (err, result, fields) {
          if (err) {
            console.log(err);
              res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
      });
    }
    if(idu == null){
      con.query({
          sql: 'INSERT INTO `feedback` (`title`, `content`, `date`, `idty`, `plateform`, `idas`) VALUES (?,?,?,?,?,?)',
          values: [title, content, date, idty, plateform, idas]
      }, function (err, result, fields) {
          if (err) {
            console.log(err);
              res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
      });
    }
});

app.post('/feedback/evaluation', function (req, res) {
    const { content } = req.body;
    const { date } = req.body;
    const { plateform } = req.body;
    const { idty } = req.body;
    const { idu } = req.body;
    const { idas } = req.body;
    const { note } = req.body;

    if(idas == null){
      con.query({
        sql: 'INSERT INTO `feedback` (`content`, `date`, `idty`, `plateform`, `idu`,`note`) VALUES (?,?,?,?,?,?)',
        values: [content, date, idty, plateform, idu, note]
      }, function (err, result, fields) {
        if (err) {
          console.log(err);
            res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
        });
      }
      if(idu == null){
        con.query({
          sql: 'INSERT INTO `feedback` (`content`, `date`, `idty`, `plateform`, `idas`,`note`) VALUES (?,?,?,?,?,?)',
          values: [content, date, idty, plateform, idas, note]
        }, function (err, result, fields) {
          if (err) {
            console.log(err);
            res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
        });
      }
}); // créer un feedback

app.put('/feedback/:idfe', function (req, res) {
    const { idfe } = req.params;
    con.query({
        sql: 'UPDATE `feedback` SET `status` = \'validate\' WHERE `idfe` = ?',
        values: [idfe]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result));
    });
}); // modifier un feedback d'id

// TRELLO ROUTES

app.post('/trello/feedback', async function (req, res) {
    const { appli } = req.body;
    const { idfe } = req.body;
    const { key } = req.body;
    const { token } = req.body;
    const { name } = req.body;
    const { desc } = req.body;

    let urlAndroid = 'https://api.trello.com/1/cards?idList=5eb56e17738b8434c33c3e57&key='+key+'&token='+token+'&name='+name+'&desc='+desc;
    let urlFlutter = 'https://api.trello.com/1/cards?idList=5eb6a36b92d7f26f8f63fdd2&key='+key+'&token='+token+'&name='+name+'&desc='+desc;
    let urlIos = 'https://api.trello.com/1/cards?idList=5eb6a39114a46d6925a8fee1&key='+key+'&token='+token+'&name='+name+'&desc='+desc;

    if (appli == "ANDROID") {
        fetch(urlAndroid, {
            method: 'POST'
        })
            .then(response => {
                console.log(
                    `Response: ${response.status} ${response.statusText}`
                );
                return response.text();
            })
            .then(text => {
                var result = JSON.parse(text);
                var idtrello = result.id;
                console.log(result);
                console.log(result.id);

                con.query({
                    sql: 'UPDATE `feedback` SET `idtrello` = ?, status = \'pending\' WHERE `idfe` = ?',
                    values: [idtrello, idfe]
                }, function (err, result, fields) {
                    if (err) {
                        res.status(500).send({error: "Internal Server Error"});
                    }
                    console.log(result);
                    res.status(200).send(result);
                });
            })
            .catch(err => console.error(err));
    }
    if (appli == "FLUTTER") {
        fetch(urlFlutter, {
            method: 'POST'
        })
            .then(response => {
                console.log(
                    `Response: ${response.status} ${response.statusText}`
                );
                return response.status(response.status).text().send();
            })
            .then(text => {
                var result = JSON.parse(text);
                var idtrello = result.id;
                console.log(result);
                console.log(result.id);

                con.query({
                    sql: 'UPDATE `feedback` SET `idtrello` = ?, status = \'pending\' WHERE `idfe` = ?',
                    values: [idtrello, idfe]
                }, function (err, result, fields) {
                    if (err) {
                        res.status(500).send({error: "Internal Server Error"});
                    }
                    console.log(result);
                    res.status(200).send(result);
                });
            })
            .catch(err => console.error(err));
    }
    if (appli == "IOS") {
        fetch(urlIos, {
            method: 'POST'
        })
            .then(response => {
                console.log(
                    `Response: ${response.status} ${response.statusText}`
                );
                return response.text();
            })
            .then(text => {
                var result = JSON.parse(text);
                var idtrello = result.id;
                console.log(result);
                console.log(result.id);

                con.query({
                    sql: 'UPDATE `feedback` SET `idtrello` = ? , status = \'pending\' WHERE `idfe` = ?',
                    values: [idtrello, idfe]
                }, function (err, result, fields) {
                    if (err) {
                        res.status(500).send({error: "Internal Server Error"});
                    }
                    console.log(result);
                    res.status(200).send(result);
                });
            })
            .catch(err => console.error(err));
    }
}); // Ajouter un feedback sur trello

// FEED ROUTES

app.get('/posts/:idu', function (req, res) {
  const { idu } = req.params;
    con.query({
        sql: 'SELECT posts.*,event.name as eventname,association.acronym as assoacro,association.logo FROM `user`,`association`,`event`,`followers`,`posts` WHERE user.idu= followers.idu and followers.idas=association.idas and association.idas = event.idas and event.idev = posts.idev and user.idu = ? ORDER BY posts.date DESC',
        values: [idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les posts

app.get('/posts/asso/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT posts.idpo,posts.message,posts.date,posts.idu,posts.idas,posts.idev FROM `posts`,event WHERE posts.idev = event.idev and event.idas = ? ORDER BY posts.date DESC',
        values: [idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les posts des évènements d'une asso (user+asso)

app.get('/posts/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT * FROM `posts` WHERE `idas` = ?',
        values: [idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les posts d'une association (Ceux écris par ces derniers)

app.post('/post/association', function (req, res) {
    const { message } = req.body;
    const { date } = req.body;
    const { idas } = req.body;
    const { idev } = req.body;

    con.query({
        sql: 'INSERT INTO `posts` (`message`, `date`, `idas`, `idev`) VALUES (?,?,?,?)',
        values: [message, date, idas, idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // créer des posts depuis un compte association

app.post('/post/user', function (req, res) {
    const { message } = req.body;
    const { date } = req.body;
    const { idu } = req.body;
    const { idev } = req.body;

    con.query({
        sql: 'INSERT INTO `posts` (`message`, `date`, `idu`, `idev`) VALUES (?,?,?,?)',
        values: [message, date, idu, idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // créer des posts depuis un compte user

app.delete('/post/:idpo', function (req, res) {
    const { idpo } = req.params;

    con.query({
        sql: 'DELETE FROM `posts` WHERE `idpo` = ?',
        values: [idpo]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        res.status(204).send();
    });
});

// EVENT ROUTES

app.get('/events/user/:idu', function (req, res) {
  const { idu } =req.params;
    con.query({
        sql: 'select event.* from user,association,event,followers where user.idu= followers.idu and followers.idas=association.idas and association.idas = event.idas and user.idu = ? ORDER BY event.dateDeb DESC',
        values: [idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les évènements

app.get('/event/:idev', function (req, res) {
    const { idev } = req.params;
    con.query({
        sql: 'SELECT * FROM `event` WHERE `idev` = ?',
        values: [idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer un évènement d'id

app.get('/events/association/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT * FROM `event` WHERE `idas` = ? ORDER BY event.dateDeb DESC',
        values: [idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les évènements d'une association

app.post('/event', function (req, res) {
    const { name } = req.body;
    const { description } = req.body;
    const { dateDeb } = req.body;
    const { dateFin } = req.body;
    const { location } = req.body;
    const { maxBenevole } = req.body;
    const { idcat } = req.body;
    const { idas } = req.body;

    con.query({
        sql: 'INSERT INTO `event` (`name`, `description`, `dateDeb`, `dateFin`, `location`, `maxBenevole`, `idcat`, `idas`,`fakeevent`) VALUES (?,?,?,?,?,?,?,?,false)',
        values: [name, description, dateDeb, dateFin, location, maxBenevole, idcat, idas]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // créer des events depuis un compte asso

app.patch('/event/:idev', function (req, res) {
    const { idev } = req.params;
    const { name } = req.body;
    const { description } = req.body;
    const { dateDeb } = req.body;
    const { dateFin } = req.body;
    const { location } = req.body;
    const { maxBenevole } = req.body;

    con.query({
        sql: 'UPDATE `event` SET `name` = ?, `description` = ?, `dateDeb` = ?, `dateFin` = ?, `location` = ?, `maxBenevole` = ? WHERE `idev` = ?',
        values: [name, description, dateDeb, dateFin, location, maxBenevole, idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // modifier un event d'id

//FOLLOW ROUTES
app.post('/follow',function (req, res) {
    const { idas } = req.body;
    const { idu } = req.body;

    con.query({
        sql: 'INSERT INTO `followers` (`idas`,`idu`) VALUES(?,?)',
        values: [idas, idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
});

app.get('/follow/:idas/:idu',function (req, res) {
    const { idas } = req.params;
    const { idu } = req.params;

    console.log(idas);
    console.log(idu);

    con.query({
        sql: 'SELECT * FROM `followers` WHERE`idas`=? and `idu`=?',
        values: [idas, idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.delete('/unfollow',function (req, res) {
    const { idas } = req.body;
    const { idu } = req.body;

    con.query({
        sql: 'DELETE FROM `followers` WHERE `idas`=? AND `idu`=?',
        values: [idas, idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
});

// PARTICIPATION ROUTES
app.get('/participate/:idev/:idu',function (req, res) {
    const { idev } = req.params;
    const { idu } = req.params;

    console.log(idev);
    console.log(idu);

    con.query({
        sql: 'SELECT * FROM `participation` WHERE`idev`=? and `idu`=?',
        values: [idev, idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.post('/participate',function (req, res) {
    const { idev } = req.body;
    const { idu } = req.body;
    const { participate } = req.body;
    const { status } = req.body;

    con.query({
        sql: 'INSERT INTO `participation` (`idev`,`idu`,`participate`,`status`) VALUES(?,?,?,?)',
        values: [idev, idu, participate, status]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
}); // indiquer que l'on participe à un évènement

app.patch('/participate/refuse',function (req, res) {
    const { status } = req.body;
    const { participate } = req.body;
    const { idev } = req.body;
    const { idu } = req.body;

    if (status == 0) {
        con.query({
            sql: 'UPDATE `participation` SET `status` = ?,`participate` = ? WHERE `idev` = ? AND `idu` = ?',
            values: [status, participate, idev, idu]
        }, function (err, result, fields) {
            if (err) {
                res.status(500).send({error: "Internal Server Error"});
            }
            console.log(result);
            res.status(200).send();
        });
    } else {
        res.status(400).send();
    }
}); // empécher un utilisateur qui c'est de-inscrit de participer

app.patch('/participate/status',function (req, res) {
    const { idev } = req.body;
    const { idu } = req.body;
    const { status } = req.body;
    const { startdate } = req.body;
    const { enddate } = req.body;
    const { participate } = req.body;

    con.query({
        sql: 'SELECT `startdate` FROM `participation` WHERE `idev` = ? and `idu` = ?',
        values: [idev,idu]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result[0].startdate);
        if (result[0].startdate == null) {
          if (status == 1) {
            con.query({
                sql: 'UPDATE `participation` SET `startdate` = ?, participate = ? WHERE `idev` = ? AND `idu` = ?',
                values: [startdate, participate, idev, idu]
            }, function (err, result, fields) {
                if (err) {
                    res.status(500).send({error: "Internal Server Error"});
                }
                console.log(result);
                res.status(200).send();
            });
          } else {
              res.status(400).send();
          }
        } else {
          if (status == 1) {
            con.query({
                sql: 'UPDATE `participation` SET `enddate` = ? WHERE `idev` = ? AND `idu` = ?',
                values: [enddate, idev, idu]
            }, function (err, result, fields) {
                if (err) {
                    res.status(500).send({error: "Internal Server Error"});
                }
                console.log(result);
                res.status(200).send();
            });
          } else {
              res.status(400).send();
          }
        }
    });
}); // indiquer les dates de participation de l'utilisateur

app.get('/participants/:idev', function (req, res) {
    const { idev } = req.params;

    con.query({
        sql: 'SELECT user.idu, user.name, user.firstname, user.profilpicture FROM participation, user WHERE participation.idu = user.idu AND participation.idev = ? AND participation.status = 1 ORDER BY user.name',
        values: [idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

// MEDIA ROUTES

app.get('/medias', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `media`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les médias

app.get('/media/:idme', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `media` WHERE `idme` = ?',
        values: [idme]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer le média d'id

// TYPE ROUTES

app.get('/types', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `type`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les types

app.get('/type/:idty', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `type` WHERE `idty` = ?',
        values: [idty]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer le type d'id

app.listen(3000, function () {
    console.log('Example app listening on port 3000 !');
});
