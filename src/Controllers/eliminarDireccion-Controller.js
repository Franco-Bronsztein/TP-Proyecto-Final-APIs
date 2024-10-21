import { Router } from "express";
import eliminarDireccionService from '../service/eliminarDireccion-Service.js';

const router = Router();
const svc = new eliminarDireccionService();

router.delete('/:id/:idusuario', async (req, res) => {
    try {
        const id = req.params.id;
        const idUsuario = req.params.idusuario;

        const result = await svc.eliminarDireccionAsync(id, idUsuario);
        if (result) {
            console.log('Direccion eliminada exitosamente');
            res.status(200).json({ message: 'Direccion eliminada exitosamente' });
        } else {
            console.log('Direccion no encontrada');
            res.status(404).send('Direccion no encontrada');
        }
    } catch (error) {
        console.error('Error al eliminar Direccion:', error);
        res.status(500).send('Error Interno');
    }
});

export default router;
