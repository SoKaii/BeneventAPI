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
    database: config.database //database mysql
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
        sql: 'INSERT INTO `user` (`name`,`firstname`, `age`, `email`, `password`) VALUES (?,?,?,?,?)',
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
});

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
});

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
});

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
});

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
});

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
});

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
});

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
});

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
});

app.patch('/association/:id', function (req, res) {
    const { logo } = req.body;
    const { password } = req.body;
    const { phone } = req.body;
    const { website } = req.body;
    const { support } = req.body;
    const { id } = req.params;

    con.query({
        sql: 'Update `association` SET `logo` = ?, `password` = ?, `phone` = ?, `website` = ?, `support` = ? WHERE `idas` = ?',
        values: [logo, password, phone, website, support, id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

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
});

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
});

// CATEGORY ROUTES

app.get('/category', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `category`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

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
});

// FEEDBACK ROUTES

app.get('/feedback/:idty', function (req, res) {
    const { idty } = req.params;

    con.query({
        sql: 'SELECT * FROM `feedback` WHERE `idty` = ?',
        values: [idty]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(JSON.stringify(result));
        res.status(200).send(JSON.stringify(result));
    });
});

app.post('/feedback', function (req, res) {
    const { title } = req.body;
    const { content } = req.body;
    const { date } = req.body;
    const { idty } = req.body;

    con.query({
        sql: 'INSERT INTO `feedback` (`title`, `content`, `date`,  `idty`) VALUES (?,?,?,?)',
        values: [title, content, date, idty]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.patch('/feedback/:idfe', function (req, res) {

    con.query({
        sql: 'UPDATE `feedback` SET `status` = \'validate\' WHERE `idfe` = ?',
        values: [status, idfe]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result));
    });
});

app.get('/event/:idev',function (req,res){
  const { idev } = req.params;
  con.query({
    sql: 'select * from `event` where `idev` = ?',
    values: [idev]
  }, function(err,result,fields){
    if(err){
      res.status(500).send({error: "Internal Server Error"});
    }
    console.log(result);
    res.status(200).send(result);
  })
});

// JAVA ROUTES

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
});

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
}); // récupère tous les posts

app.get('/post/asso/:idas', function (req, res) {
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
}); // récupère tous les posts des évènements d'une asso (user+asso)

app.get('/post/:idas', function (req, res) {
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
}); // récupère tous les posts d'une association(Ceux écris par ces derniers)

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
});

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
});

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
});

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
});

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
});

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
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000 !');
});
