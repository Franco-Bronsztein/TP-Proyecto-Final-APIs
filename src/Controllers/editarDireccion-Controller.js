import { Router } from "express";
import editarDireccionService from '../service/editarDireccion-service.js';

const router = Router();
const svc = new editarDireccionService();

router.post('/editarDireccion', async (req, res) => {
    try {
        const result = await svc.editarDireccionAsync(req.body);
        if (result) {
            res.status(200).json({ message: "Dirección actualizada correctamente" });
        } else {
            res.status(500).send('Error al actualizar la dirección');
        }
    } catch (error) {
        console.error(error);
        res.status(500).send('Error interno');
    }
});

export default router;
