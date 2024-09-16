import dbconfig from '../src/configs/db-configs.js';
import CarritoRouter from '../src/Controllers/Carrito-Controller.js';
import TiendaRouter from '../src/Controllers/tienda-Controller.js';
import DireccionRouter from '../src/Controllers/DIrecciones-Controller.js';
import RecomendadosRouter from '../src/Controllers/Recomendados-Controller.js';
import PedidoRouter from '../src/Controllers/Pedido-Controller.js';
import PerfilRouter from '../src/Controllers/Perfil-Controller.js';
import ProductosRouter from '../src/Controllers/Productos-Controller.js';
import AgregarCarritoRouter from '../src/Controllers/AgregarCarrito-Controller.js';
import IniciarSesionRouter from '../src/Controllers/iniciarSesion-Controller.js';
import RegistroRouter from '../src/Controllers/registro-Controller.js';
import actualizarPasswordRouter from '../src/Controllers/actualizarContraseña-Controller.js';
import actualizarPerfilRouter from '../src/Controllers/editarPerfil-Controller.js';

import dotenv from 'dotenv';
dotenv.config();

import express from "express";
import cors from "cors";
import session from 'express-session';
import passport from 'passport';
import GoogleStrategy from 'passport-google-oauth20';
import pkg from 'pg';
const { Pool } = pkg;

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

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
const pool = new Pool({
    host: dbconfig.host,
    database: dbconfig.database,
    user: dbconfig.user,
    password: dbconfig.password,
    port: dbconfig.port,
});

passport.use(new GoogleStrategy({
    clientID: "487630240358-8pcdabos74sg2h53vnnv0cvo6io59a3d.apps.googleusercontent.com",
    clientSecret: "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",
    callbackURL: "http://localhost:3000/auth/google/callback"
  },
  async (accessToken, refreshToken, profile, done) => {
    try {
      const { id, displayName, emails } = profile;
      const res = await pool.query('SELECT * FROM usuario WHERE google_id = $1', [id]);
      let user = res.rows[0];

      if (!user) {
        const result = await pool.query(
          'INSERT INTO usuario (google_id, nombre, mail) VALUES ($1, $2, $3) RETURNING *',
          [id, displayName, emails[0].value]
        );
        user = result.rows[0];
      }

      return done(null, user);
    } catch (err) {
      return done(err, null);
    }
  }
));

// Serializa al usuario
passport.serializeUser((user, done) => {
    done(null, user.id);
});

// Deserializa al usuario
passport.deserializeUser(async (id, done) => {
  try {
      const res = await pool.query('SELECT * FROM usuario WHERE id = $1', [id]);
      const user = res.rows[0];
      done(null, user);
  } catch (err) {
      done(err, null);
  }
});

app.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

app.get('/auth/google/callback', 
  passport.authenticate('google', { failureRedirect: '/' }),
  (req, res) => {
    res.redirect('http://localhost:3001/view/home');
  }
);

app.use('/infoTiendas', TiendaRouter);
app.use('/direccion', DireccionRouter);
app.use('/recomendados', RecomendadosRouter);
app.use('/carrito', CarritoRouter);
app.use('/pedido', PedidoRouter);
app.use('/infoPerfil', PerfilRouter);
app.use('/productos', ProductosRouter);
app.use('/agregarAlCarrito', AgregarCarritoRouter);
app.use('/iniciarSesion', IniciarSesionRouter);
app.use('/registro', RegistroRouter);
app.use('/actualizarPassword', actualizarPasswordRouter);
app.use('/actualizarPerfil', actualizarPerfilRouter);

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
