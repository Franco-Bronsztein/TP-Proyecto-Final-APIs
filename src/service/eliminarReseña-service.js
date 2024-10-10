import eliminarReseñaRepository from '../repository/eliminarReseña-Repository.js';

export default class eliminarReseñaService {
    eliminarReseñaAsync = async (comentario, idUsuario) => {
        const repo = new eliminarReseñaRepository();
        const result = await repo.eliminarReseñaAsync(comentario, idUsuario);
        return result;
    }
}
