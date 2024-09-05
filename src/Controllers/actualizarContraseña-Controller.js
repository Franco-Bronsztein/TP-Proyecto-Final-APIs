import {Router} from "express"
import actualizarContraseñaService from '../service/actualizarContraseña-service.js'

const router = Router();
const svc =  new actualizarContraseñaService();
router.post('/', async (req, res) => {
    try {
        const result = await svc.newPasswordUpdaterAsync(req.body);
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