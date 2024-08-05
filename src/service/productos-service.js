import productosRepository from '../repository/productos-Repository.js'

export default class ProductosService{
    getByIdAsync = async (id) => {
        const repo = new productosRepository();
        const returnArray = await repo.getByIdAsync(id);
        return returnArray;
    }
}