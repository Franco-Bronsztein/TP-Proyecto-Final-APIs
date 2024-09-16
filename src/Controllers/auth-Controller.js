import express from 'express';
import passport from 'passport';

const AuthRouter = express.Router();

// Ruta para iniciar sesión con Google
AuthRouter.get('/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// Ruta de callback después de la autenticación
AuthRouter.get('/google/callback', 
  passport.authenticate('google', { failureRedirect: '/' }),
  (req, res) => {
    // Redirigir a una página después del éxito en la autenticación
    res.redirect('/');
  }
);

export default AuthRouter;
