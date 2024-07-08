import recomendadosRepository from '../repository/recomendados-Repository.js'

export default class recomendadosService{
    getByIdAsync = async (idusuario) => {
        console.log(idusuario)
        const repo = new recomendadosRepository();
        const returnArray = await repo.getByIdAsync(idusuario);
        return returnArray;
    }
}