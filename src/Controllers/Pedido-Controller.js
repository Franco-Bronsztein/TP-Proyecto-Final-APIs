import {Router} from "express"
import PedidoService from '../service/pedido-service.js'

const router = Router();
const svc =  new PedidoService();
router.post('/', async (req, res) => {
    const { idusuario, productos, total } = req.body; 
    try {
        const result = await svc.createPedidoAsync(idusuario, productos, total);
        console.log(result)
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