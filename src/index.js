// En postman se usa "localhost:3000"
//instalar npm i pg

import CarritoRouter from '../src/Controllers/Carrito-Controller.js'
import TiendaRouter from '../src/Controllers/tienda-Controller.js'
import DireccionRouter from '../src/Controllers/DIrecciones-Controller.js'
import RecomendadosRouter from '../src/Controllers/Recomendados-Controller.js'
import PedidoRouter from '../src/Controllers/Pedido-Controller.js'
import PerfilRouter from '../src/Controllers/Perfil-Controller.js'; // Importar el nuevo controlador

import express from "express"; // hacer npm i express
import cors from "cors"; // hacer npm i cors
const app = express();
const port = 3000;

app.use(cors());  
app.use(express.json()); 

app.get('/', function (req, res)  {
    res.status(200).send(`..........`)
  })

app.use('/infoTiendas', TiendaRouter)

app.use('/direccion', DireccionRouter)

app.use('/recomendados',RecomendadosRouter)

app.use('/carrito', CarritoRouter)

app.use('/pedido', PedidoRouter)

app.use('/infoPerfil', PerfilRouter); 


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
    })