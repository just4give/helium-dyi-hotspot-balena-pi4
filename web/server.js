const express = require('express');
const app = express();
const axios = require('axios');

// Enable HTML template middleware
app.engine('html', require('ejs').renderFile);

// Enable static CSS styles
app.use(express.static('styles'));
app.use(express.static('img'));

// reply to request with "Hello World!"
app.get('/', async function (req, res) {
  let r = await axios({method:'GET',url: `https://api.helium.io/v1/blocks/height`, headers:{}});
  console.log(r.data);
  res.render('index.html',{bh: r.data.data.height});
});

app.get('/swarm_key', function(req, res){
  const file = `/var/data/miner/swarm_key`;
  res.download(file); // Set disposition and send it.
});

//start a server on port 80 and log its start to our console
var server = app.listen(80, function () {

  var port = server.address().port;
  console.log('Example app listening on port ', port);

});
