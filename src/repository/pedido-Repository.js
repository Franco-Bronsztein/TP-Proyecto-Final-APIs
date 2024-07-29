import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class PedidoRepository {
    createPedidoAsync = async (idProducto,idLocal,idUsuario,idPedido) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = 'INSERT INTO public."detallePedido" (FK_IDlocal,FK_IDUsuario,FK_IDProducto,FK_IDpedido) VALUES ($idLocal,$idUsuario,$idProducto,$idPedido)';
            const values = [idProducto,idLocal,idUsuario,idPedido];
            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    };
}