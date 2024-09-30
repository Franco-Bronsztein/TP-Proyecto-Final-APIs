import eliminarReseñaRepository from '../repository/eliminarReseña-Repository.js';

export default class eliminarReseñaService {
    eliminarReseñaAsync = async (idusuario) => {
        const repo = new eliminarReseñaRepository();
        console.log(`Intentando eliminar reseña para el usuario: ${idusuario}`);
        const result = await repo.eliminarReseñaAsync(idusuario);
        console.log(`Resultado del repositorio: ${result}`);
        return result;
    }
}
