const express = require('express')
const fs = require('fs');
const app = express()
const port = 3000

var files = fs.readdirSync("./carpetaDeEjemploALeer");
var myJsonString = JSON.stringify(files);

app.get('/', (req, res) => {
  res.json(myJsonString)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

const { Http2ServerRequest } = require('http2');

console.log(files);
console.log(myJsonString);

