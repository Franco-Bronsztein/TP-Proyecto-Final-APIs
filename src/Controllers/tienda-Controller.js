import {Router} from "express"
import TiendaService from '../service/tienda-service.js'


const router = Router();
const svc =  new TiendaService();


router.get('', async (req, res) => {
    let respuesta;
    const returnArray = await svc.getAllAsync();
    if(returnArray != null)
    {
        respuesta = res.status(200).json(returnArray);
    } else
    {
        respuesta = res.status(500).send('Error Interno')
    }
    return respuesta;
})  // Devuelve Objeto

export default router;