const fs = require('fs');

var files = fs.readdirSync("./carpetaDeEjemploALeer");
//console.log(files);
module.exports = files;
