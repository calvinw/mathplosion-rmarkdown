var fs = require('fs');
var path = require('path');
var dirPath = path.resolve(__dirname); // path to your directory goes here
var filesList;
fs.readdir(dirPath, function(err, files){
  filesList = files.filter(function(e){
    return path.extname(e).toLowerCase() === '.rmd'
  });
    var id = 1;
    var arr = [];
  //console.log(filesList);
    for(f of filesList){
      var parsed = path.parse(f);
      var name = parsed.name;
	var item = {
	  id: id,
	  name: name,
	  children: [
	    { id: id*100+1, page: name + '.html', name: 'html', file: 'html' },
	    { id: id*100+2, page: name + '.Rmd', name: 'Rmd', file: 'md' },
	    { id: id*100+3, page: name + '.pdf', name: 'pdf', file: 'pdf'}
	  ]
	};
	arr.push(item);
	id++;
      //console.log(name);
    }
    console.log("var jsonItems =");
    console.log(JSON.stringify(arr, null, 2));
});
