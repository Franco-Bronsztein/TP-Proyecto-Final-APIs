import recomendadosRepository from '../repository/recomendados-Respository.js'

export default class recomendadosService{
    getByIdAsync = async (idusuario) => {
        const repo = new recomendadosRepository();
        const returnArray = await repo.getByIdAsync(idusuario);
        return returnArray;
    }
}