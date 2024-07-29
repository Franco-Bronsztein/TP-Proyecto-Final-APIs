import pedidoRepository from '../repository/pedido-Repository.js'

export default class PedidoService {
    createPedidoAsync = async (idusuario, productos, total) => {
        const repo = new pedidoRepository();
        const result = await repo.createPedidoAsync(idusuario, productos, total);
        return result;
    };
}