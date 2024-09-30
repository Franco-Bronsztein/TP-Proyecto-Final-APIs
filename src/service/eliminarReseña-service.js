import eliminarReseñaRepository from '../repository/eliminarReseña-Repository.js';

export default class eliminarReseñaService {
    eliminarReseñaAsync = async (idReseña) => {
        const repo = new eliminarReseñaRepository();
        const result = await repo.eliminarReseñaAsync(idReseña);
        return result;
    }
}
