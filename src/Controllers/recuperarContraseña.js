import { Router } from "express";
import recuperarContraseñaService from "../service/recuperarContraseña-service.js";

const router = Router();
const svc = new recuperarContraseñaService();

router.get('/:mail', async (req, res) => {
    let respuesta;
    const { mail } = req.params;
    const returnArray = await svc.getPaswwordOfuserAsync(mail);
    if (returnArray != null) {
        respuesta = res.status(200).json(returnArray);
        console.log(returnArray)
    } else {
        respuesta = res.status(500).send('Error Interno');
    }
    return respuesta;
});

export default router;