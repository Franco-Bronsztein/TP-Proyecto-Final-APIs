    import {Router} from "express"
    import agregarReseñaService from '../service/agregarReseña-service.js'

    const router = Router();
    const svc =  new agregarReseñaService();
    router.post('/', async (req, res) => {
        try {
            const result = await svc.agregarReseñaAsync(req.body);
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