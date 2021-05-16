const express = require('express');
const bodyParser = require('body-parser')
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const mongoose = require('mongoose');
app.use(express.static(__dirname));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}))
const Message = mongoose.model('Message',{
  name : String,
  message : String
})
const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://dBadmin:ezops@cluster0.dulyi.mongodb.net/DevOps-test-ezopsretryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
client.connect(err => {
  const collection = client.db("test").collection("devices");
  // perform actions on the collection object
  client.close();
});
app.get('/messages', (req, res) => {
  Message.find({},(err, messages)=> {
    res.send(messages);
  })
})
app.get('/messages', (req, res) => {
  Message.find({},(err, messages)=> {
    res.send(messages);
  })
})
app.post('/messages', (req, res) => {
  const message = new Message(req.body);
  message.save((err) =>{
    if(err)
      sendStatus(500);
    io.emit('message', req.body);
    res.sendStatus(200);
  })
})
io.on('connection', () =>{
  console.log('a user is connected')
})
mongoose.connect,(err) => {
  console.log('mongodb connected',err);
}
const server = http.listen(3001, () => {
  console.log('server is running on port', server.address().port);
});