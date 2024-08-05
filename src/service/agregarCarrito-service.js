import agregarCarritoRepository from '../repository/agregarCarrito-Repository.js'

export default class AgregarCarritoService {
    createPedidoAsync = async (itemsCarrito) => {
        const repo = new agregarCarritoRepository();
        const result = await repo.agregarCarritoAsync(itemsCarrito.idPaquete,itemsCarrito.idusuario,itemsCarrito.pedidoactivo,itemsCarrito.cantcomprada);
        return result;
    };
}