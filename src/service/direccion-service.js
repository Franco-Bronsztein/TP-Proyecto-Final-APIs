import direccionRepository from '../repository/direccion-Respository.js'

export default class direccionService{
    getByIdAsync = async (idusuario) => {
        const repo = new direccionRepository();
        const returnArray = await repo.getByIdAsync(idusuario);
        return returnArray;
    }
}