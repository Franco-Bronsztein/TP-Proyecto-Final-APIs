import carritoRepository from '../repository/carrito-Repository.js'

export default class carritoService{
    getByIdAsync = async (idusuario) => {
        const repo = new carritoRepository();
        const returnArray = await repo.getByIdAsync(idusuario);
        return returnArray;
    }
}