const mysql = require('mysql');
var express = require('express');
var app = express();
var cors = require('cors');
//const bodyParser = require('body-parser');

app.use(cors());

//app.use(bodyParser.urlencoded({extended: true}));
app.use(express.json());

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

app.post('/example', function(req,res){
  var newname = '"' + req.body.name + '"';
  var newcolor =  '"' + req.body.color + '"';
  var newmoons =  '"' + req.body.num_of_moons + '"';
  var newmass =  '"' + req.body.mass + '"';
  var newring =   '"' + req.body.rings + '"';
  con.query("INSERT INTO planets(name,color,num_of_moons,mass,rings) VALUES(" + newname + "," + newcolor + "," + newmoons + "," + newmass + "," + newring + ")", function(err,result)
  {
    if(err) throw err;
  });
});

app.post('/add', function(req,res){
  con.query("INSERT INTO planets(name,color,num_of_moons,mass,rings) VALUES(\"" + req.body.name + "\",\"" + req.body.color + "\",\"" + req.body.num_of_moons + "\",\"" + req.body.mass + "\",\"" + req.body.rings + "\")", function(err,result)
  {
    if(err) throw err;
  });
  res.status(200).json({message: "insert done"});// json(req.body);
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