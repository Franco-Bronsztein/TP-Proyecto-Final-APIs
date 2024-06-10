import {Router} from "express"
import direccionService from '../service/direccion-service.js'


const router = Router();
const svc =  new direccionService();
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
}) 

export default router;