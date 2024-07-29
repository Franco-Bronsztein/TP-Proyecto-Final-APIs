import pedidoRepository from '../repository/pedido-Repository.js'

export default class PedidoService {
    createPedidoAsync = async (idProducto,idLocal,idUsuario,idPedido) => {
        const repo = new pedidoRepository();
        const result = await repo.createPedidoAsync(idProducto,idLocal,idUsuario,idPedido);
        return result;
    };
}