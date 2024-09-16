// En postman se usa "localhost:3000"
//instalar npm i pg

import CarritoRouter from '../src/Controllers/Carrito-Controller.js'
import TiendaRouter from '../src/Controllers/tienda-Controller.js'
import DireccionRouter from '../src/Controllers/DIrecciones-Controller.js'
import RecomendadosRouter from '../src/Controllers/Recomendados-Controller.js'
import PedidoRouter from '../src/Controllers/Pedido-Controller.js'
import PerfilRouter from '../src/Controllers/Perfil-Controller.js';
import ProductosRouter from '../src/Controllers/Productos-Controller.js'
import AgregarCarritoRouter from '../src/Controllers/AgregarCarrito-Controller.js'
import IniciarSesionRouter from  '../src/Controllers/iniciarSesion-Controller.js'
import RegistroRouter from '../src/Controllers/registro-Controller.js';
import actualizarPasswordRouter from '../src/Controllers/actualizarContraseña-Controller.js';
import actualizarPerfilRouter from '../src/Controllers/editarPerfil-Controller.js';

import dotenv from 'dotenv';
dotenv.config();


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

app.use('/productos', ProductosRouter)

app.use('/agregarAlCarrito',AgregarCarritoRouter)

app.use('/iniciarSesion', IniciarSesionRouter)

app.use('/registro', RegistroRouter)

app.use('/actualizarPassword', actualizarPasswordRouter)

app.use('/actualizarPerfil',actualizarPerfilRouter )

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
    })

// GOOGLE AUTH
import AuthRouter from '../src/Controllers/auth-Controller.js';
import passport from 'passport';
import GoogleStrategy from 'passport-google-oauth20';
import session from 'express-session';


app.use('/auth', AuthRouter);
// Configurar las sesiones
app.use(session({
    secret: 'franco1234', // Cambia esto por una clave segura
    resave: false,
    saveUninitialized: true,
}));

// Inicializar passport y sesiones
app.use(passport.initialize());
app.use(passport.session());

// Configura la estrategia de Google
passport.use(new GoogleStrategy({
    clientID: "487630240358-8pcdabos74sg2h53vnnv0cvo6io59a3d.apps.googleusercontent.com",   // De tu archivo .env
    clientSecret: "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",  // De tu archivo .env
    callbackURL: "http://localhost:3000/auth/google/callback"
  },
  (accessToken, refreshToken, profile, done) => {
    // Aquí puedes verificar el usuario en la base de datos o crear uno nuevo
    // Por simplicidad, devolvemos el perfil de Google tal como es
    return done(null, profile);
  }
));

// Serializa al usuario
passport.serializeUser((user, done) => {
    done(null, user);
});

// Deserializa al usuario
passport.deserializeUser((user, done) => {
    done(null, user);
});

// Ruta para iniciar sesión con Google
app.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// Ruta para el callback de Google después de la autenticación
app.get('/auth/google/callback', 
  passport.authenticate('google', { failureRedirect: '/' }),
  (req, res) => {
    // Aquí rediriges a la página que prefieras después del login exitoso
    res.redirect('/');
  }
);