import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class agregarAlCarritoRepository {
    createPedidoAsync = async (idPaquete,idusuario,pedidoactivo,cantcomprada) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `INSERT INTO public."detallePedido"(
                "idusuario", "idpaquete", "pedidoactivo", "cantcomprada") VALUES (${idusuario},${idPaquete},${pedidoactivo},${cantcomprada})`;
            const result = await client.query(sql);
            await client.end();
            console.log(result);
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    };
}