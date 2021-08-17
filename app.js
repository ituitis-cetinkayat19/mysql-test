const mysql = require('mysql');
var express = require('express');
var app = express();
var cors = require('cors');

app.use(cors());

const con = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'deneme'
});

con.connect((err) => {
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});

app.get('/favicon.ico', (req, res) => res.status(204));

app.get('/name', function(req, res){
  con.query("SELECT id, name FROM planets", function(err,result)
  {
    if(err) throw err;
    res.json(result);
  });
});

app.get('/color', function(req, res){
  con.query("SELECT id, color FROM planets", function(err,result)
  {
    if(err) throw err;
    res.json(result);
  });
});

app.get('/all', function(req, res){
  con.query("SELECT * FROM planets", function(err,result)
  {
    if(err) throw err;
    res.json(result);
  });
});

app.get('/:id([0-9])', function(req,res){
  con.query("SELECT * FROM planets WHERE id = " + req.params.id, function(err,result)
  {
    if(err) throw err;
    res.json(result[0]);
  });
});

app.get('*', function(req, res){
   res.send('Sorry, this is an invalid URL.');
});

app.listen(2000);