import { Router } from "express";
import editarPerfilService from '../service/editarPerfil-service.js';

const router = Router();
const svc = new editarPerfilService();

router.post('/editar', async (req, res) => {
    try {
        const result = await svc.editarPerfilAsync(req.body);
        if (result) {
            res.status(200).json(result);
        } else {
            res.status(500).send('Error Interno');
        }
    } catch (error) {
        console.error(error);
        res.status(500).send('Error Interno');
    }
});

export default router;
