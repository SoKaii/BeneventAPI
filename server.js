const express = require('express');
const mysql = require('mysql');

const app = express();
const PORT = process.env.PORT || 3000;
const config = require('./config.js')
const con = mysql.createConnection({
    host : config.host,
    user: config.user,  //user mysql
    password: config.password,  //password mysql
    database: config.database //db mysql
});
app.use(express.json());

con.connect( function(err) {
    if (err) throw err;
    console.log('Connected!');
});

app.get('/', function (req, res) {
    res.send('Hello World!')
});

app.post('/signup/user', async function (req, res) {
    const { name } = req.body;
    const { firstname } = req.body;
    const { age } = req.body;
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'INSERT INTO user (name, firstname, age, email, password) VALUES (?,?,?,?,?)',
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

app.post('/signup/association', async function (req, res) {
    const { name } = req.body;
    const { email } = req.body;
    const { password } = req.body;
    const { idcat } = req.body;

    await con.query({
        sql: 'INSERT INTO association (name, email, password, idcat) VALUES (?,?,?,?)',
        values: [name, email, password, idcat]
    }, function (err, result, fields) {
        if (err) {
            if (err.code == "ER_DUP_ENTRY") {
                res.status(400).send({error: "email/name already exist"});
            } else {
                res.status(400).send(err);
            }
        } else {
            console.log(result);
            res.status(201).send(result);
        }
    });
});

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
        if(result.length > 0) {
            console.log(result);
            res.status(200).send(result);
        } else {
            console.log(result);
            res.status(401).send({error: "Login or password is incorrect"});
        }
    })
});

app.post('/signin/user', async function (req, res) {
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM `user` WHERE `email` = ? AND `password` = ?',
        values: [email, password]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
        }
        if(result.length > 0) {
            console.log(result);
            res.status(200).send(result);
        } else {
            console.log(result);
            res.status(401).send({error: "Email or password is incorrect"});
        }
    })
});

app.post('/signin/association', async function (req, res) {
    const { email } = req.body;
    const { password } = req.body;

    await con.query({
        sql: 'SELECT * FROM `association` WHERE `email` = ? AND `password` = ?',
        values: [email, password]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
        }
        if(result.length > 0) {
            console.log(result);
            res.status(200).send(result);
        } else {
            console.log(result);
            res.status(401).send({error: "Email or password is incorrect"});
        }
    })
});

app.get('/users', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `user`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.get('/associations', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `association`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.get('/category', function (req, res) {
    con.query({
        sql: 'SELECT * FROM `category`'
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.get('/feedback/:idty', function (req, res) {
    const { idty } = req.params;

    con.query( {
        sql: 'SELECT * FROM `feedback` WHERE `idty` = ?',
        values: [idty]
    }, function (err, result, fields){
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
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
            res.status(500).send({error: "Internal Server Error"})
        }
        console.log(result);
        res.status(200).send(result);
    });
});

app.get('/association/category/:idcat', function (req, res) {
    const { idcat } = req.params;

    con.query({
        sql: 'SELECT * FROM `association` WHERE `idcat` = ?',
        values: [idcat]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
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
            res.status(500).send({error: "Internal Server Error"})
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
    const { description } = req.body;
    const { id } = req.params;

    con.query({
        sql: 'Update `user` SET `password` = ?, `phone` = ?, `profilpicture` = ?, `address` = ?, `description` = ? WHERE `idu` = ?',
        values: [password, phone, profilpicture, address, description, id]
    },function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
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
            res.status(500).send({error: "Internal Server Error"})
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
            res.status(500).send({error: "Internal Server Error"})
        }
        console.log(result);
        res.status(200).send(result);
    })
});

app.delete('/association/:id', function (req, res) {
    const { id } = req.params;

    con.query({
        sql: 'DELETE FROM `association` WHERE `idas` = ?',
        values: [id]
    }, function (err, result, fields) {
        if (err) {
            res.status(500).send({error: "Internal Server Error"})
        }
        console.log(result);
        res.status(200).send(result);
    })
})


app.listen(3000, function () {
    console.log('Example app listening on port 3000!')
});
