import direccionRepository from '../repository/direccion-Respository.js'

export default class direccionService{
    getAllAsync = async () => {
        const repo = new direccionRepository();
        const returnArray = await repo.getAllAsync();
        return returnArray;
    }
     getAllByNameAsync = async () => {
        const repo = new direccionRepository();
        const returnArray = await repo.getAllByNameAsync(id);
        return returnArray;
    }
}