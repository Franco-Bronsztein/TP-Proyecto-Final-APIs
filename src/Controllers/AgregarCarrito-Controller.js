import {Router} from "express"
import agregarCarritoService from '../service/agregarCarrito-service.js'

const router = Router();
const svc =  new agregarCarritoService();
router.post('/', async (req, res) => {
    try {
        const result = await svc.agregarCarritoAsync(req.body);
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