import productosRepository from '../repository/productos-Repository.js'

export default class productosService{
    getByIdAsync = async (id) => {
        const repo = new productosRepository();
        const returnArray = await repo.getByIdAsync(id);
        return returnArray;
    }
}