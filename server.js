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
con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

app.get('/', function (req, res) {
    res.send('Hello World!')
});

app.get('/users', async function (req, res) {
        await con.query("SELECT * FROM user", function (err, result, fields) {
            if (err) throw err;
            console.log(result);
            res.send(result);
        });
});

app.post('/signin', function (req, res) {
  console.log(req.body);
    var email = req.body.login;
    var password = req.body.password;
    res.status(200).send();
});

app.listen(PORT, function () {
    console.log('Example app listening on port 3000!')
});
