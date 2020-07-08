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

    await con.query({
        sql: 'INSERT INTO `user` (`name`, `firstname`, `age`, `email`, `password`) VALUES (?,?,?,?,?)',
        values: [name, firstname, age, email, password]
    }, function (err, result, fields) {
        if (err) {
            if (err.code == "ER_DUP_ENTRY") {
                res.status(400).send({error: "email already exist"});
            } else {
                res.status(400).send(err);
            }
        } else {
            console.log(result);
            res.status(201).send(result);
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
        sql: 'SELECT * FROM `user`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer tout les users de la bdd

app.get('/user/:id', function (req, res) {
    const { id } = req.params;

    con.query({
        sql: 'SELECT * FROM `user` WHERE `idu` = ?',
        values: [id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer le user d'id

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

app.patch('/user/:id', function (req, res) {
    const { password } = req.body;
    const { phone } = req.body;
    const { profilpicture } = req.body;
    const { address } = req.body;
    const { bio } = req.body;
    const { id } = req.params;

    con.query({
        sql: 'UPDATE `user` SET `password` = ?, `phone` = ?, `profilpicture` = ?, `address` = ?, `bio` = ? WHERE `idu` = ?',
        values: [password, phone, profilpicture, address, bio, id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // modifier le user d'id

app.delete('/user/:id', function (req, res) {
    const { id } = req.params;

    con.query({
        sql: 'DELETE FROM `user` WHERE `idu` = ?',
        values: [id]
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
    const { idcat } = req.body;

    await con.query({
        sql: 'INSERT INTO `association` (`name`, `email`, `password`, `idcat`) VALUES (?,?,?,?)',
        values: [name, email, password, idcat]
    }, function (err, result, fields) {
        if (err) {
            if (err.code == "ER_DUP_ENTRY") {
                res.status(400).send({error: "Email/Name already exist"});
            } else {
                res.status(400).send(err);
            }
        } else {
            console.log(result);
            res.status(201).send(result);
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

app.get('/associations', function (res, res) {
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
});

app.get('/associationdetail/:idas', function (req, res) {
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
}); // récupérer l'association d'id

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
    const { id } = req.params;

    con.query({
        sql: 'Update `association` SET `name` = ?, `email` = ?, `phone` = ?, `website` = ?, `support` = ? WHERE `idas` = ?',
        values: [name, email, phone, website, support, id]
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
        sql: 'SELECT * FROM `category`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // récupérer toutes les categories

app.get('/category/:idcat', function (req, res) {
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

app.post('/feedback', function (req, res) {
    const { title } = req.body;
    const { content } = req.body;
    const { date } = req.body;
    const { status } = req.body;
    const { plateform } = req.body;
    const { idty } = req.body;
    const { idu } = req.body

    con.query({
        sql: 'INSERT INTO `feedback` (`title`, `content`, `date`, `idty`, `plateform`, `status`, `idu`) VALUES (?,?,?,?,?,?,?)',
        values: [title, content, date, idty, plateform, status, idu]
    }, function (err, result, fields) {
        if (err) {
          console.log(err);
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send();
    });
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

app.get('/posts', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `posts`'
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
        sql: 'SELECT posts.idpo,posts.message,posts.date,posts.idu,posts.idas,posts.idev FROM `posts`,event WHERE posts.idev = event.idev and event.idas = ?',
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
        sql: 'INSERT INTO `post` (`message`, `date`, `idu`, `idev`) VALUES (?,?,?,?)',
        values: [message, date, idu, idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // créer des posts depuis un compte user

// EVENT ROUTES

app.get('/events', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `event`'
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

app.get('/events/:idas', function (req, res) {
    const { idas } = req.params;

    con.query({
        sql: 'SELECT * FROM `event` WHERE `idas` = ?',
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
        sql: 'INSERT INTO `event` (`name`, `description`, `dateDeb`, `dateFin`, `location`, `maxBenevole`, `idcat`, `idas`) VALUES (?,?,?,?,?,?,?,?)',
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
    const { description } = req.body;
    const { dateDeb } = req.body;
    const { dateFin } = req.body;
    const { location } = req.body;
    const { maxBenevole } = req.body;

    con.query({
        sql: 'UPDATE `event` SET `description` = ?, `dateDeb` = ?, `dateFin` = ?, `location` = ?, `maxBenevole` = ? WHERE `idev` = ?',
        values: [description, dateDeb, dateFin, location, maxBenevole, idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // modifier un event d'id

// PARTICIPATION ROUTES

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

    if (status == 1) {
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
