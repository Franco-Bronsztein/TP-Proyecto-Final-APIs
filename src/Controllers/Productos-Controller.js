import { Router } from "express";
import ProductosService from '../service/productos-service.js';

const router = Router();
const svc = new ProductosService();

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    let respuesta;
    try {
        const productos = await svc.getByIdAsync(id);
        if (productos) {
            respuesta = res.status(200).json(id);
        } else {
            respuesta = res.status(404).send('Productos no encontrados');
        }
    } catch (error) {
        console.error(error);
        respuesta = res.status(500).send('Error Interno');
    }
    return respuesta;
});

export default router;
