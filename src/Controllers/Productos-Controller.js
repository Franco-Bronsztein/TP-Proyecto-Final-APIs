import { Router } from "express";
import ProductosService from '../service/productos-service.js';

const router = Router();
const svc = new ProductosService();

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    try {
        const productos = await svc.getByIdAsync(id);
        if (productos && productos.length > 0) {
            res.status(200).json(productos); 
        } else {
            res.status(404).send('Producto no encontrado');
        }
    } catch (error) {
        console.error(error);
        res.status(500).send('Error Interno');
    }
});

export default router;
