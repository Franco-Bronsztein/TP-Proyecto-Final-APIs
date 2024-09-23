import agregarReseñaRepository from '../repository/agregarReseña-repository.js'

export default class AgregarCarritoService {
    agregarReseñaAsync = async (reseña) => {
        const repo = new agregarReseñaRepository();
        const result = await repo.agregarReseñaAsync(reseña.cantEstrellas,reseña.infoReseña,reseña.idUsuario,reseña.idLocal);
        return result;
    };
}