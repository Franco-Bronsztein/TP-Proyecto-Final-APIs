import { Router } from "express";
import actualizarContraseñaService from '../service/actualizarContraseña-service.js';

const router = Router();
const svc = new actualizarContraseñaService();

router.post('/', async (req, res) => {
    try {
        const { mail, password } = req.body;

        if (!mail || !password) {
            return res.status(400).json({ message: 'Correo y contraseña son requeridos' });
        }

        const userExists = await svc.checkUserExistsAsync(mail);

        if (!userExists) {
            return res.status(404).json({ message: 'El correo no existe' });
        }

        const result = await svc.newPasswordUpdaterAsync({ mail, password });

        if (result) {
            res.status(200).json({ message: 'Contraseña actualizada con éxito' });
        } else {
            res.status(500).send('Error al actualizar la contraseña');
        }
    } catch (error) {
        console.error(error);
        res.status(500).send('Error Interno');
    }
});

export default router;
