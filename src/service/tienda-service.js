import TiendaRepository from '../repository/tienda-Repository.js'

export default class tinedaService{
    getAllAsync = async () => {
        const repo = new TiendaRepository();
        const returnArray = await repo.getAllAsync();
        return returnArray;
    }
    getAllByNameAsync = async () => {
        const repo = new TiendaRepository();
        const returnArray = await repo.getAllByNameAsync();
        return returnArray;
    }
}
    