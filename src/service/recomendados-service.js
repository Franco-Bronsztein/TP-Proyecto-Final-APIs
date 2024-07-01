import recomendadosRepository from '../repository/recomendados-Respository.js'

export default class direccionService{
    getByIdAsync = async (idusuario) => {
        const repo = new recomendadosRepository();
        const returnArray = await repo.getByIdAsync(idusuario);
        return returnArray;
    }
}