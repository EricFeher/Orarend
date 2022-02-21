const express = require('express');
const route = require('./routes/routes');
const app = express();
const bodyParser = require('body-parser');
const upload = require("express-fileupload");
app.use(upload());
app.use(bodyParser.json());
app.use(express.static( "public" ) );
app.set("view engine", "ejs");
app.use(express.urlencoded({extended: false}));
app.use(route);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () =>{
    console.log("App listening at: http://localhost:8080/");
});