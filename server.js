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

(async function () {
  try {
    await con.connect();
    console.log('Connected !');
  } catch (err) { console.log(err.stack); }
})();

app.listen(PORT, function () {
    console.log('Example app listening on port 3000 !');
});

setInterval(function () {
    con.query('SELECT 1');
}, 10000); // Keep connection alive

app.get('/', function (req, res) {
    res.send('Hello World !')
}); // Basic route


// ADMIN ROUTES

app.post('/signin/admin', async function (req, res) {
    const { login } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM admin WHERE login = ? AND password = ?',
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
}); // permit admin to connect


// ASSOCIATION ROUTES

app.get('/associations', function (req, res) {
    con.query({
        sql: 'SELECT * FROM association'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all associations in db

app.get('/association/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'SELECT * FROM association WHERE idassociation = ?',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get association by idassociation

app.get('/association/details/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'SELECT * FROM association WHERE idassociation = ?',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result[0]));
    });
}); // get association by idassociation (Json Stringifyed)

app.get('/associations/category/:idcategory', function (req, res) {
    const { idcategory } = req.params;

    con.query({
        sql: 'SELECT * FROM association WHERE idcategory = ?',
        values: [idcategory]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all associations concerned by a category

app.post('/signup/association', async function (req, res) {
    const { name } = req.body;
    const { email } = req.body;
    const { password } = req.body;
    const { logo } = req.body;
    const { idcategory } = req.body;

    await con.query({
        sql: 'INSERT INTO association (name, email, password, logo, idcategory) VALUES (?,?,?,?,?)',
        values: [name, email, password, logo, idcategory]
    }, function (err, result, fields) {
        if (err) {
            if (err.code == "ER_DUP_ENTRY") {
                res.status(400).send({error: "Email/Name already exist"});
            } else {
                res.status(400).send(err);
            }
        } else {
            console.log(result.insertId);
          const idassociation = result.insertId;
          con.query({ //FakeEvent for association post without selected event
              sql: 'INSERT INTO event(name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES("","",\'2000-01-01 00:00:00\',\'2000-01-01 00:00:00\',"",0,7,?,true)',
              values: [idassociation]
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
}); // create a new association in db

app.post('/signin/association', async function (req, res) {
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM association WHERE email = ? AND password = ?',
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
}); // permit association to connect

app.patch('/association/:idassociation', function (req, res) {
    const { name } = req.body;
    const { email } = req.body;
    const { phone } = req.body;
    const { website } = req.body;
    const { support } = req.body;
    const { acronym } = req.body;
    const { logo } = req.body;
    const { idassociation } = req.params;

    con.query({
        sql: 'Update association SET name = ?, email = ?, phone = ?, website = ?, support = ?, acronym = ?, logo = ? WHERE idassociation = ?',
        values: [name, email, phone, website, support, acronym, logo, idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // modify association by idassociation

app.delete('/association/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'DELETE FROM association WHERE idassociation = ?',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(204).send(result);
    });
}); // delete association by idassociation


// CATEGORY ROUTES

app.get('/categories', function (req, res) {
    con.query({
        sql: 'SELECT * FROM category ORDER BY category.name ASC'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all categories in db

app.get('/category/:idcategory', function (req, res) {
    const { idcategory } = req.params;

    con.query({
        sql: 'SELECT * FROM category WHERE idcategory = ?',
        values: [idcategory]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get category by idcategory


// EVENT ROUTES

app.get('/events/user/:iduser', function (req, res) {
    const { iduser } = req.params;
      con.query({
          sql: 'SELECT event.* FROM user, association, event, follower WHERE user.iduser = follower.iduser AND follower.idassociation = association.idassociation AND association.idassociation = event.idassociation AND user.iduser = ? ORDER BY event.startdate DESC',
          values: [iduser]
      }, function (err, result, fields) {
          if (err) {
              res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send(result);
      });
  }); // get all events concerned an user

app.get('/event/:idevent', function (req, res) {
    const { idevent } = req.params;
    con.query({
        sql: 'SELECT * FROM event WHERE idevent = ?',
        values: [idevent]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get event by idevent

app.get('/events/association/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'SELECT * FROM event WHERE idassociation = ? ORDER BY event.startdate DESC',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all events concerned by an association

app.post('/event', function (req, res) {
    const { name } = req.body;
    const { description } = req.body;
    const { startdate } = req.body;
    const { enddate } = req.body;
    const { location } = req.body;
    const { maxbenevole } = req.body;
    const { idcategory } = req.body;
    const { idassociation } = req.body;

    con.query({
        sql: 'INSERT INTO event (name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation, fakeevent) VALUES (?,?,?,?,?,?,?,?,false)',
        values: [name, description, startdate, enddate, location, maxbenevole, idcategory, idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // create an event

app.patch('/event/:idevent', function (req, res) {
    const { idevent } = req.params;
    const { name } = req.body;
    const { description } = req.body;
    const { startdate } = req.body;
    const { enddate } = req.body;
    const { location } = req.body;
    const { maxbenevole } = req.body;

    con.query({
        sql: 'UPDATE event SET name = ?, description = ?, startdate = ?, enddate = ?, location = ?, maxbenevole = ? WHERE idevent = ?',
        values: [name, description, startdate, enddate, location, maxbenevole, idevent]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // modify an event by idevent

app.delete('/event/:idev', function (req, res) {
    const { idev } = req.params;

    con.query({
        sql: 'DELETE FROM event WHERE idev = ?',
        values: [idev]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        res.status(204).send();
    });
}); // delete an event by idevent
  

// FEEDBACK ROUTES

app.get('/feedback/:idtype', function (req, res) {
    const { idtype } = req.params;

    con.query({
        sql: 'SELECT * FROM feedback WHERE idtype = ? ORDER BY date DESC',
        values: [idtype]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(JSON.stringify(result));
        res.status(200).send(JSON.stringify(result));
    });
}); // get all feedback concerned by a type

app.post('/feedback/bug', function (req, res) {
    const { title } = req.body;
    const { content } = req.body;
    const { date } = req.body;
    const { platform } = req.body;
    const { idtype } = req.body;
    const { iduser } = req.body;
    const { idassociation } = req.body;

    if(idassociation == null){
      con.query({
          sql: 'INSERT INTO feedback (title, content, date, idtype, platform, iduser) VALUES (?,?,?,?,?,?)',
          values: [title, content, date, idtype, platform, iduser]
      }, function (err, result, fields) {
          if (err) {
            console.log(err);
              res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
      });
    }
    if(iduser == null){
      con.query({
          sql: 'INSERT INTO feedback (title, content, date, idtype, platform, idassociation) VALUES (?,?,?,?,?,?)',
          values: [title, content, date, idtype, platform, idassociation]
      }, function (err, result, fields) {
          if (err) {
            console.log(err);
              res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
      });
    }
}); // post a new feedback in db

app.post('/feedback/rating', function (req, res) {
    const { content } = req.body;
    const { date } = req.body;
    const { platform } = req.body;
    const { idtype } = req.body;
    const { iduser } = req.body;
    const { idassociation } = req.body;
    const { note } = req.body;

    if(idassociation == null){
      con.query({
        sql: 'INSERT INTO feedback (content, date, idtype, platform, iduser, note) VALUES (?,?,?,?,?,?)',
        values: [content, date, idtype, platform, iduser, note]
      }, function (err, result, fields) {
        if (err) {
          console.log(err);
            res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
        });
      }
      if(iduser == null){
        con.query({
          sql: 'INSERT INTO feedback (content, date, idtype, platform, idassociation, note) VALUES (?,?,?,?,?,?)',
          values: [content, date, idtype, platform, idassociation, note]
        }, function (err, result, fields) {
          if (err) {
            console.log(err);
            res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send();
        });
      }
}); // post a new rating in db

app.put('/feedback/:idfeedback', function (req, res) {
    const { status } = req.body;
    const { idfeedback } = req.params;

    con.query({
        sql: 'UPDATE feedback SET status = ? WHERE idfeedback = ?',
        values: [status, idfeedback]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result));
    });
}); // modify a feedback by idfeedback


//FOLLOW ROUTES

app.get('/follow/:idassociation/:iduser',function (req, res) {
    const { idassociation } = req.params;
    const { iduser } = req.params;

    con.query({
        sql: 'SELECT * FROM follower WHERE idassociation = ? and iduser = ?',
        values: [idassociation, iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all follows of an user

app.post('/follow',function (req, res) {
    const { idassociation } = req.body;
    const { iduser } = req.body;

    con.query({
        sql: 'INSERT INTO follower (idassociation, iduser) VALUES(?,?)',
        values: [idassociation, iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
}); // permit an user to follow an association

app.delete('/unfollow',function (req, res) {
    const { idassociation } = req.body;
    const { iduser } = req.body;

    con.query({
        sql: 'DELETE FROM follower WHERE idassociation = ? AND iduser = ?',
        values: [idassociation, iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
}); // permit an user to unfollow an association


// PARTICIPATION ROUTES

app.get('/participants/:idev', function (req, res) {
    const { idevent } = req.params;

    con.query({
        sql: 'SELECT user.iduser, user.name, user.firstname, user.profilpicture FROM participation, user WHERE participation.iduser = user.iduser AND participation.idevent = ? AND participation.status = 1 ORDER BY user.name',
        values: [idevent]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all participants of an event

app.get('/participate/:idevent/:iduser',function (req, res) {
    const { idevent } = req.params;
    const { iduser } = req.params;

    con.query({
        sql: 'SELECT * FROM participation WHERE idevent = ? and iduser = ?',
        values: [idevent, iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // permit to check if an user participe to an event

app.post('/participate',function (req, res) {
    const { idevent } = req.body;
    const { iduser } = req.body;
    const { participate } = req.body;
    const { status } = req.body;

    con.query({
        sql: 'INSERT INTO participation (idevent, iduser, participate, status) VALUES(?,?,?,?)',
        values: [idevent, iduser, participate, status]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
}); // permit an user to signup of an event

app.patch('/participate/refuse',function (req, res) {
    const { status } = req.body;
    const { participate } = req.body;
    const { idevent } = req.body;
    const { iduser } = req.body;

    if (status == 0) {
        con.query({
            sql: 'UPDATE participation SET status = ?, participate = ? WHERE idevent = ? AND iduser = ?',
            values: [status, participate, idevent, iduser]
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
}); // permit an use to signout of an event

app.patch('/participate/status',function (req, res) {
    const { idevent } = req.body;
    const { iduser } = req.body;
    const { status } = req.body;
    const { startdate } = req.body;
    const { enddate } = req.body;
    const { participate } = req.body;

    con.query({
        sql: 'SELECT startdate FROM participation WHERE idevent = ? and iduser = ?',
        values: [idevent,iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result[0].startdate);
        if (result[0].startdate == null) {
          if (status == 1) {
            con.query({
                sql: 'UPDATE participation SET startdate = ?, participate = ? WHERE idevent = ? AND iduser = ?',
                values: [startdate, participate, idevent, iduser]
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
                sql: 'UPDATE participation SET enddate = ? WHERE idevent = ? AND iduser = ?',
                values: [enddate, idevent, iduser]
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
}); // permit to update participation


// POSTS ROUTES

app.get('/posts/:iduser', function (req, res) {
    const { iduser } = req.params;
      con.query({
          sql: 'SELECT post.*, event.name AS eventname, association.acronym AS assoacro, association.logo AS pictureprofilasso FROM user, association, event, follower, post WHERE user.iduser = follower.iduser AND follower.idassociation = association.idassociation AND association.idassociation = event.idassociation AND event.idevent = post.idevent AND user.iduser = ? ORDER BY post.date DESC',
          values: [iduser]
      }, function (err, result, fields) {
          if (err) {
              res.status(500).send({error: "Internal Server Error"});
          }
          console.log(result);
          res.status(200).send(result);
      });
  }); // get all posts concerned by an user
  
app.get('/posts/association/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'SELECT post.idpost, post.message, post.date, post.iduser, post.idassociation, post.idevent FROM post, event WHERE post.idevent = event.idevent AND event.idassociation = ? ORDER BY post.date DESC',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all posts concerned by an event of an association

app.get('/posts/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'SELECT * FROM post WHERE idassociation = ?',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all posts of an association

app.post('/post/association', function (req, res) {
    const { message } = req.body;
    const { date } = req.body;
    const { idassociation } = req.body;
    const { idevent } = req.body;

    con.query({
        sql: 'INSERT INTO post (message, date, idassociation, idevent) VALUES (?,?,?,?)',
        values: [message, date, idassociation, idevent]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // create post from an account association

app.post('/post/user', function (req, res) {
    const { message } = req.body;
    const { date } = req.body;
    const { iduser } = req.body;
    const { idevent } = req.body;

    con.query({
        sql: 'INSERT INTO post (message, date, iduser, idevent) VALUES (?,?,?,?)',
        values: [message, date, iduser, idevent]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // create post from an account user

app.delete('/post/:idpost', function (req, res) {
    const { idpost } = req.params;

    con.query({
        sql: 'DELETE FROM posts WHERE idpost = ?',
        values: [idpost]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        res.status(204).send();
    });
}); // delete a post by idpost
  

// NEWS ROUTES

app.post('/news',function (req, res) {
    const { title } = req.body;
    const { content } = req.body;
    const { date } = req.body;

    con.query({
        sql: 'INSERT INTO news (title, content, date) VALUES(?,?,?)',
        values: [title, content, date]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: err});
        }
        console.log(result);
        res.status(200).send();
    });
}); // permit an admin to send a news


// TRELLO ROUTES

app.post('/trello/feedback', async function (req, res) {
    const { appli } = req.body;
    const { idfeedback } = req.body;
    const { key } = req.body;
    const { token } = req.body;
    const { name } = req.body;
    const { desc } = req.body;
    const { status } = req.body;

    let urlAndroid = 'https://api.trello.com/1/cards?idList=5eb56e17738b8434c33c3e57&key=' + key + '&token=' + token + '&name=' + name + '&desc=' + desc;
    let urlFlutter = 'https://api.trello.com/1/cards?idList=5eb6a36b92d7f26f8f63fdd2&key=' + key + '&token=' + token + '&name=' + name + '&desc=' + desc;
    let urlIos = 'https://api.trello.com/1/cards?idList=5eb6a39114a46d6925a8fee1&key=' + key + '&token=' + token + '&name=' + name + '&desc=' + desc;

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
                    sql: 'UPDATE feedback SET idtrello = ?, status = ?, content = ? WHERE idfeedback = ?',
                    values: [idtrello, status, desc, idfeedback]
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
                return response.text();
            })
            .then(text => {
                var result = JSON.parse(text);
                var idtrello = result.id;
                console.log(result);
                console.log(result.id);

                con.query({
                    sql: 'UPDATE feedback SET idtrello = ?, status = ?, content = ? WHERE idfeedback = ?',
                    values: [idtrello, status, desc, idfeedback]
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
                    sql: 'UPDATE feedback SET idtrello = ?, status = ?, content = ? WHERE idfeedback = ?',
                    values: [idtrello, status, desc, idfeedback]
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
}); // add a new feedback on trello


// USER ROUTES

app.get('/users', function (req, res) {
    con.query({
        sql: 'SELECT iduser, name, firstname, birthdate, profilpicture FROM user'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all users in db

app.get('/user/:iduser', function (req, res) {
    const { iduser } = req.params;

    con.query({
        sql: 'SELECT iduser, name, firstname, birthdate, profilpicture, phone FROM user WHERE iduser = ?',
        values: [iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get user by iduser

app.get('/users/association/:idassociation', function (req, res) {
    const { idassociation } = req.params;

    con.query({
        sql: 'SELECT DISTINCT user.* FROM post, user, association, event WHERE user.iduser = post.iduser AND post.idevent = event.idevent AND event.idassociation = association.idassociation AND association.idassociation = ?',
        values: [idassociation]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // get all users concerned by an association

app.get('/user/detail/:iduser', function (req, res) {
    const { iduser } = req.params;

    con.query({
        sql: 'SELECT * FROM user WHERE iduser = ?',
        values: [iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(JSON.stringify(result[0]));
    });
}); // get user by iduser (Json Stringifyed)

app.post('/signup/user', async function (req, res) {
    const { name } = req.body;
    const { firstname } = req.body;
    const { birthdate } = req.body;
    const { email } = req.body;
    const { password } = req.body;
    const { phone } = req.body;
    const { profilpicture } = req.body;

    await con.query({
        sql: 'INSERT INTO user (name, firstname, birthdate, email, password, phone, profilpicture) VALUES (?,?,?,?,?,?,?)',
        values: [name, firstname, birthdate, email, password, phone, profilpicture]
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
}); // create a new user in db

app.post('/signin/user', async function (req, res) {
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM user WHERE email = ? AND password = ?',
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
}); // permit user to connect

app.patch('/user/:iduser', function (req, res) {
    const { name } = req.body;
    const { firstname } = req.body;
    const { phone } = req.body;
    const { profilpicture } = req.body;
    const { iduser } = req.params;

    con.query({
        sql: 'UPDATE user SET name = ?, firstname = ?, phone = ?, profilpicture = ? WHERE iduser = ?',
        values: [name, firstname, phone, profilpicture, iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send();
    });
}); // modify user by iduser

app.delete('/user/:iduser', function (req, res) {
    const { iduser } = req.params;

    con.query({
        sql: 'DELETE FROM user WHERE iduser = ?',
        values: [iduser]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"});
        }
        console.log(result);
        res.status(200).send(result);
    });
}); // delete user by iduser










