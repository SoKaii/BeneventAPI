const express = require('express');
const mysql = require('mysql');

const app = express();
const PORT = process.env.PORT || 3000;
const con = mysql.createConnection({
    host : "localhost",
    user: "beneventadmin",  //user mysql
    password: "admin",  //password mysql
    database: "benevent" //db mysql
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

app.get('/', function (req, res) {
    res.send('Hello World!')
});

app.get('/users', function (req, res) {
        con.query("SELECT * FROM user", function (err, result, fields) {
            if (err) throw err;
            console.log(result);
            res.send(result);
        });
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!')
});