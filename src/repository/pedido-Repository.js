import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class PedidoRepository {
    createPedidoAsync = async (idProducto,idLocal,idUsuario,idPedido) => {
        let returnArray = null;
        console.log(idProducto,idLocal,idUsuario,idPedido);
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `INSERT INTO public."detallePedido"(
                "FK_IDLocal", "FK_IDUsuario", "FK_IDProducto", "FK_IDPedido") VALUES (${idLocal},${idUsuario},${idProducto},${idPedido})`;
            // const values = [idLocal,idUsuario,idProducto,idPedido];
            const result = await client.query(sql);
            await client.end();
            console.log(result);
            returnArray = result.rows;
        } catch (error) {
            // console.log(error);
        }
        return returnArray;
    };
}