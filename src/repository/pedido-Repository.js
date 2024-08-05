import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class PedidoRepository {
    createPedidoAsync = async (idProducto,idLocal,idUsuario,idPedido) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = 'INSERT INTO public."detallePedido" (FK_IDLocal,FK_IDUsuario,FK_IDProducto,FK_IDPedido) VALUES ($1,$2,$3,$4)';
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