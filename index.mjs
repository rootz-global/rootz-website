import http from "http";
import express from "express";
import path from "path";
import { createProxyMiddleware } from 'http-proxy-middleware';

let app = express();
const root = path.resolve('.');

// FIXED: Proxy /.rootz/* requests to SKS Rootz Platform on port 8000
app.use('/.rootz/*', createProxyMiddleware({
    target: 'http://localhost:8000',
    changeOrigin: true,
    logLevel: 'debug',
    onError: (err, req, res) => {
        console.error('Proxy error:', err.message);
        res.status(500).json({ error: 'Service temporarily unavailable' });
    },
    onProxyReq: (proxyReq, req, res) => {
        console.log('Original URL:', req.originalUrl);
        console.log('Proxy URL:', proxyReq.path);
    }
}));

app.use(express.static(path.join(root, 'static')));

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
