import {Router} from "express"
import mostrarReseñasService from '../service/reseñasMostrarTodas-service.js'


const router = Router();
const svc =  new mostrarReseñasService();
router.get('/:idlocal', async (req, res) => {
    let respuesta;
    const idlocal = req.params.idlocal; 
    const returnArray = await svc.getByIdAsync(idlocal);
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