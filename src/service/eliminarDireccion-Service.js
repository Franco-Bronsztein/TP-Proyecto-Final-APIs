import eliminarDireccionRepository from '../repository/eliminardireccion-Repository.js';

export default class eliminarDireccionService {
    eliminarDireccionAsync = async (id, idUsuario) => {
        const repo = new eliminarDireccionRepository();
        const result = await repo.eliminarDireccionAsync(id, idUsuario);
        return result;
    }
}
