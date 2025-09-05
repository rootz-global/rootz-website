import http from "http";
import express from "express";
import path from "path";
let app = express();
const root = path.resolve('.');

app.use(express.static(path.join(root, 'static')));
// app.get("/favicon.ico", (req, res) => {
//     res.sendFile(root+'/favicon.ico');
// })
app.get('/',async (req,res)=>{
    res.sendFile(root+'/index.html');
});

let server = http.createServer(app);

server.listen(3000);
server.on('error', function(err) {
    console.log(err);
});
server.on('listening', function onListening() {
    console.log('Listening on> ' + server.address().port);
});
