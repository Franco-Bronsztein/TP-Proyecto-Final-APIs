import { Router } from "express";
import PerfilService from '../service/Perfil-service.js';

const router = Router();
const svc = new PerfilService();

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    let respuesta;
    try {
        const perfil = await svc.getByIdAsync(id);
        if (perfil) {
            respuesta = res.status(200).json(perfil);
        } else {
            respuesta = res.status(404).send('Perfil no encontrado');
        }
    } catch (error) {
        console.error(error);
        respuesta = res.status(500).send('Error Interno');
    }
    return respuesta;
});

export default router;
