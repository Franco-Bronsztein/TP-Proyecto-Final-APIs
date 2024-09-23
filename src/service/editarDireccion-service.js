import editarDireccionRepository from '../repository/editarDireccion-Repository.js';

export default class editarDireccionService {
    editarDireccionAsync = async (direccionData) => {
        const repo = new editarDireccionRepository();
        const result = await repo.editarDireccionAsync(direccionData);
        return result;
    };
}
