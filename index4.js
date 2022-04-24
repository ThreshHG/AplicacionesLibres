// HTTP Module for Creating Server and Serving Static Files Using Node.js
// Static Files: HTML, CSS, JS, Images
// Get Complete Source Code from Pabbly.com

var http = require('http');
var fs = require('fs');
var path = require('path');

const mime = {
  'jpg': 'image/jpg',
  'mp3': 'audio/mpeg3',
  'mp4': 'video/mp4'
}

http.createServer(function(req, res){

    if(req.url === "/"){
        fs.readFile("index.html", "UTF-8", function(err, html){
            res.writeHead(200, {"Content-Type": "text/html"});
            res.end(html);
        });
    }else if(req.url.match("\.css$")){
        var cssPath = path.join(__dirname, '.', req.url);
        var fileStream = fs.createReadStream(cssPath, "UTF-8");
        res.writeHead(200, {"Content-Type": "text/css"});
        fileStream.pipe(res);

    }else if(req.url.match("png$")){
        var imagePath = path.join(__dirname, '.', req.url);
        var fileStream = fs.createReadStream(imagePath);
        res.writeHead(200, {"Content-Type": "image/png"});
        fileStream.pipe(res);
    }else{
        res.writeHead(404, {"Content-Type": "text/html"});
        res.end("No Page Found");
    }

  const url = new URL('http://localhost:8080')
  let camino = 'static' + url.pathname
  if (camino == '.')
    camino = 'index.html'
  fs.stat(camino, error => {
    if (!error) {
      fs.readFile(camino, (error, contenido) => {
        if (error) {
          respuesta.writeHead(500, { 'Content-Type': 'text/plain' })
          respuesta.write('Error interno')
          respuesta.end()
        } else {
          const vec = camino.split('.')
          const extension = vec[vec.length - 1]
          const mimearchivo = mime[extension]
          respuesta.writeHead(200, { 'Content-Type': mimearchivo })
          respuesta.write(contenido)
          respuesta.end()
        }
      })
    }
  })

    var files = fs.readdirSync(".");
    console.log(files);
    console.log('Server running at http://localhost:8080/')
}).listen(8080);
