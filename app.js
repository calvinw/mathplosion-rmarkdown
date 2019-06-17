var liveServer = require("live-server");
var path = require("path");

var params = {
    port: 8080, 
    host: "0.0.0.0", 
    root: ".", 
    open: false, 
    watch: ["changed.txt"],
//  ignore: ["Makefile", "*.Rmd", "*.md"],
    file: "index.html", 
    logLevel: 2, // 0 = errors only, 1 = some, 2 = lots
    middleware: [
        function(req, res, next) { 
            //console.log("req.url is " + req.url);  

            //Fix the content type and dispositon of Rmd files - ugh!
            if(path.extname(req.url) === ".Rmd") {
              var basename = path.basename(req.url);
              var header = 'inline; filename="' + basename + '"';
              //console.log("header is " + header);
              res.setHeader('Content-Disposition', header);
              res.setHeader('content-type', "text/plain;charset=utf8");
            }
           next(); 
        }
    ]
};

liveServer.start(params);
