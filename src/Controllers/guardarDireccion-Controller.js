import { Router } from "express";
import guardarDireccionService from '../service/guardarDireccion-Service.js';

const router = Router();
const svc = new guardarDireccionService();

router.post('/', async (req, res) => {
    try {
        // Extraer el ID del usuario del cuerpo de la solicitud
        const userId = req.body.userId; // Asegúrate de que Postman envíe el userId en el body
        if (!userId) {
            return res.status(400).send('ID de usuario no proporcionado');
        }
        
        // Pasar la información junto con el userId a la lógica de guardar dirección
        const result = await svc.guardarDireccion({
            ...req.body,  // Esto incluye pais, ciudad, calle, referencia, detalledeentrega y el userId
            userId
        });

        res.status(200).json(result);
    } catch (error) {
        console.error(error);
        res.status(500).send('Error Interno');
    }
});

export default router;
