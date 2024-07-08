import {Router} from "express"
import carritoService from '../service/carrito-service.js'


const router = Router();
const svc =  new carritoService();
router.get('/:idusuario', async (req, res) => {
    let respuesta;
    const idusuario = req.params.idusuario; 
    const returnArray = await svc.getByIdAsync(idusuario);
    if(returnArray != null)
    {
        respuesta = res.status(200).json(returnArray);
    } else
    {
        respuesta = res.status(500).send('Error Interno')
    }
    return respuesta;
}) 

export default router;