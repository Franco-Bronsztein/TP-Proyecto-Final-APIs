import { Router } from "express";
import eliminarReseñaService from '../service/eliminarReseña-service.js';

const router = Router();
const svc = new eliminarReseñaService();

router.delete('/:comentario/:idusuario', async (req, res) => {
    try {
        const comentario = req.params.comentario;
        const idUsuario = req.params.idusuario;

        console.log(`Comentario recibido: ${comentario}`);
        console.log(`ID de usuario recibido: ${idUsuario}`);

        const result = await svc.eliminarReseñaAsync(comentario, idUsuario);
        if (result) {
            console.log('Reseña eliminada exitosamente');
            res.status(200).json({ message: 'Reseña eliminada exitosamente' });
        } else {
            console.log('Reseña no encontrada');
            res.status(404).send('Reseña no encontrada');
        }
    } catch (error) {
        console.error('Error al eliminar reseña:', error);
        res.status(500).send('Error Interno');
    }
});

export default router;
