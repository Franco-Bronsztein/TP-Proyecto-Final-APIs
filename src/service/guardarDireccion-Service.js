import guardarDireccionRepository from '../repository/guardarDireccion-Repository.js';

export default class guardarDireccionService {
    guardarDireccion = async (direccionItems) => {
        const repo = new guardarDireccionRepository();
        // Asegúrate de pasar el userId
        const result = await repo.guardarDireccion(
            direccionItems.pais, 
            direccionItems.ciudad, 
            direccionItems.calle, 
            direccionItems.referencia, 
            direccionItems.detalledeentrega,
            direccionItems.userId
        );
        return result;
    };
}
