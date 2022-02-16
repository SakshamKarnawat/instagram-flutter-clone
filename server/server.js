// Imports
const express = require('express'),
PORT = process.env.PORT || 3000,
http = require('http'),
mongoose = require('mongoose');

// Create server
const app = express();
var server = http.createServer(app);

// Middleware
app.use(express.json());

// Listening to server
server.listen(PORT, "0.0.0.0", () => {
    console.log(`Server up and running on http://localhost:${PORT}`);
});

// Connecting to MongoDB


app.get('/', (req,res) => {
    res.status(200).send({
        home: 'home'
    })
})

app.get('/login', () => {

})

app.get('/signup', () => {
    
})

app.get('/home', (req, res) => {
    res.status(200).send({
        home: 'home'
    })
})
