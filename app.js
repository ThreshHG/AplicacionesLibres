const express = require('express')
const fs = require('fs');
var app = express()
const port = 3000
app.use(express.static('./'));


var files = fs.readdirSync("./carpetaDeEjemploALeer");
var objeto = Object.assign({},files)
//var res = objeto.replace("\"", "'");
var myJsonString = JSON.stringify(objeto);

app.get('/', function(req, res) {
    res.render('./index.html');
});

app.get('/api', (req, res) => {
  res.json(myJsonString)
})



app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


//console.log(files);
//console.log(objeto);
//console.log(myJsonString);

