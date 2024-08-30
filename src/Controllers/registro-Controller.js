import {Router} from "express"
import registroService from '../service/registro-service.js'

const router = Router();
const svc =  new registroService();
router.post('/', async (req, res) => {
    try {
        const result = await svc.registrarAsync(req.body);
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