import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class editarDireccionRepository {
    editarDireccionAsync = async (direccionData) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `
            UPDATE public."direccion"
            SET "pais" = '${direccionData.pais}', 
                "ciudad" = '${direccionData.ciudad}', 
                "calle" = '${direccionData.calle}', 
                "detalle" = '${direccionData.detalle}', 
                "idetiqueta" = ${direccionData.idetiqueta}, 
                "Detalledeentrega" = ${direccionData.detalleentrega}, 
                "referencia" = '${direccionData.referencia}'
            WHERE "id" = ${direccionData.id};`;
            
            const result = await client.query(sql);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    };
}
