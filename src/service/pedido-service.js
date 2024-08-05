import pedidoRepository from '../repository/pedido-Repository.js'

export default class PedidoService {
    createPedidoAsync = async (pedido) => {
        const repo = new pedidoRepository();
        console.log(pedido.idLocal);
        const result = await repo.createPedidoAsync(pedido.idProducto,pedido.idLocal,pedido.idUsuario,pedido.idPedido);
        return result;
    };
}