// En postman se usa "localhost:3000"
// instalar npm install tedious 
 /* var Connection = require('tedious').Connection;  
    var config = {  
        server: '',  //A-PHZ2-CIDI-29   Nombre de compu
        authentication: {
            type: 'default',
            options: {
              trustedConnection: true
            }
        }
    };  
    var connection = new Connection(config);  
    connection.on('connect', function(err) {  
        // If no error, then good to proceed.
        console.log("Connected");  
    });
    
    connection.connect();

*/    //Si se comemta la concexion a BD(no anda tampoco) corre el programa

import Tienda from './Models/Tienda.js' 
import Usuario from './Models/Usuario.js' 
import express from "express"; // hacer npm i express
import cors from "cors"; // hacer npm i cors
const app = express();
const port = 3000;

app.use(cors()); 
app.use(express.json()); 

app.get('/', function (req, res)  {
    res.status(200).send(`..........`)
  })

app.get('/infoTiendas', function (req, res) {
    res.status(200).send(`..........`)
})  // Devuelve Objeto


  
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
    })