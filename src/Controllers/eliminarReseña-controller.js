import { Router } from "express";
import eliminarReseñaService from '../service/eliminarReseña-service.js';

const router = Router();
const svc = new eliminarReseñaService();

router.delete('/:id', async (req, res) => {
    try {
        const { id } = req.params;
        console.log(`ID recibido: ${id}`); // Verificar que el ID se está pasando correctamente
        const result = await svc.eliminarReseñaAsync(id);
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
