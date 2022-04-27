const express = require('express')
const fs = require('fs');
const app = express()
const port = 3000

var files = fs.readdirSync("./carpetaDeEjemploALeer");
const objeto = Object.assign({},files)
// var myJsonString = JSON.stringify(objeto);

app.get('/', (req, res) => {
  res.json(objeto)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

const { Http2ServerRequest } = require('http2');

//console.log(files);
//console.log(objeto);
//console.log(myJsonString);

