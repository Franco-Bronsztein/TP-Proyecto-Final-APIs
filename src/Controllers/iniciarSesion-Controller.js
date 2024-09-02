import { Router } from "express";
import direccionService from "../service/iniciarsesion-service.js";

const router = Router();
const svc = new direccionService();

router.get('/:username/:password', async (req, res) => {
    let respuesta;
    const { username, password } = req.params; 
    const returnArray = await svc.getByUserNameAndPasswordAsync(username, password);
    console.log(username, password)
    if (returnArray != null) {
        respuesta = res.status(200).json(returnArray);
        console.log(returnArray)
    } else {
        respuesta = res.status(500).send('Error Interno');
    }
    return respuesta;
});

export default router;